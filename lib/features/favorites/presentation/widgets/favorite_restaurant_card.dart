import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/features/favorites/presentation/providers/favorites_controller.dart';
import 'package:pawon_rasa/shared/core/constant/app_assets.dart';
import 'package:pawon_rasa/shared/widgets/restaurant_card_widget.dart';


class FavoriteRestaurantCard extends StatelessWidget {
  final FavoriteRestaurantEntity restaurant;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const FavoriteRestaurantCard({
    super.key,
    required this.restaurant,
    required this.onTap,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesController>(
      builder: (context, controller, _) {

        final isFavorite = controller.isFavoriteId(restaurant.id);

        final isExpanded = controller.isDescriptionExpanded(restaurant.id);

        return RestaurantCardWidget(
          name: restaurant.name,
          city: restaurant.city,
          rating: restaurant.rating,
          description: restaurant.description,
          imageUrl: AppAssets.getImageUrl(restaurant.pictureId),
          isExpanded: isExpanded,
          isLoved: isFavorite,
          onTap: onTap,
          onExpandedToggle: () {
            controller.toggleDescriptionExpanded(restaurant.id);
          },
          onLovePressed: onRemove,
        );
      },
    );
  }
}
