import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/shared/core/providers/theme_controller.dart';

void registerThemeDependencies(GetIt getIt) {
  getIt.registerLazySingleton<ThemeController>(
    () => ThemeController(),
  );
}
