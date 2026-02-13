import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class AddFavoriteUseCase {
  final FavoriteRepository _repository;

  AddFavoriteUseCase(this._repository);

  Future<Either<Failure, Unit>> call(FavoriteRestaurantEntity restaurant) {
    return _repository.addFavorite(restaurant);
  }
}
