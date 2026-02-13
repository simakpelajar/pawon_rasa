import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

sealed class FavoritesState {
  T when<T>({
    required T Function() initial,
    required T Function() loading,
    required T Function(List<FavoriteRestaurantEntity> favorites) loaded,
    required T Function(Failure failure) error,
  }) {
    if (this is FavoritesInitial) return initial();
    if (this is FavoritesLoading) return loading();
    if (this is FavoritesLoaded) {
      return loaded((this as FavoritesLoaded).favorites);
    }
    if (this is FavoritesError) return error((this as FavoritesError).failure);
    throw Exception('Unknown state');
  }
}

class FavoritesInitial extends FavoritesState {}

class FavoritesLoading extends FavoritesState {}

class FavoritesLoaded extends FavoritesState {
  final List<FavoriteRestaurantEntity> favorites;
  FavoritesLoaded(this.favorites);
}

class FavoritesError extends FavoritesState {
  final Failure failure;
  FavoritesError(this.failure);
}
