import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/features/home/domain/repositories/restaurant_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class SearchRestaurantsUseCase {
  final RestaurantRepository repository;

  SearchRestaurantsUseCase({required this.repository});

  Future<Either<Failure, List<RestaurantEntity>>> call(String query) async {
    return await repository.searchRestaurants(query);
  }
}
