// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AddReviewResponse _$AddReviewResponseFromJson(Map<String, dynamic> json) {
  return _AddReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$AddReviewResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<CustomerReviewModel> get customerReviews =>
      throw _privateConstructorUsedError;

  /// Serializes this AddReviewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AddReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddReviewResponseCopyWith<AddReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddReviewResponseCopyWith<$Res> {
  factory $AddReviewResponseCopyWith(
    AddReviewResponse value,
    $Res Function(AddReviewResponse) then,
  ) = _$AddReviewResponseCopyWithImpl<$Res, AddReviewResponse>;
  @useResult
  $Res call({
    bool error,
    String message,
    List<CustomerReviewModel> customerReviews,
  });
}

/// @nodoc
class _$AddReviewResponseCopyWithImpl<$Res, $Val extends AddReviewResponse>
    implements $AddReviewResponseCopyWith<$Res> {
  _$AddReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? customerReviews = null,
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
            customerReviews:
                null == customerReviews
                    ? _value.customerReviews
                    : customerReviews // ignore: cast_nullable_to_non_nullable
                        as List<CustomerReviewModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AddReviewResponseImplCopyWith<$Res>
    implements $AddReviewResponseCopyWith<$Res> {
  factory _$$AddReviewResponseImplCopyWith(
    _$AddReviewResponseImpl value,
    $Res Function(_$AddReviewResponseImpl) then,
  ) = __$$AddReviewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool error,
    String message,
    List<CustomerReviewModel> customerReviews,
  });
}

/// @nodoc
class __$$AddReviewResponseImplCopyWithImpl<$Res>
    extends _$AddReviewResponseCopyWithImpl<$Res, _$AddReviewResponseImpl>
    implements _$$AddReviewResponseImplCopyWith<$Res> {
  __$$AddReviewResponseImplCopyWithImpl(
    _$AddReviewResponseImpl _value,
    $Res Function(_$AddReviewResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? customerReviews = null,
  }) {
    return _then(
      _$AddReviewResponseImpl(
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
        customerReviews:
            null == customerReviews
                ? _value._customerReviews
                : customerReviews // ignore: cast_nullable_to_non_nullable
                    as List<CustomerReviewModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AddReviewResponseImpl implements _AddReviewResponse {
  const _$AddReviewResponseImpl({
    required this.error,
    required this.message,
    required final List<CustomerReviewModel> customerReviews,
  }) : _customerReviews = customerReviews;

  factory _$AddReviewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddReviewResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  final List<CustomerReviewModel> _customerReviews;
  @override
  List<CustomerReviewModel> get customerReviews {
    if (_customerReviews is EqualUnmodifiableListView) return _customerReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerReviews);
  }

  @override
  String toString() {
    return 'AddReviewResponse(error: $error, message: $message, customerReviews: $customerReviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddReviewResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._customerReviews,
              _customerReviews,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    error,
    message,
    const DeepCollectionEquality().hash(_customerReviews),
  );

  /// Create a copy of AddReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddReviewResponseImplCopyWith<_$AddReviewResponseImpl> get copyWith =>
      __$$AddReviewResponseImplCopyWithImpl<_$AddReviewResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$AddReviewResponseImplToJson(this);
  }
}

abstract class _AddReviewResponse implements AddReviewResponse {
  const factory _AddReviewResponse({
    required final bool error,
    required final String message,
    required final List<CustomerReviewModel> customerReviews,
  }) = _$AddReviewResponseImpl;

  factory _AddReviewResponse.fromJson(Map<String, dynamic> json) =
      _$AddReviewResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  List<CustomerReviewModel> get customerReviews;

  /// Create a copy of AddReviewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddReviewResponseImplCopyWith<_$AddReviewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
