import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class RemoveFavoriteUseCase {
  final FavoriteRepository _repository;

  RemoveFavoriteUseCase(this._repository);

  Future<Either<Failure, Unit>> call(String restaurantId) {
    return _repository.removeFavorite(restaurantId);
  }
}
