import 'package:freezed_annotation/freezed_annotation.dart';
import 'restaurant_model.dart';

part 'restaurant_list_response.freezed.dart';
part 'restaurant_list_response.g.dart';

@freezed
class RestaurantListResponse with _$RestaurantListResponse {
  const factory RestaurantListResponse({
    required bool error,
    String? message,
    int? count,
    int? founded,
    required List<RestaurantModel> restaurants,
  }) = _RestaurantListResponse;

  factory RestaurantListResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantListResponseFromJson(json);
}
