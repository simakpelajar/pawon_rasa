import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';

class FavoriteRestaurantMapper {
  static FavoriteRestaurantEntity fromMap(Map<String, dynamic> map) {
    return FavoriteRestaurantEntity(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      pictureId: map['pictureId'] as String,
      city: map['city'] as String,
      rating: (map['rating'] as num).toDouble(),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  static Map<String, dynamic> toMap(FavoriteRestaurantEntity entity) {
    return {
      'id': entity.id,
      'name': entity.name,
      'description': entity.description,
      'pictureId': entity.pictureId,
      'city': entity.city,
      'rating': entity.rating,
      'createdAt': entity.createdAt.millisecondsSinceEpoch,
    };
  }
}
