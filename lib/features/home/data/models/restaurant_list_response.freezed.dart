// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RestaurantListResponse _$RestaurantListResponseFromJson(
  Map<String, dynamic> json,
) {
  return _RestaurantListResponse.fromJson(json);
}

/// @nodoc
mixin _$RestaurantListResponse {
  bool get error => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get founded => throw _privateConstructorUsedError;
  List<RestaurantModel> get restaurants => throw _privateConstructorUsedError;

  /// Serializes this RestaurantListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantListResponseCopyWith<RestaurantListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantListResponseCopyWith<$Res> {
  factory $RestaurantListResponseCopyWith(
    RestaurantListResponse value,
    $Res Function(RestaurantListResponse) then,
  ) = _$RestaurantListResponseCopyWithImpl<$Res, RestaurantListResponse>;
  @useResult
  $Res call({
    bool error,
    String? message,
    int? count,
    int? founded,
    List<RestaurantModel> restaurants,
  });
}

/// @nodoc
class _$RestaurantListResponseCopyWithImpl<
  $Res,
  $Val extends RestaurantListResponse
>
    implements $RestaurantListResponseCopyWith<$Res> {
  _$RestaurantListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = freezed,
    Object? count = freezed,
    Object? founded = freezed,
    Object? restaurants = null,
  }) {
    return _then(
      _value.copyWith(
            error:
                null == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                freezed == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String?,
            count:
                freezed == count
                    ? _value.count
                    : count // ignore: cast_nullable_to_non_nullable
                        as int?,
            founded:
                freezed == founded
                    ? _value.founded
                    : founded // ignore: cast_nullable_to_non_nullable
                        as int?,
            restaurants:
                null == restaurants
                    ? _value.restaurants
                    : restaurants // ignore: cast_nullable_to_non_nullable
                        as List<RestaurantModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RestaurantListResponseImplCopyWith<$Res>
    implements $RestaurantListResponseCopyWith<$Res> {
  factory _$$RestaurantListResponseImplCopyWith(
    _$RestaurantListResponseImpl value,
    $Res Function(_$RestaurantListResponseImpl) then,
  ) = __$$RestaurantListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool error,
    String? message,
    int? count,
    int? founded,
    List<RestaurantModel> restaurants,
  });
}

/// @nodoc
class __$$RestaurantListResponseImplCopyWithImpl<$Res>
    extends
        _$RestaurantListResponseCopyWithImpl<$Res, _$RestaurantListResponseImpl>
    implements _$$RestaurantListResponseImplCopyWith<$Res> {
  __$$RestaurantListResponseImplCopyWithImpl(
    _$RestaurantListResponseImpl _value,
    $Res Function(_$RestaurantListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = freezed,
    Object? count = freezed,
    Object? founded = freezed,
    Object? restaurants = null,
  }) {
    return _then(
      _$RestaurantListResponseImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            freezed == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String?,
        count:
            freezed == count
                ? _value.count
                : count // ignore: cast_nullable_to_non_nullable
                    as int?,
        founded:
            freezed == founded
                ? _value.founded
                : founded // ignore: cast_nullable_to_non_nullable
                    as int?,
        restaurants:
            null == restaurants
                ? _value._restaurants
                : restaurants // ignore: cast_nullable_to_non_nullable
                    as List<RestaurantModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantListResponseImpl implements _RestaurantListResponse {
  const _$RestaurantListResponseImpl({
    required this.error,
    this.message,
    this.count,
    this.founded,
    required final List<RestaurantModel> restaurants,
  }) : _restaurants = restaurants;

  factory _$RestaurantListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantListResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String? message;
  @override
  final int? count;
  @override
  final int? founded;
  final List<RestaurantModel> _restaurants;
  @override
  List<RestaurantModel> get restaurants {
    if (_restaurants is EqualUnmodifiableListView) return _restaurants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_restaurants);
  }

  @override
  String toString() {
    return 'RestaurantListResponse(error: $error, message: $message, count: $count, founded: $founded, restaurants: $restaurants)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantListResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.founded, founded) || other.founded == founded) &&
            const DeepCollectionEquality().equals(
              other._restaurants,
              _restaurants,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    error,
    message,
    count,
    founded,
    const DeepCollectionEquality().hash(_restaurants),
  );

  /// Create a copy of RestaurantListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantListResponseImplCopyWith<_$RestaurantListResponseImpl>
  get copyWith =>
      __$$RestaurantListResponseImplCopyWithImpl<_$RestaurantListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantListResponseImplToJson(this);
  }
}

abstract class _RestaurantListResponse implements RestaurantListResponse {
  const factory _RestaurantListResponse({
    required final bool error,
    final String? message,
    final int? count,
    final int? founded,
    required final List<RestaurantModel> restaurants,
  }) = _$RestaurantListResponseImpl;

  factory _RestaurantListResponse.fromJson(Map<String, dynamic> json) =
      _$RestaurantListResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String? get message;
  @override
  int? get count;
  @override
  int? get founded;
  @override
  List<RestaurantModel> get restaurants;

  /// Create a copy of RestaurantListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantListResponseImplCopyWith<_$RestaurantListResponseImpl>
  get copyWith => throw _privateConstructorUsedError;
}
