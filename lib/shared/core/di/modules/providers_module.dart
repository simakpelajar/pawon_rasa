import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/shared/core/providers/card_expansion_controller.dart';

/// Register global providers yang digunakan di banyak screen
void registerProviders(GetIt getIt) {
  // Card Expansion Controller - Global state untuk expand/collapse cards
  getIt.registerLazySingleton<CardExpansionController>(
    () => CardExpansionController(),
  );
}
