import 'package:equatable/equatable.dart';

/// Category entity
class CategoryEntity extends Equatable {
  final String name;

  const CategoryEntity({required this.name});

  @override
  List<Object?> get props => [name];
}

/// Menu item entity
class MenuItemEntity extends Equatable {
  final String name;

  const MenuItemEntity({required this.name});

  @override
  List<Object?> get props => [name];
}

/// Menus entity
class MenusEntity extends Equatable {
  final List<MenuItemEntity> foods;
  final List<MenuItemEntity> drinks;

  const MenusEntity({
    required this.foods,
    required this.drinks,
  });

  @override
  List<Object?> get props => [foods, drinks];
}

/// Customer review entity
class CustomerReviewEntity extends Equatable {
  final String name;
  final String review;
  final String date;

  const CustomerReviewEntity({
    required this.name,
    required this.review,
    required this.date,
  });

  @override
  List<Object?> get props => [name, review, date];
}

/// Restaurant detail entity (domain layer) - Detail feature
class RestaurantDetailEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<CategoryEntity> categories;
  final MenusEntity menus;
  final double rating;
  final List<CustomerReviewEntity> customerReviews;

  const RestaurantDetailEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        city,
        address,
        pictureId,
        categories,
        menus,
        rating,
        customerReviews,
      ];
}
