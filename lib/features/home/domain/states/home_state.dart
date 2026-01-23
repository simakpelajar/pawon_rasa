import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

sealed class HomeState {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<RestaurantEntity> restaurants) loaded,
    required T Function(Failure failure) error,
  }) {
    if (this is HomeInitial) return initial();
    if (this is HomeLoading) return loading();
    if (this is HomeLoaded) return loaded((this as HomeLoaded).restaurants);
    if (this is HomeError) return error((this as HomeError).failure);
    throw Exception('Unknown state');
  }
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<RestaurantEntity> restaurants;
  HomeLoaded(this.restaurants);
}

class HomeError extends HomeState {
  final Failure failure;
  HomeError(this.failure);
}
