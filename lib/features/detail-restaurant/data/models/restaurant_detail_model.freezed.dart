// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) {
  return _CategoryModel.fromJson(json);
}

/// @nodoc
mixin _$CategoryModel {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this CategoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryModelCopyWith<CategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryModelCopyWith<$Res> {
  factory $CategoryModelCopyWith(
    CategoryModel value,
    $Res Function(CategoryModel) then,
  ) = _$CategoryModelCopyWithImpl<$Res, CategoryModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$CategoryModelCopyWithImpl<$Res, $Val extends CategoryModel>
    implements $CategoryModelCopyWith<$Res> {
  _$CategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CategoryModelImplCopyWith<$Res>
    implements $CategoryModelCopyWith<$Res> {
  factory _$$CategoryModelImplCopyWith(
    _$CategoryModelImpl value,
    $Res Function(_$CategoryModelImpl) then,
  ) = __$$CategoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CategoryModelImplCopyWithImpl<$Res>
    extends _$CategoryModelCopyWithImpl<$Res, _$CategoryModelImpl>
    implements _$$CategoryModelImplCopyWith<$Res> {
  __$$CategoryModelImplCopyWithImpl(
    _$CategoryModelImpl _value,
    $Res Function(_$CategoryModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$CategoryModelImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryModelImpl implements _CategoryModel {
  const _$CategoryModelImpl({required this.name});

  factory _$CategoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'CategoryModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      __$$CategoryModelImplCopyWithImpl<_$CategoryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryModelImplToJson(this);
  }
}

abstract class _CategoryModel implements CategoryModel {
  const factory _CategoryModel({required final String name}) =
      _$CategoryModelImpl;

  factory _CategoryModel.fromJson(Map<String, dynamic> json) =
      _$CategoryModelImpl.fromJson;

  @override
  String get name;

  /// Create a copy of CategoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryModelImplCopyWith<_$CategoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenuItemModel _$MenuItemModelFromJson(Map<String, dynamic> json) {
  return _MenuItemModel.fromJson(json);
}

/// @nodoc
mixin _$MenuItemModel {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this MenuItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuItemModelCopyWith<MenuItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuItemModelCopyWith<$Res> {
  factory $MenuItemModelCopyWith(
    MenuItemModel value,
    $Res Function(MenuItemModel) then,
  ) = _$MenuItemModelCopyWithImpl<$Res, MenuItemModel>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$MenuItemModelCopyWithImpl<$Res, $Val extends MenuItemModel>
    implements $MenuItemModelCopyWith<$Res> {
  _$MenuItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenuItemModelImplCopyWith<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  factory _$$MenuItemModelImplCopyWith(
    _$MenuItemModelImpl value,
    $Res Function(_$MenuItemModelImpl) then,
  ) = __$$MenuItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$MenuItemModelImplCopyWithImpl<$Res>
    extends _$MenuItemModelCopyWithImpl<$Res, _$MenuItemModelImpl>
    implements _$$MenuItemModelImplCopyWith<$Res> {
  __$$MenuItemModelImplCopyWithImpl(
    _$MenuItemModelImpl _value,
    $Res Function(_$MenuItemModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$MenuItemModelImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuItemModelImpl implements _MenuItemModel {
  const _$MenuItemModelImpl({required this.name});

  factory _$MenuItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuItemModelImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'MenuItemModel(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuItemModelImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuItemModelImplCopyWith<_$MenuItemModelImpl> get copyWith =>
      __$$MenuItemModelImplCopyWithImpl<_$MenuItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuItemModelImplToJson(this);
  }
}

abstract class _MenuItemModel implements MenuItemModel {
  const factory _MenuItemModel({required final String name}) =
      _$MenuItemModelImpl;

  factory _MenuItemModel.fromJson(Map<String, dynamic> json) =
      _$MenuItemModelImpl.fromJson;

  @override
  String get name;

  /// Create a copy of MenuItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuItemModelImplCopyWith<_$MenuItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MenusModel _$MenusModelFromJson(Map<String, dynamic> json) {
  return _MenusModel.fromJson(json);
}

/// @nodoc
mixin _$MenusModel {
  List<MenuItemModel> get foods => throw _privateConstructorUsedError;
  List<MenuItemModel> get drinks => throw _privateConstructorUsedError;

  /// Serializes this MenusModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenusModelCopyWith<MenusModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenusModelCopyWith<$Res> {
  factory $MenusModelCopyWith(
    MenusModel value,
    $Res Function(MenusModel) then,
  ) = _$MenusModelCopyWithImpl<$Res, MenusModel>;
  @useResult
  $Res call({List<MenuItemModel> foods, List<MenuItemModel> drinks});
}

/// @nodoc
class _$MenusModelCopyWithImpl<$Res, $Val extends MenusModel>
    implements $MenusModelCopyWith<$Res> {
  _$MenusModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? foods = null, Object? drinks = null}) {
    return _then(
      _value.copyWith(
            foods:
                null == foods
                    ? _value.foods
                    : foods // ignore: cast_nullable_to_non_nullable
                        as List<MenuItemModel>,
            drinks:
                null == drinks
                    ? _value.drinks
                    : drinks // ignore: cast_nullable_to_non_nullable
                        as List<MenuItemModel>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MenusModelImplCopyWith<$Res>
    implements $MenusModelCopyWith<$Res> {
  factory _$$MenusModelImplCopyWith(
    _$MenusModelImpl value,
    $Res Function(_$MenusModelImpl) then,
  ) = __$$MenusModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MenuItemModel> foods, List<MenuItemModel> drinks});
}

/// @nodoc
class __$$MenusModelImplCopyWithImpl<$Res>
    extends _$MenusModelCopyWithImpl<$Res, _$MenusModelImpl>
    implements _$$MenusModelImplCopyWith<$Res> {
  __$$MenusModelImplCopyWithImpl(
    _$MenusModelImpl _value,
    $Res Function(_$MenusModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MenusModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? foods = null, Object? drinks = null}) {
    return _then(
      _$MenusModelImpl(
        foods:
            null == foods
                ? _value._foods
                : foods // ignore: cast_nullable_to_non_nullable
                    as List<MenuItemModel>,
        drinks:
            null == drinks
                ? _value._drinks
                : drinks // ignore: cast_nullable_to_non_nullable
                    as List<MenuItemModel>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MenusModelImpl implements _MenusModel {
  const _$MenusModelImpl({
    required final List<MenuItemModel> foods,
    required final List<MenuItemModel> drinks,
  }) : _foods = foods,
       _drinks = drinks;

  factory _$MenusModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenusModelImplFromJson(json);

  final List<MenuItemModel> _foods;
  @override
  List<MenuItemModel> get foods {
    if (_foods is EqualUnmodifiableListView) return _foods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_foods);
  }

  final List<MenuItemModel> _drinks;
  @override
  List<MenuItemModel> get drinks {
    if (_drinks is EqualUnmodifiableListView) return _drinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_drinks);
  }

  @override
  String toString() {
    return 'MenusModel(foods: $foods, drinks: $drinks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenusModelImpl &&
            const DeepCollectionEquality().equals(other._foods, _foods) &&
            const DeepCollectionEquality().equals(other._drinks, _drinks));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_foods),
    const DeepCollectionEquality().hash(_drinks),
  );

  /// Create a copy of MenusModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenusModelImplCopyWith<_$MenusModelImpl> get copyWith =>
      __$$MenusModelImplCopyWithImpl<_$MenusModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenusModelImplToJson(this);
  }
}

abstract class _MenusModel implements MenusModel {
  const factory _MenusModel({
    required final List<MenuItemModel> foods,
    required final List<MenuItemModel> drinks,
  }) = _$MenusModelImpl;

  factory _MenusModel.fromJson(Map<String, dynamic> json) =
      _$MenusModelImpl.fromJson;

  @override
  List<MenuItemModel> get foods;
  @override
  List<MenuItemModel> get drinks;

  /// Create a copy of MenusModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenusModelImplCopyWith<_$MenusModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CustomerReviewModel _$CustomerReviewModelFromJson(Map<String, dynamic> json) {
  return _CustomerReviewModel.fromJson(json);
}

/// @nodoc
mixin _$CustomerReviewModel {
  String get name => throw _privateConstructorUsedError;
  String get review => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  /// Serializes this CustomerReviewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomerReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerReviewModelCopyWith<CustomerReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerReviewModelCopyWith<$Res> {
  factory $CustomerReviewModelCopyWith(
    CustomerReviewModel value,
    $Res Function(CustomerReviewModel) then,
  ) = _$CustomerReviewModelCopyWithImpl<$Res, CustomerReviewModel>;
  @useResult
  $Res call({String name, String review, String date});
}

/// @nodoc
class _$CustomerReviewModelCopyWithImpl<$Res, $Val extends CustomerReviewModel>
    implements $CustomerReviewModelCopyWith<$Res> {
  _$CustomerReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomerReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? review = null, Object? date = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            review:
                null == review
                    ? _value.review
                    : review // ignore: cast_nullable_to_non_nullable
                        as String,
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CustomerReviewModelImplCopyWith<$Res>
    implements $CustomerReviewModelCopyWith<$Res> {
  factory _$$CustomerReviewModelImplCopyWith(
    _$CustomerReviewModelImpl value,
    $Res Function(_$CustomerReviewModelImpl) then,
  ) = __$$CustomerReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String review, String date});
}

/// @nodoc
class __$$CustomerReviewModelImplCopyWithImpl<$Res>
    extends _$CustomerReviewModelCopyWithImpl<$Res, _$CustomerReviewModelImpl>
    implements _$$CustomerReviewModelImplCopyWith<$Res> {
  __$$CustomerReviewModelImplCopyWithImpl(
    _$CustomerReviewModelImpl _value,
    $Res Function(_$CustomerReviewModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CustomerReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? review = null, Object? date = null}) {
    return _then(
      _$CustomerReviewModelImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        review:
            null == review
                ? _value.review
                : review // ignore: cast_nullable_to_non_nullable
                    as String,
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerReviewModelImpl implements _CustomerReviewModel {
  const _$CustomerReviewModelImpl({
    required this.name,
    required this.review,
    required this.date,
  });

  factory _$CustomerReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerReviewModelImplFromJson(json);

  @override
  final String name;
  @override
  final String review;
  @override
  final String date;

  @override
  String toString() {
    return 'CustomerReviewModel(name: $name, review: $review, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerReviewModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.review, review) || other.review == review) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, review, date);

  /// Create a copy of CustomerReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerReviewModelImplCopyWith<_$CustomerReviewModelImpl> get copyWith =>
      __$$CustomerReviewModelImplCopyWithImpl<_$CustomerReviewModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerReviewModelImplToJson(this);
  }
}

abstract class _CustomerReviewModel implements CustomerReviewModel {
  const factory _CustomerReviewModel({
    required final String name,
    required final String review,
    required final String date,
  }) = _$CustomerReviewModelImpl;

  factory _CustomerReviewModel.fromJson(Map<String, dynamic> json) =
      _$CustomerReviewModelImpl.fromJson;

  @override
  String get name;
  @override
  String get review;
  @override
  String get date;

  /// Create a copy of CustomerReviewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerReviewModelImplCopyWith<_$CustomerReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

RestaurantDetailModel _$RestaurantDetailModelFromJson(
  Map<String, dynamic> json,
) {
  return _RestaurantDetailModel.fromJson(json);
}

/// @nodoc
mixin _$RestaurantDetailModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get pictureId => throw _privateConstructorUsedError;
  List<CategoryModel> get categories => throw _privateConstructorUsedError;
  MenusModel get menus => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  List<CustomerReviewModel> get customerReviews =>
      throw _privateConstructorUsedError;

  /// Serializes this RestaurantDetailModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestaurantDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestaurantDetailModelCopyWith<RestaurantDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantDetailModelCopyWith<$Res> {
  factory $RestaurantDetailModelCopyWith(
    RestaurantDetailModel value,
    $Res Function(RestaurantDetailModel) then,
  ) = _$RestaurantDetailModelCopyWithImpl<$Res, RestaurantDetailModel>;
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String city,
    String address,
    String pictureId,
    List<CategoryModel> categories,
    MenusModel menus,
    double rating,
    List<CustomerReviewModel> customerReviews,
  });

  $MenusModelCopyWith<$Res> get menus;
}

/// @nodoc
class _$RestaurantDetailModelCopyWithImpl<
  $Res,
  $Val extends RestaurantDetailModel
>
    implements $RestaurantDetailModelCopyWith<$Res> {
  _$RestaurantDetailModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestaurantDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? city = null,
    Object? address = null,
    Object? pictureId = null,
    Object? categories = null,
    Object? menus = null,
    Object? rating = null,
    Object? customerReviews = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            city:
                null == city
                    ? _value.city
                    : city // ignore: cast_nullable_to_non_nullable
                        as String,
            address:
                null == address
                    ? _value.address
                    : address // ignore: cast_nullable_to_non_nullable
                        as String,
            pictureId:
                null == pictureId
                    ? _value.pictureId
                    : pictureId // ignore: cast_nullable_to_non_nullable
                        as String,
            categories:
                null == categories
                    ? _value.categories
                    : categories // ignore: cast_nullable_to_non_nullable
                        as List<CategoryModel>,
            menus:
                null == menus
                    ? _value.menus
                    : menus // ignore: cast_nullable_to_non_nullable
                        as MenusModel,
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as double,
            customerReviews:
                null == customerReviews
                    ? _value.customerReviews
                    : customerReviews // ignore: cast_nullable_to_non_nullable
                        as List<CustomerReviewModel>,
          )
          as $Val,
    );
  }

  /// Create a copy of RestaurantDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MenusModelCopyWith<$Res> get menus {
    return $MenusModelCopyWith<$Res>(_value.menus, (value) {
      return _then(_value.copyWith(menus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestaurantDetailModelImplCopyWith<$Res>
    implements $RestaurantDetailModelCopyWith<$Res> {
  factory _$$RestaurantDetailModelImplCopyWith(
    _$RestaurantDetailModelImpl value,
    $Res Function(_$RestaurantDetailModelImpl) then,
  ) = __$$RestaurantDetailModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    String description,
    String city,
    String address,
    String pictureId,
    List<CategoryModel> categories,
    MenusModel menus,
    double rating,
    List<CustomerReviewModel> customerReviews,
  });

  @override
  $MenusModelCopyWith<$Res> get menus;
}

/// @nodoc
class __$$RestaurantDetailModelImplCopyWithImpl<$Res>
    extends
        _$RestaurantDetailModelCopyWithImpl<$Res, _$RestaurantDetailModelImpl>
    implements _$$RestaurantDetailModelImplCopyWith<$Res> {
  __$$RestaurantDetailModelImplCopyWithImpl(
    _$RestaurantDetailModelImpl _value,
    $Res Function(_$RestaurantDetailModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RestaurantDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? city = null,
    Object? address = null,
    Object? pictureId = null,
    Object? categories = null,
    Object? menus = null,
    Object? rating = null,
    Object? customerReviews = null,
  }) {
    return _then(
      _$RestaurantDetailModelImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        city:
            null == city
                ? _value.city
                : city // ignore: cast_nullable_to_non_nullable
                    as String,
        address:
            null == address
                ? _value.address
                : address // ignore: cast_nullable_to_non_nullable
                    as String,
        pictureId:
            null == pictureId
                ? _value.pictureId
                : pictureId // ignore: cast_nullable_to_non_nullable
                    as String,
        categories:
            null == categories
                ? _value._categories
                : categories // ignore: cast_nullable_to_non_nullable
                    as List<CategoryModel>,
        menus:
            null == menus
                ? _value.menus
                : menus // ignore: cast_nullable_to_non_nullable
                    as MenusModel,
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as double,
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
class _$RestaurantDetailModelImpl implements _RestaurantDetailModel {
  const _$RestaurantDetailModelImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required final List<CategoryModel> categories,
    required this.menus,
    required this.rating,
    required final List<CustomerReviewModel> customerReviews,
  }) : _categories = categories,
       _customerReviews = customerReviews;

  factory _$RestaurantDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantDetailModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String city;
  @override
  final String address;
  @override
  final String pictureId;
  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final MenusModel menus;
  @override
  final double rating;
  final List<CustomerReviewModel> _customerReviews;
  @override
  List<CustomerReviewModel> get customerReviews {
    if (_customerReviews is EqualUnmodifiableListView) return _customerReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customerReviews);
  }

  @override
  String toString() {
    return 'RestaurantDetailModel(id: $id, name: $name, description: $description, city: $city, address: $address, pictureId: $pictureId, categories: $categories, menus: $menus, rating: $rating, customerReviews: $customerReviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantDetailModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pictureId, pictureId) ||
                other.pictureId == pictureId) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            (identical(other.menus, menus) || other.menus == menus) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(
              other._customerReviews,
              _customerReviews,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    description,
    city,
    address,
    pictureId,
    const DeepCollectionEquality().hash(_categories),
    menus,
    rating,
    const DeepCollectionEquality().hash(_customerReviews),
  );

  /// Create a copy of RestaurantDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantDetailModelImplCopyWith<_$RestaurantDetailModelImpl>
  get copyWith =>
      __$$RestaurantDetailModelImplCopyWithImpl<_$RestaurantDetailModelImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantDetailModelImplToJson(this);
  }
}

abstract class _RestaurantDetailModel implements RestaurantDetailModel {
  const factory _RestaurantDetailModel({
    required final String id,
    required final String name,
    required final String description,
    required final String city,
    required final String address,
    required final String pictureId,
    required final List<CategoryModel> categories,
    required final MenusModel menus,
    required final double rating,
    required final List<CustomerReviewModel> customerReviews,
  }) = _$RestaurantDetailModelImpl;

  factory _RestaurantDetailModel.fromJson(Map<String, dynamic> json) =
      _$RestaurantDetailModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get city;
  @override
  String get address;
  @override
  String get pictureId;
  @override
  List<CategoryModel> get categories;
  @override
  MenusModel get menus;
  @override
  double get rating;
  @override
  List<CustomerReviewModel> get customerReviews;

  /// Create a copy of RestaurantDetailModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestaurantDetailModelImplCopyWith<_$RestaurantDetailModelImpl>
  get copyWith => throw _privateConstructorUsedError;
}
