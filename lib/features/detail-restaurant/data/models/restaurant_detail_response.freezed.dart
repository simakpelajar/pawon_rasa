// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_detail_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RestaurantDetailResponse _$RestaurantDetailResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RestaurantDetailResponse.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDetailResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  RestaurantDetailModel get restaurant => throw _privateConstructorUsedError;

  /// Serializes this RestaurantDetailResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDetailResponseCopyWith<RestaurantDetailResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDetailResponseCopyWith<$Res> {
  factory $RestaurantDetailResponseCopyWith(
    RestaurantDetailResponse value,
    $Res Function(RestaurantDetailResponse) then,
  ) = _$RestaurantDetailResponseCopyWithImpl<$Res, RestaurantDetailResponse>;
  @useResult
  $Res call({bool error, String message, RestaurantDetailModel restaurant});

  $RestaurantDetailModelCopyWith<$Res> get restaurant;
}

/// @nodoc
class _$RestaurantDetailResponseCopyWithImpl<
  $Res,
  $Val extends RestaurantDetailResponse
>
    implements $RestaurantDetailResponseCopyWith<$Res> {
  _$RestaurantDetailResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? restaurant = null,
  }) {
    return _then(
      _value.copyWith(
            error:
                null == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            restaurant:
                null == restaurant
                    ? _value.restaurant
                    : restaurant // ignore: cast_nullable_to_non_nullable
                        as RestaurantDetailModel,
          )
          as $Val,
    );
  }

  /// Create a copy of RestaurantDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestaurantDetailModelCopyWith<$Res> get restaurant {
    return $RestaurantDetailModelCopyWith<$Res>(_value.restaurant, (value) {
      return _then(_value.copyWith(restaurant: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantDetailResponseImplCopyWith<$Res>
    implements $RestaurantDetailResponseCopyWith<$Res> {
  factory _$$RestaurantDetailResponseImplCopyWith(
    _$RestaurantDetailResponseImpl value,
    $Res Function(_$RestaurantDetailResponseImpl) then,
  ) = __$$RestaurantDetailResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message, RestaurantDetailModel restaurant});

  @override
  $RestaurantDetailModelCopyWith<$Res> get restaurant;
}

/// @nodoc
class __$$RestaurantDetailResponseImplCopyWithImpl<$Res>
    extends
        _$RestaurantDetailResponseCopyWithImpl<
          $Res,
          _$RestaurantDetailResponseImpl
        >
    implements _$$RestaurantDetailResponseImplCopyWith<$Res> {
  __$$RestaurantDetailResponseImplCopyWithImpl(
    _$RestaurantDetailResponseImpl _value,
    $Res Function(_$RestaurantDetailResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? restaurant = null,
  }) {
    return _then(
      _$RestaurantDetailResponseImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        restaurant:
            null == restaurant
                ? _value.restaurant
                : restaurant // ignore: cast_nullable_to_non_nullable
                    as RestaurantDetailModel,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantDetailResponseImpl implements _RestaurantDetailResponse {
  const _$RestaurantDetailResponseImpl({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  factory _$RestaurantDetailResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDetailResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  @override
  final RestaurantDetailModel restaurant;

  @override
  String toString() {
    return 'RestaurantDetailResponse(error: $error, message: $message, restaurant: $restaurant)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDetailResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.restaurant, restaurant) ||
                other.restaurant == restaurant));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, error, message, restaurant);

  /// Create a copy of RestaurantDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDetailResponseImplCopyWith<_$RestaurantDetailResponseImpl>
  get copyWith => __$$RestaurantDetailResponseImplCopyWithImpl<
    _$RestaurantDetailResponseImpl
  >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDetailResponseImplToJson(this);
  }
}

abstract class _RestaurantDetailResponse implements RestaurantDetailResponse {
  const factory _RestaurantDetailResponse({
    required final bool error,
    required final String message,
    required final RestaurantDetailModel restaurant,
  }) = _$RestaurantDetailResponseImpl;

  factory _RestaurantDetailResponse.fromJson(Map<String, dynamic> json) =
      _$RestaurantDetailResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  RestaurantDetailModel get restaurant;

  /// Create a copy of RestaurantDetailResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDetailResponseImplCopyWith<_$RestaurantDetailResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
