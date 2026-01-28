import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/repositories/restaurant_detail_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class AddReviewUseCase {
  final RestaurantDetailRepository repository;

  AddReviewUseCase({required this.repository});

  Future<Either<Failure, List<CustomerReviewEntity>>> call({
    required String id,
    required String name,
    required String review,
  }) async {
    return await repository.addReview(id: id, name: name, review: review);
  }
}
