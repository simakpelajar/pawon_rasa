import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

abstract class RestaurantDetailRepository {
  Future<Either<Failure, RestaurantDetailEntity>> getRestaurantDetail(
    String id,
  );
  Future<Either<Failure, List<CustomerReviewEntity>>> addReview({
    required String id,
    required String name,
    required String review,
  });
}
