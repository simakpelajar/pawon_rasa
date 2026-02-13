import 'package:pawon_rasa/features/settings/domain/entities/daily_reminder_entity.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

sealed class SettingsState {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(
      List<DailyReminderEntity> reminders,
      bool isReminderEnabled,
    )
        loaded,
    required T Function(Failure failure) error,
  }) {
    if (this is SettingsInitial) return initial();
    if (this is SettingsLoading) return loading();
    if (this is SettingsLoaded) {
      final state = this as SettingsLoaded;
      return loaded(state.reminders, state.isReminderEnabled);
    }
    if (this is SettingsError) return error((this as SettingsError).failure);
    throw Exception('Unknown state');
  }
}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

class SettingsLoaded extends SettingsState {
  final List<DailyReminderEntity> reminders;
  final bool isReminderEnabled;

  SettingsLoaded({
    required this.reminders,
    required this.isReminderEnabled,
  });

  SettingsLoaded copyWith({
    List<DailyReminderEntity>? reminders,
    bool? isReminderEnabled,
  }) {
    return SettingsLoaded(
      reminders: reminders ?? this.reminders,
      isReminderEnabled: isReminderEnabled ?? this.isReminderEnabled,
    );
  }
}

class SettingsError extends SettingsState {
  final Failure failure;

  SettingsError(this.failure);
}
