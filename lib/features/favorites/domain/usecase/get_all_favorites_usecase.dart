import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class GetAllFavoritesUseCase {
  final FavoriteRepository _repository;

  GetAllFavoritesUseCase(this._repository);

  Future<Either<Failure, List<FavoriteRestaurantEntity>>> call() {
    return _repository.getAllFavorites();
  }
}
