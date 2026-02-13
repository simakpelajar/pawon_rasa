import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/favorites/domain/repositories/favorite_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class IsFavoriteUseCase {
  final FavoriteRepository _repository;

  IsFavoriteUseCase(this._repository);

  Future<Either<Failure, bool>> call(String restaurantId) {
    return _repository.isFavorite(restaurantId);
  }
}
