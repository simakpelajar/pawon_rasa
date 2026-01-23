// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantDetailResponseImpl _$$RestaurantDetailResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RestaurantDetailResponseImpl(
  error: json['error'] as bool,
  message: json['message'] as String,
  restaurant: RestaurantDetailModel.fromJson(
    json['restaurant'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$$RestaurantDetailResponseImplToJson(
  _$RestaurantDetailResponseImpl instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'restaurant': instance.restaurant,
};
