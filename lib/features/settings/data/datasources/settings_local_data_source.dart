import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pawon_rasa/features/settings/data/models/daily_reminder_model.dart';

abstract class SettingsLocalDataSource {
  Future<void> saveDailyReminders(List<DailyReminderModel> reminders);
  Future<List<DailyReminderModel>> getDailyReminders();
  Future<void> deleteDailyReminder(String id);
  Future<void> saveReminderEnabled(bool enabled);
  Future<bool> isReminderEnabled();
}

class SettingsLocalDataSourceImpl implements SettingsLocalDataSource {
  static const String _remindersKey = 'daily_reminders';
  static const String _reminderEnabledKey = 'reminder_enabled';

  final SharedPreferences sharedPreferences;

  SettingsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveDailyReminders(List<DailyReminderModel> reminders) async {
    final jsonList = reminders.map((r) => jsonEncode(r.toJson())).toList();
    await sharedPreferences.setStringList(_remindersKey, jsonList);
  }

  @override
  Future<List<DailyReminderModel>> getDailyReminders() async {
    final jsonList = sharedPreferences.getStringList(_remindersKey) ?? [];
    return jsonList
        .map((json) => DailyReminderModel.fromJson(jsonDecode(json)))
        .toList();
  }

  @override
  Future<void> deleteDailyReminder(String id) async {
    final reminders = await getDailyReminders();
    reminders.removeWhere((r) => r.id == id);
    await saveDailyReminders(reminders);
  }

  @override
  Future<void> saveReminderEnabled(bool enabled) async {
    await sharedPreferences.setBool(_reminderEnabledKey, enabled);
  }

  @override
  Future<bool> isReminderEnabled() async {
    return sharedPreferences.getBool(_reminderEnabledKey) ?? false;
  }
}
