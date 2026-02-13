import 'package:pawon_rasa/features/settings/domain/entities/daily_reminder_entity.dart';
import 'package:pawon_rasa/shared/core/types/result.dart';

abstract class SettingsRepository {
  Future<Result<void>> saveDailyReminders(List<DailyReminderEntity> reminders);
  Future<Result<List<DailyReminderEntity>>> getDailyReminders();
  Future<Result<void>> deleteDailyReminder(String id);
  Future<Result<void>> saveReminderEnabled(bool enabled);
  Future<Result<bool>> isReminderEnabled();
}
