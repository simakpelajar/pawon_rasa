import 'package:pawon_rasa/features/settings/data/models/daily_reminder_model.dart';
import 'package:pawon_rasa/features/settings/domain/entities/daily_reminder_entity.dart';

class DailyReminderMapper {
  const DailyReminderMapper._();

  static DailyReminderEntity toEntity(DailyReminderModel model) {
    return DailyReminderEntity(
      id: model.id,
      title: model.title,
      description: model.description,
      time: model.time,
      isEnabled: model.isEnabled,
      createdAt: model.createdAt,
    );
  }

  static DailyReminderModel fromEntity(DailyReminderEntity entity) {
    return DailyReminderModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      time: entity.time,
      isEnabled: entity.isEnabled,
      createdAt: entity.createdAt,
    );
  }
}
