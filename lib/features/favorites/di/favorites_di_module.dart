import 'package:get_it/get_it.dart';
import 'package:pawon_rasa/features/favorites/data/datasources/favorite_local_datasource.dart';
import 'package:pawon_rasa/features/favorites/data/repositories/favorite_repository_impl.dart';
import 'package:pawon_rasa/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/add_favorite_usecase.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/get_all_favorites_usecase.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/is_favorite_usecase.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/remove_favorite_usecase.dart';
import 'package:pawon_rasa/features/favorites/presentation/providers/favorites_controller.dart';
import 'package:pawon_rasa/shared/core/infrastructure/database/database_helper.dart';

void registerFavoritesDependencies(GetIt getIt) {
  // Database
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper.instance);

  // Data Source
  getIt.registerLazySingleton<FavoriteLocalDataSource>(
    () => FavoriteLocalDataSource(getIt()),
  );

  // Repository
  getIt.registerLazySingleton<FavoriteRepository>(
    () => FavoriteRepositoryImpl(getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton(() => GetAllFavoritesUseCase(getIt()));
  getIt.registerLazySingleton(() => AddFavoriteUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveFavoriteUseCase(getIt()));
  getIt.registerLazySingleton(() => IsFavoriteUseCase(getIt()));

  // Controller
  getIt.registerLazySingleton(
    () => FavoritesController(
      getIt(),
      getIt(),
      getIt(),
      getIt(),
    ),
  );
}
