import 'package:flutter/material.dart';
import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/features/favorites/presentation/states/favorites_state.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/add_favorite_usecase.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/get_all_favorites_usecase.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/is_favorite_usecase.dart';
import 'package:pawon_rasa/features/favorites/domain/usecase/remove_favorite_usecase.dart';

class FavoritesController extends ChangeNotifier {
  final GetAllFavoritesUseCase _getAllFavoritesUseCase;
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;

  FavoritesController(
    this._getAllFavoritesUseCase,
    this._addFavoriteUseCase,
    this._removeFavoriteUseCase,
    this._isFavoriteUseCase,
  );

  FavoritesState _state = FavoritesInitial();
  FavoritesState get state => _state;

  Set<String> _favoriteIds = {};


  final Map<String, bool> _expandedCards = {};


  bool isFavoriteId(String restaurantId) {
    return _favoriteIds.contains(restaurantId);
  }


  bool isDescriptionExpanded(String restaurantId) {
    return _expandedCards[restaurantId] ?? false;
  }

  void toggleDescriptionExpanded(String restaurantId) {
    _expandedCards[restaurantId] = !(_expandedCards[restaurantId] ?? false);
    notifyListeners();
  }

 
  void _setState(FavoritesState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> loadFavorites() async {
    _setState(FavoritesLoading());

    final result = await _getAllFavoritesUseCase();
    result.fold(
      (failure) => _setState(FavoritesError(failure)),
      (favorites) {
        _favoriteIds = favorites.map((fav) => fav.id).toSet();
        _setState(FavoritesLoaded(favorites));
      },
    );
  }

  Future<void> _refreshFavoritesSilently() async {
    final result = await _getAllFavoritesUseCase();
    result.fold(
      (failure) => _setState(FavoritesError(failure)),
      (favorites) {
        _favoriteIds = favorites.map((fav) => fav.id).toSet();
        _expandedCards.removeWhere((id, _) => !_favoriteIds.contains(id));
        _setState(FavoritesLoaded(favorites));
      },
    );
  }

  Future<bool> checkIsFavorite(String restaurantId) async {
    final result = await _isFavoriteUseCase(restaurantId);
    return result.fold((_) => false, (isFav) => isFav);
  }


  Future<bool> toggleFavorite(FavoriteRestaurantEntity restaurant) async {
    final isFav = isFavoriteId(restaurant.id);

    if (isFav) {
      final result = await _removeFavoriteUseCase(restaurant.id);
      final success = result.fold(
        (failure) {
          _setState(FavoritesError(failure));
          return false;
        },
        (_) => true,
      );
      if (success) {
        _favoriteIds.remove(restaurant.id);
        await _refreshFavoritesSilently();
      }
      return success;
    } else {
      final result = await _addFavoriteUseCase(restaurant);
      final success = result.fold(
        (failure) {
          _setState(FavoritesError(failure));
          return false;
        },
        (_) => true,
      );
      if (success) {
        _favoriteIds.add(restaurant.id);
        await _refreshFavoritesSilently();
      }
      return success;
    }
  }


  Future<void> removeFavorite(String restaurantId) async {
    final result = await _removeFavoriteUseCase(restaurantId);
    result.fold(
      (failure) => _setState(FavoritesError(failure)),
      (_) {
        _favoriteIds.remove(restaurantId);
        _refreshFavoritesSilently();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
