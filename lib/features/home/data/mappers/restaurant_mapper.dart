import 'package:pawon_rasa/features/home/data/models/restaurant_model.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';

class RestaurantMapper {
  static RestaurantEntity toEntity(RestaurantModel model) {
    return RestaurantEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      pictureId: model.pictureId,
      city: model.city,
      rating: model.rating,
    );
  }

  static List<RestaurantEntity> toEntityList(List<RestaurantModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
