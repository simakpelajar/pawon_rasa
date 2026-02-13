import 'package:equatable/equatable.dart';

class FavoriteRestaurantEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final DateTime createdAt;

  const FavoriteRestaurantEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    description,
    pictureId,
    city,
    rating,
    createdAt,
  ];
}
