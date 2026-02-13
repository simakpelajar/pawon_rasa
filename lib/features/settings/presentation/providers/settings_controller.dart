import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:pawon_rasa/features/settings/domain/entities/daily_reminder_entity.dart';
import 'package:pawon_rasa/features/settings/domain/usecases/settings_usecases.dart';
import 'package:pawon_rasa/features/settings/presentation/states/settings_state.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';
import 'package:pawon_rasa/shared/core/services/notification_service.dart';
import 'package:pawon_rasa/shared/core/types/result.dart';

class SettingsController extends ChangeNotifier {
  final GetDailyReminders getDailyReminders;
  final SaveDailyReminders saveDailyReminders;
  final DeleteDailyReminder deleteDailyReminder;
  final SaveReminderEnabled saveReminderEnabled;
  final GetReminderEnabled getReminderEnabled;
  final NotificationService notificationService;

  SettingsState _state = SettingsInitial();

  SettingsState get state => _state;

  SettingsController({
    required this.getDailyReminders,
    required this.saveDailyReminders,
    required this.deleteDailyReminder,
    required this.saveReminderEnabled,
    required this.getReminderEnabled,
    required this.notificationService,
  });

  Future<void> loadSettings() async {
    _setState(SettingsLoading());

    final remindersResult = await getDailyReminders();
    final enabledResult = await getReminderEnabled();

    if (remindersResult is Err<List<DailyReminderEntity>>) {
      _setState(SettingsError(remindersResult.failure));
      return;
    }

    if (enabledResult is Err<bool>) {
      _setState(SettingsError(enabledResult.failure));
      return;
    }

    final reminders = (remindersResult as Ok<List<DailyReminderEntity>>).value;
    final enabled = (enabledResult as Ok<bool>).value;

    _setState(SettingsLoaded(reminders: reminders, isReminderEnabled: enabled));
    await rescheduleAllReminders();
  }

  Future<bool> toggleReminderEnabled() async {
    if (_state is! SettingsLoaded) return false;

    final currentState = _state as SettingsLoaded;
    final newState = !currentState.isReminderEnabled;

    final result = await saveReminderEnabled(newState);
    if (result is Err<void>) {
      _state = SettingsError(result.failure);
      notifyListeners();
      return false;
    }

    return newState
        ? _enableAllReminders(currentState)
        : _disableAllReminders(currentState);
  }

  Future<bool> addReminder({
    required String title,
    required String description,
    required String time,
  }) async {
    if (_state is! SettingsLoaded) return false;

    final currentState = _state as SettingsLoaded;
    final newReminder = DailyReminderEntity(
      id: const Uuid().v4(),
      title: title,
      description: description,
      time: time,
      isEnabled: true,
      createdAt: DateTime.now(),
    );

    final updatedReminders = [...currentState.reminders, newReminder];
    final result = await saveDailyReminders(updatedReminders);
    if (result is Err<void>) {
      _setState(SettingsError(result.failure));
      return false;
    }

    if (currentState.isReminderEnabled) {
      debugPrint('[Reminder] add: schedule for "$title" at $time');
      _scheduleReminder(newReminder);
    }

    _setState(currentState.copyWith(reminders: updatedReminders));
    return true;
  }

  Future<bool> updateReminder({
    required String id,
    required String title,
    required String description,
    required String time,
    required bool isEnabled,
  }) async {
    if (_state is! SettingsLoaded) return false;

    final currentState = _state as SettingsLoaded;
    final updatedReminders = currentState.reminders.map((reminder) {
      if (reminder.id == id) {
        return reminder.copyWith(
          title: title,
          description: description,
          time: time,
          isEnabled: isEnabled,
        );
      }
      return reminder;
    }).toList();

    final result = await saveDailyReminders(updatedReminders);
    if (result is Err<void>) {
      _setState(SettingsError(result.failure));
      return false;
    }

    final updatedReminder = updatedReminders.firstWhere((r) => r.id == id);
    await notificationService.cancelReminder(updatedReminder.id.hashCode);

    if (currentState.isReminderEnabled && isEnabled) {
      _scheduleReminder(updatedReminder);
    }

    _setState(currentState.copyWith(reminders: updatedReminders));
    return true;
  }

  Future<bool> removeReminder(String id) async {
    if (_state is! SettingsLoaded) return false;

    final currentState = _state as SettingsLoaded;
    final result = await deleteDailyReminder(id);
    if (result is Err<void>) {
      _setState(SettingsError(result.failure));
      return false;
    }

    await notificationService.cancelReminder(id.hashCode);
    final updatedReminders =
        currentState.reminders.where((r) => r.id != id).toList();
    _setState(currentState.copyWith(reminders: updatedReminders));
    return true;
  }

  Future<void> toggleReminderStatus(String id) async {
    if (_state is! SettingsLoaded) return;

    final currentState = _state as SettingsLoaded;
    final reminder = currentState.reminders.firstWhere((r) => r.id == id);
    final newStatus = !reminder.isEnabled;

    await updateReminder(
      id: id,
      title: reminder.title,
      description: reminder.description,
      time: reminder.time,
      isEnabled: newStatus,
    );
  }

  Future<bool> scheduleTestReminderNow() async {
    if (_state is! SettingsLoaded) return false;

    final currentState = _state as SettingsLoaded;
    if (!currentState.isReminderEnabled) return false;

    final now = DateTime.now();
    await notificationService.showNotification(
      title: AppStrings.testReminderTitle,
      body: AppStrings.testReminderDescription,
      id: now.millisecondsSinceEpoch.remainder(2147483647),
    );

    return true;
  }

  void _setState(SettingsState state) {
    _state = state;
    notifyListeners();
  }

  void _scheduleReminder(DailyReminderEntity reminder) {
    notificationService.scheduleDailyReminder(
      title: reminder.title,
      body: reminder.description,
      time: reminder.time,
      id: reminder.id.hashCode,
    );
  }

  DailyReminderEntity _buildDefaultReminder() {
    return DailyReminderEntity(
      id: const Uuid().v4(),
      title: AppStrings.defaultReminderTitle,
      description: AppStrings.defaultReminderDescription,
      time: AppStrings.defaultReminderTime,
      isEnabled: true,
      createdAt: DateTime.now(),
    );
  }

  Future<void> rescheduleAllReminders() async {
    if (_state is! SettingsLoaded) return;

    final currentState = _state as SettingsLoaded;

    // Cancel all first
    await notificationService.cancelAllReminders();

    // Reschedule enabled reminders if feature is enabled
    if (currentState.isReminderEnabled) {
      for (var reminder in currentState.reminders) {
        if (reminder.isEnabled) {
          _scheduleReminder(reminder);
        }
      }
    }
  }

  Future<bool> _enableAllReminders(SettingsLoaded currentState) async {
    if (currentState.reminders.isEmpty) {
      final defaultReminder = _buildDefaultReminder();
      final saveResult = await saveDailyReminders([defaultReminder]);

      if (saveResult is Err<void>) {
        _setState(SettingsError(saveResult.failure));
        return false;
      }

      _scheduleReminder(defaultReminder);
      _setState(currentState.copyWith(
        reminders: [defaultReminder],
        isReminderEnabled: true,
      ));
      return true;
    }

    final updatedReminders = currentState.reminders
        .map((reminder) => reminder.copyWith(isEnabled: true))
        .toList();
    final saveResult = await saveDailyReminders(updatedReminders);

    if (saveResult is Err<void>) {
      _setState(SettingsError(saveResult.failure));
      return false;
    }

    for (var reminder in updatedReminders) {
      _scheduleReminder(reminder);
    }

    _setState(currentState.copyWith(
      reminders: updatedReminders,
      isReminderEnabled: true,
    ));
    return true;
  }

  Future<bool> _disableAllReminders(SettingsLoaded currentState) async {
    final updatedReminders = currentState.reminders
        .map((reminder) => reminder.copyWith(isEnabled: false))
        .toList();
    final saveResult = await saveDailyReminders(updatedReminders);

    if (saveResult is Err<void>) {
      _setState(SettingsError(saveResult.failure));
      return false;
    }

    await notificationService.cancelAllReminders();
    _setState(currentState.copyWith(
      reminders: updatedReminders,
      isReminderEnabled: false,
    ));
    return true;
  }
}
