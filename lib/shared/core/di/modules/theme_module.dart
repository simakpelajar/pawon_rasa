import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pawon_rasa/shared/core/providers/theme_controller.dart';

Future<void> registerThemeDependencies(GetIt getIt) async {
  // SharedPreferences sudah didaftarkan di network_module.dart
  // Jadi kita hanya perlu mengambilnya dari getIt
  final prefs = getIt<SharedPreferences>();

  getIt.registerLazySingleton<ThemeController>(
    () => ThemeController(prefs),
  );
}
