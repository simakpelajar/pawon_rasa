import 'package:pawon_rasa/features/detail-restaurant/data/models/restaurant_detail_model.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';

/// Mapper for RestaurantDetail - Detail feature
class RestaurantDetailMapper {
  static CategoryEntity toCategoryEntity(CategoryModel model) {
    return CategoryEntity(name: model.name);
  }

  static MenuItemEntity toMenuItemEntity(MenuItemModel model) {
    return MenuItemEntity(name: model.name);
  }

  static MenusEntity toMenusEntity(MenusModel model) {
    return MenusEntity(
      foods: model.foods.map((e) => toMenuItemEntity(e)).toList(),
      drinks: model.drinks.map((e) => toMenuItemEntity(e)).toList(),
    );
  }

  static CustomerReviewEntity toCustomerReviewEntity(
    CustomerReviewModel model,
  ) {
    return CustomerReviewEntity(
      name: model.name,
      review: model.review,
      date: model.date,
    );
  }

  static RestaurantDetailEntity toEntity(RestaurantDetailModel model) {
    return RestaurantDetailEntity(
      id: model.id,
      name: model.name,
      description: model.description,
      city: model.city,
      address: model.address,
      pictureId: model.pictureId,
      categories: model.categories.map((e) => toCategoryEntity(e)).toList(),
      menus: toMenusEntity(model.menus),
      rating: model.rating,
      customerReviews:
          model.customerReviews.map((e) => toCustomerReviewEntity(e)).toList(),
    );
  }

  static List<CustomerReviewEntity> toCustomerReviewEntityList(
    List<CustomerReviewModel> models,
  ) {
    return models.map((model) => toCustomerReviewEntity(model)).toList();
  }
}
