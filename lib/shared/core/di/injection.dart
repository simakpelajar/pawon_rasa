import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/features/detail-restaurant/di/detail_di_module.dart';
import 'package:pawon_rasa/features/favorites/di/favorites_di_module.dart';
import 'package:pawon_rasa/features/home/di/home_di_module.dart';
import 'package:pawon_rasa/features/settings/di/settings_di_module.dart';
import 'package:pawon_rasa/shared/core/di/modules/network_module.dart';
import 'package:pawon_rasa/shared/core/di/modules/providers_module.dart';
import 'package:pawon_rasa/shared/core/di/modules/router_module.dart';
import 'package:pawon_rasa/shared/core/di/modules/theme_module.dart';

final getIt = GetIt.instance;


Future<void> configureDependencies() async {
  // Shared layer dependencies
  await registerNetworkDependencies(getIt);
  registerRouterDependencies(getIt);
  await registerThemeDependencies(getIt);
  registerProviders(getIt); // Register global providers

  // Feature dependencies
  registerHomeDependencies(getIt);
  registerDetailDependencies(getIt);
  registerFavoritesDependencies(getIt);
  registerSettingsDependencies(getIt);
}
