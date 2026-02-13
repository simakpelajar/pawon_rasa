import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/favorites/data/datasources/favorite_local_datasource.dart';
import 'package:pawon_rasa/features/favorites/data/mappers/favorite_restaurant_mapper.dart';
import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource _localDataSource;

  FavoriteRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<FavoriteRestaurantEntity>>> getAllFavorites() async {
    try {
      final result = await _localDataSource.getAllFavorites();
      final favorites = result
          .map((map) => FavoriteRestaurantMapper.fromMap(map))
          .toList();
      return Right(favorites);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> isFavorite(String restaurantId) async {
    try {
      final result = await _localDataSource.isFavorite(restaurantId);
      return Right(result);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> addFavorite(FavoriteRestaurantEntity restaurant) async {
    try {
      final map = FavoriteRestaurantMapper.toMap(restaurant);
      await _localDataSource.insertFavorite(map);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeFavorite(String restaurantId) async {
    try {
      await _localDataSource.deleteFavorite(restaurantId);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
