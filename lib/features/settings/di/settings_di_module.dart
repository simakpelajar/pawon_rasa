import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pawon_rasa/features/settings/data/datasources/settings_local_data_source.dart';
import 'package:pawon_rasa/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:pawon_rasa/features/settings/domain/repositories/settings_repository.dart';
import 'package:pawon_rasa/features/settings/domain/usecases/settings_usecases.dart';
import 'package:pawon_rasa/features/settings/presentation/providers/settings_controller.dart';
import 'package:pawon_rasa/shared/core/services/notification_service.dart';

void registerSettingsDependencies(GetIt getIt) {
  // Data Source
  getIt.registerSingleton<SettingsLocalDataSource>(
    SettingsLocalDataSourceImpl(
      sharedPreferences: getIt<SharedPreferences>(),
    ),
  );

  // Repository
  getIt.registerSingleton<SettingsRepository>(
    SettingsRepositoryImpl(
      localDataSource: getIt<SettingsLocalDataSource>(),
    ),
  );

  // Use Cases
  getIt.registerSingleton<GetDailyReminders>(
    GetDailyReminders(repository: getIt<SettingsRepository>()),
  );

  getIt.registerSingleton<SaveDailyReminders>(
    SaveDailyReminders(repository: getIt<SettingsRepository>()),
  );

  getIt.registerSingleton<DeleteDailyReminder>(
    DeleteDailyReminder(repository: getIt<SettingsRepository>()),
  );

  getIt.registerSingleton<SaveReminderEnabled>(
    SaveReminderEnabled(repository: getIt<SettingsRepository>()),
  );

  getIt.registerSingleton<GetReminderEnabled>(
    GetReminderEnabled(repository: getIt<SettingsRepository>()),
  );

  // Notification Service (Singleton)
  getIt.registerSingleton<NotificationService>(
    NotificationService(),
  );

  // Controller
  getIt.registerSingleton<SettingsController>(
    SettingsController(
      getDailyReminders: getIt<GetDailyReminders>(),
      saveDailyReminders: getIt<SaveDailyReminders>(),
      deleteDailyReminder: getIt<DeleteDailyReminder>(),
      saveReminderEnabled: getIt<SaveReminderEnabled>(),
      getReminderEnabled: getIt<GetReminderEnabled>(),
      notificationService: getIt<NotificationService>(),
    ),
  );
}
