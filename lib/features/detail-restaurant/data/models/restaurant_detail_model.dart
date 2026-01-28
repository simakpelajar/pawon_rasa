import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_detail_model.freezed.dart';
part 'restaurant_detail_model.g.dart';

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({required String name}) = _CategoryModel;

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);
}

@freezed
class MenuItemModel with _$MenuItemModel {
  const factory MenuItemModel({required String name}) = _MenuItemModel;

  factory MenuItemModel.fromJson(Map<String, dynamic> json) =>
      _$MenuItemModelFromJson(json);
}

@freezed
class MenusModel with _$MenusModel {
  const factory MenusModel({
    required List<MenuItemModel> foods,
    required List<MenuItemModel> drinks,
  }) = _MenusModel;

  factory MenusModel.fromJson(Map<String, dynamic> json) =>
      _$MenusModelFromJson(json);
}

@freezed
class CustomerReviewModel with _$CustomerReviewModel {
  const factory CustomerReviewModel({
    required String name,
    required String review,
    required String date,
  }) = _CustomerReviewModel;

  factory CustomerReviewModel.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewModelFromJson(json);
}

@freezed
class RestaurantDetailModel with _$RestaurantDetailModel {
  const factory RestaurantDetailModel({
    required String id,
    required String name,
    required String description,
    required String city,
    required String address,
    required String pictureId,
    required List<CategoryModel> categories,
    required MenusModel menus,
    required double rating,
    required List<CustomerReviewModel> customerReviews,
  }) = _RestaurantDetailModel;

  factory RestaurantDetailModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailModelFromJson(json);
}
