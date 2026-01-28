import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pawon_rasa/shared/core/infrastructure/routes/app_router.dart';

void registerRouterDependencies(GetIt getIt) {
  getIt.registerLazySingleton<GoRouter>(() => AppRouter.create());
}
