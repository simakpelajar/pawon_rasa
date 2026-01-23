import 'package:freezed_annotation/freezed_annotation.dart';
import 'restaurant_detail_model.dart';

part 'restaurant_detail_response.freezed.dart';
part 'restaurant_detail_response.g.dart';

@freezed
class RestaurantDetailResponse with _$RestaurantDetailResponse {
  const factory RestaurantDetailResponse({
    required bool error,
    required String message,
    required RestaurantDetailModel restaurant,
  }) = _RestaurantDetailResponse;

  factory RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDetailResponseFromJson(json);
}
