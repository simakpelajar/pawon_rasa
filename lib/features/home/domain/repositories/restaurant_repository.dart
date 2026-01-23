import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<RestaurantEntity>>> getRestaurants();
  Future<Either<Failure, List<RestaurantEntity>>> searchRestaurants(
      String query);
}
