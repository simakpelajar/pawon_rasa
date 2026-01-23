import 'package:flutter/material.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/features/home/domain/states/home_state.dart';
import 'package:pawon_rasa/features/home/domain/types/city_filter.dart';
import 'package:pawon_rasa/features/home/domain/usecase/get_restaurants_usecase.dart';
import 'package:pawon_rasa/features/home/domain/usecase/search_restaurants_usecase.dart';

class HomeController extends ChangeNotifier {
  final GetRestaurantsUseCase getRestaurantsUseCase;
  final SearchRestaurantsUseCase searchRestaurantsUseCase;

  HomeController({
    required this.getRestaurantsUseCase,
    required this.searchRestaurantsUseCase,
  });

  HomeState _state = HomeInitial();
  HomeState get state => _state;

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  String _selectedCity = CityFilter.all;
  String get selectedCity => _selectedCity;

  Future<void> loadRestaurants() async {
    _state = HomeLoading();
    notifyListeners();

    final result = await getRestaurantsUseCase.call();

    result.fold(
      (failure) {
        _state = HomeError(failure);
        notifyListeners();
      },
      (restaurants) {
        _applyFilters(restaurants);
      },
    );
  }

  Future<void> searchRestaurants(String query) async {
    _searchQuery = query;

    if (query.isEmpty) {
      loadRestaurants();
      return;
    }

    _state = HomeLoading();
    notifyListeners();

    final result = await searchRestaurantsUseCase.call(query);

    result.fold(
      (failure) {
        _state = HomeError(failure);
        notifyListeners();
      },
      (restaurants) {
        _applyFilters(restaurants);
      },
    );
  }

  void filterByCity(String city) {
    _selectedCity = city;

    // Re-apply current search/load with new filter
    if (_searchQuery.isNotEmpty) {
      searchRestaurants(_searchQuery);
    } else {
      loadRestaurants();
    }
  }

  void clearSearch() {
    _searchQuery = '';
    _selectedCity = CityFilter.all;
    loadRestaurants();
  }

  void _applyFilters(List<dynamic> restaurants) {
    List<dynamic> filtered = restaurants;

    if (!CityFilter.isAllCities(_selectedCity)) {
      filtered =
          restaurants
              .where((r) => r.city.toLowerCase() == _selectedCity.toLowerCase())
              .toList();
    }

    _state = HomeLoaded(filtered.cast<RestaurantEntity>());
    notifyListeners();
  }
}
