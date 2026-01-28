import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/features/home/data/datasources/restaurant_remote_datasource.dart';
import 'package:pawon_rasa/features/home/data/repositories/restaurant_repository_impl.dart';
import 'package:pawon_rasa/features/home/domain/repositories/restaurant_repository.dart';
import 'package:pawon_rasa/features/home/domain/usecase/get_restaurants_usecase.dart';
import 'package:pawon_rasa/features/home/domain/usecase/search_restaurants_usecase.dart';
import 'package:pawon_rasa/features/home/presentation/providers/home_controller.dart';

void registerHomeDependencies(GetIt getIt) {
  // Remote Datasources
  getIt.registerLazySingleton<RestaurantRemoteDatasource>(
    () => RestaurantRemoteDatasource(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(remoteDatasource: getIt()),
  );

  // Use Cases
  getIt.registerFactory(() => GetRestaurantsUseCase(repository: getIt()));
  getIt.registerFactory(() => SearchRestaurantsUseCase(repository: getIt()));

  // Controllers
  getIt.registerFactory(
    () => HomeController(
      getRestaurantsUseCase: getIt(),
      searchRestaurantsUseCase: getIt(),
    ),
  );
}
