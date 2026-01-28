import 'package:flutter/material.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/states/detail_state.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/usecase/add_review_usecase.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/usecase/get_restaurant_detail_usecase.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class DetailController extends ChangeNotifier {
  final GetRestaurantDetailUseCase getRestaurantDetailUseCase;
  final AddReviewUseCase addReviewUseCase;

  DetailController({
    required this.getRestaurantDetailUseCase,
    required this.addReviewUseCase,
  });

  DetailState _state = DetailInitial();
  DetailState get state => _state;

  bool _isAddingReview = false;
  bool get isAddingReview => _isAddingReview;

  String? _reviewErrorMessage;
  String? get reviewErrorMessage => _reviewErrorMessage;

  Future<void> loadRestaurantDetail(String id) async {
    _state = DetailLoading();
    notifyListeners();

    final result = await getRestaurantDetailUseCase.call(id);

    result.fold(
      (failure) {
        _state = DetailError(failure);
        notifyListeners();
      },
      (detail) {
        _state = DetailLoaded(detail);
        notifyListeners();
      },
    );
  }

  Future<void> addReview({
    required String id,
    required String name,
    required String review,
  }) async {
    _isAddingReview = true;
    _reviewErrorMessage = null;
    notifyListeners();

    final result = await addReviewUseCase.call(
      id: id,
      name: name,
      review: review,
    );

    result.fold(
      (failure) {
        _isAddingReview = false;
        _reviewErrorMessage = errorToMessage(failure);
        notifyListeners();
      },
      (reviews) {
        _isAddingReview = false;
        _reviewErrorMessage = null;
        if (_state is DetailLoaded) {
          final currentDetail = (_state as DetailLoaded).detail;
          final updatedDetail = RestaurantDetailEntity(
            id: currentDetail.id,
            name: currentDetail.name,
            description: currentDetail.description,
            city: currentDetail.city,
            address: currentDetail.address,
            pictureId: currentDetail.pictureId,
            categories: currentDetail.categories,
            menus: currentDetail.menus,
            rating: currentDetail.rating,
            customerReviews: reviews,
          );
          _state = DetailLoaded(updatedDetail);
        }
        notifyListeners();
      },
    );
  }

  void clearReviewError() {
    _reviewErrorMessage = null;
    notifyListeners();
  }
}
