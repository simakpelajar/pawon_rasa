import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/features/home/presentation/providers/home_controller.dart';
import 'package:pawon_rasa/features/favorites/presentation/providers/favorites_controller.dart';
import 'package:pawon_rasa/shared/core/constant/app_assets.dart';
import 'package:pawon_rasa/shared/widgets/restaurant_card_widget.dart';

class RestaurantCardNew extends StatelessWidget {
  final RestaurantEntity restaurant;
  final VoidCallback? onTap;
  final bool isSkeleton;
  final VoidCallback? onFavoriteTapped;

  const RestaurantCardNew({
    super.key,
    required this.restaurant,
    this.onTap,
    this.isSkeleton = false,
    this.onFavoriteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer2<HomeController, FavoritesController>(
      builder: (context, homeController, favController, _) {
        final isExpanded =
            homeController.isDescriptionExpanded(restaurant.id);


        final isFav = favController.isFavoriteId(restaurant.id);

        return RestaurantCardWidget(
          name: restaurant.name,
          city: restaurant.city,
          rating: restaurant.rating,
          description: restaurant.description,
          imageUrl: AppAssets.getImageUrl(restaurant.pictureId),
          isExpanded: isExpanded,
          isLoved: isFav,
          onTap: onTap ?? () {},
          onExpandedToggle: () {
            homeController.toggleDescriptionExpanded(restaurant.id);
          },
          onLovePressed: onFavoriteTapped,
        );
      },
    );
  }
}
