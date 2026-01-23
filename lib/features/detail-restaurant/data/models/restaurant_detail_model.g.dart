// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(name: json['name'] as String);

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{'name': instance.name};

_$MenuItemModelImpl _$$MenuItemModelImplFromJson(Map<String, dynamic> json) =>
    _$MenuItemModelImpl(name: json['name'] as String);

Map<String, dynamic> _$$MenuItemModelImplToJson(_$MenuItemModelImpl instance) =>
    <String, dynamic>{'name': instance.name};

_$MenusModelImpl _$$MenusModelImplFromJson(Map<String, dynamic> json) =>
    _$MenusModelImpl(
      foods:
          (json['foods'] as List<dynamic>)
              .map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      drinks:
          (json['drinks'] as List<dynamic>)
              .map((e) => MenuItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$$MenusModelImplToJson(_$MenusModelImpl instance) =>
    <String, dynamic>{'foods': instance.foods, 'drinks': instance.drinks};

_$CustomerReviewModelImpl _$$CustomerReviewModelImplFromJson(
  Map<String, dynamic> json,
) => _$CustomerReviewModelImpl(
  name: json['name'] as String,
  review: json['review'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$$CustomerReviewModelImplToJson(
  _$CustomerReviewModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'review': instance.review,
  'date': instance.date,
};

_$RestaurantDetailModelImpl _$$RestaurantDetailModelImplFromJson(
  Map<String, dynamic> json,
) => _$RestaurantDetailModelImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  city: json['city'] as String,
  address: json['address'] as String,
  pictureId: json['pictureId'] as String,
  categories:
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
  menus: MenusModel.fromJson(json['menus'] as Map<String, dynamic>),
  rating: (json['rating'] as num).toDouble(),
  customerReviews:
      (json['customerReviews'] as List<dynamic>)
          .map((e) => CustomerReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$$RestaurantDetailModelImplToJson(
  _$RestaurantDetailModelImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'city': instance.city,
  'address': instance.address,
  'pictureId': instance.pictureId,
  'categories': instance.categories,
  'menus': instance.menus,
  'rating': instance.rating,
  'customerReviews': instance.customerReviews,
};
