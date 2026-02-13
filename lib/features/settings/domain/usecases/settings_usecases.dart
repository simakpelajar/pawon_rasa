import 'package:pawon_rasa/features/settings/domain/entities/daily_reminder_entity.dart';
import 'package:pawon_rasa/features/settings/domain/repositories/settings_repository.dart';
import 'package:pawon_rasa/shared/core/types/result.dart';

class SaveDailyReminders {
  final SettingsRepository repository;

  SaveDailyReminders({required this.repository});

  Future<Result<void>> call(List<DailyReminderEntity> reminders) {
    return repository.saveDailyReminders(reminders);
  }
}

class GetDailyReminders {
  final SettingsRepository repository;

  GetDailyReminders({required this.repository});

  Future<Result<List<DailyReminderEntity>>> call() {
    return repository.getDailyReminders();
  }
}

class DeleteDailyReminder {
  final SettingsRepository repository;

  DeleteDailyReminder({required this.repository});

  Future<Result<void>> call(String id) {
    return repository.deleteDailyReminder(id);
  }
}

class SaveReminderEnabled {
  final SettingsRepository repository;

  SaveReminderEnabled({required this.repository});

  Future<Result<void>> call(bool enabled) {
    return repository.saveReminderEnabled(enabled);
  }
}

class GetReminderEnabled {
  final SettingsRepository repository;

  GetReminderEnabled({required this.repository});

  Future<Result<bool>> call() {
    return repository.isReminderEnabled();
  }
}
