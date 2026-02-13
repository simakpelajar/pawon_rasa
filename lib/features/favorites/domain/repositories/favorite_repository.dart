import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, List<FavoriteRestaurantEntity>>> getAllFavorites();
  Future<Either<Failure, bool>> isFavorite(String restaurantId);
  Future<Either<Failure, Unit>> addFavorite(FavoriteRestaurantEntity restaurant);
  Future<Either<Failure, Unit>> removeFavorite(String restaurantId);
}
