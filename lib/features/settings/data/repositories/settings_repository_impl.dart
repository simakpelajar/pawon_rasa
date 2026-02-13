import 'package:pawon_rasa/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:pawon_rasa/features/settings/data/mappers/daily_reminder_mapper.dart';
import 'package:pawon_rasa/features/settings/domain/entities/daily_reminder_entity.dart';
import 'package:pawon_rasa/features/settings/domain/repositories/settings_repository.dart';
import 'package:pawon_rasa/shared/core/types/result.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  Future<Result<void>> saveDailyReminders(
    List<DailyReminderEntity> reminders,
  ) async {
    return await guard(() async {
      final models = reminders.map(DailyReminderMapper.fromEntity).toList();
      await localDataSource.saveDailyReminders(models);
    });
  }

  @override
  Future<Result<List<DailyReminderEntity>>> getDailyReminders() async {
    return await guard(() async {
      final models = await localDataSource.getDailyReminders();
      return models.map(DailyReminderMapper.toEntity).toList();
    });
  }

  @override
  Future<Result<void>> deleteDailyReminder(String id) async {
    return await guard(() async {
      await localDataSource.deleteDailyReminder(id);
    });
  }

  @override
  Future<Result<void>> saveReminderEnabled(bool enabled) async {
    return await guard(() async {
      await localDataSource.saveReminderEnabled(enabled);
    });
  }

  @override
  Future<Result<bool>> isReminderEnabled() async {
    return await guard(() async {
      return await localDataSource.isReminderEnabled();
    });
  }
}
