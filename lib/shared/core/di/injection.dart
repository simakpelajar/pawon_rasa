import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/features/detail-restaurant/di/detail_di_module.dart';
import 'package:pawon_rasa/features/home/di/home_di_module.dart';
import 'package:pawon_rasa/shared/core/di/modules/network_module.dart';
import 'package:pawon_rasa/shared/core/di/modules/router_module.dart';
import 'package:pawon_rasa/shared/core/di/modules/theme_module.dart';

final getIt = GetIt.instance;

/// Initialize all dependencies for the application
///
/// Structure:
/// 1. Shared dependencies (Network, Router, Theme)
/// 2. Feature dependencies (Home, Detail)
Future<void> configureDependencies() async {
  // Shared layer dependencies
  registerNetworkDependencies(getIt);
  registerRouterDependencies(getIt);
  registerThemeDependencies(getIt);

  // Feature dependencies
  registerHomeDependencies(getIt);
  registerDetailDependencies(getIt);
}
