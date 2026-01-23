import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

sealed class DetailState {}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailLoaded extends DetailState {
  final RestaurantDetailEntity detail;
  DetailLoaded(this.detail);
}

class DetailError extends DetailState {
  final Failure failure;
  DetailError(this.failure);
}
