// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestaurantListResponseImpl _$$RestaurantListResponseImplFromJson(
  Map<String, dynamic> json,
) => _$RestaurantListResponseImpl(
  error: json['error'] as bool,
  message: json['message'] as String?,
  count: (json['count'] as num?)?.toInt(),
  founded: (json['founded'] as num?)?.toInt(),
  restaurants:
      (json['restaurants'] as List<dynamic>)
          .map((e) => RestaurantModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$RestaurantListResponseImplToJson(
  _$RestaurantListResponseImpl instance,
) => <String, dynamic>{
  'error': instance.error,
  'message': instance.message,
  'count': instance.count,
  'founded': instance.founded,
  'restaurants': instance.restaurants,
};
