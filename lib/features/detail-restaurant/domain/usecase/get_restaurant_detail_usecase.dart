import 'package:dartz/dartz.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/repositories/restaurant_detail_repository.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class GetRestaurantDetailUseCase {
  final RestaurantDetailRepository repository;

  GetRestaurantDetailUseCase({required this.repository});

  Future<Either<Failure, RestaurantDetailEntity>> call(String id) async {
    return await repository.getRestaurantDetail(id);
  }
}
