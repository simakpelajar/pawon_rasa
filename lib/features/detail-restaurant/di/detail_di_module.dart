import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/features/detail-restaurant/data/datasources/restaurant_detail_remote_datasource.dart';
import 'package:pawon_rasa/features/detail-restaurant/data/repositories/restaurant_detail_repository_impl.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/repositories/restaurant_detail_repository.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/usecase/add_review_usecase.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/usecase/get_restaurant_detail_usecase.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/providers/detail_controller.dart';

void registerDetailDependencies(GetIt getIt) {
  // Remote Datasources
  getIt.registerLazySingleton<RestaurantDetailRemoteDatasource>(
    () => RestaurantDetailRemoteDatasource(getIt()),
  );

  // Repositories
  getIt.registerLazySingleton<RestaurantDetailRepository>(
    () => RestaurantDetailRepositoryImpl(remoteDatasource: getIt()),
  );

  // Use Cases
  getIt.registerFactory(() => GetRestaurantDetailUseCase(repository: getIt()));
  getIt.registerFactory(() => AddReviewUseCase(repository: getIt()));

  // Controllers
  getIt.registerFactory(
    () => DetailController(
      getRestaurantDetailUseCase: getIt(),
      addReviewUseCase: getIt(),
    ),
  );
}
