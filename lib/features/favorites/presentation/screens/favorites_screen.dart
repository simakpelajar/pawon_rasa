import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:pawon_rasa/features/favorites/presentation/providers/favorites_controller.dart';
import 'package:pawon_rasa/features/favorites/presentation/widgets/favorite_restaurant_card.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/core/infrastructure/routes/route_name.dart';
import 'package:pawon_rasa/shared/widgets/index.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';

class FavoritesScreen extends HookWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => getIt<FavoritesController>());

    useEffect(() {
      controller.loadFavorites();
      return null;
    }, []);

    return ChangeNotifierProvider.value(
      value: controller,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
          backgroundColor: AppColors.primary,
        ),
        backgroundColor: AppColors.backgroundOf(context),
        body: Consumer<FavoritesController>(
          builder: (context, ctrl, _) {
            return ctrl.state.when(
              initial: () => const Center(child: Text(AppStrings.favoritesInitialMessage)),
              loading: () => const Center(child: CircularProgressIndicator()),
              loaded: (favorites) {
                if (favorites.isEmpty) {
                  return _buildEmptyState(context);
                }

                return RefreshIndicator(
                  onRefresh: () => ctrl.loadFavorites(),
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5.w,
                      vertical: AppSizes.paddingM,
                    ),
                    itemCount: favorites.length,
                    separatorBuilder:
                        (_, __) => SizedBox(height: AppSizes.paddingM),
                    itemBuilder: (context, index) {
                      final restaurant = favorites[index];
                      return FavoriteRestaurantCard(
                        restaurant: restaurant,
                        onTap: () {
                          context.pushNamed(
                            RouteName.detailRestaurant,
                            pathParameters: {'id': restaurant.id},
                          );
                        },
                        onRemove:
                            () => _showRemoveDialog(
                              context,
                              ctrl,
                              restaurant.id,
                              restaurant.name,
                            ),
                      );
                    },
                  ),
                );
              },
              error: (failure) => ErrorStateWidget(
                failure: failure,
                onRetry: () => ctrl.loadFavorites(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 80,
              color: AppColors.textSecondaryOf(context),
            ),
            SizedBox(height: AppSizes.paddingL),
            Text(
              AppStrings.favoritesEmptyTitle,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimaryOf(context),
              ),
            ),
            SizedBox(height: AppSizes.paddingS),
            Text(
              AppStrings.favoritesEmptyDescription,
              style: TextStyle(
                fontSize: 12.sp,
                color: AppColors.textSecondaryOf(context),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  void _showRemoveDialog(
    BuildContext context,
    FavoritesController controller,
    String restaurantId,
    String restaurantName,
  ) {
    showDialog(
      context: context,
      builder:
          (dialogContext) => AlertDialog(
            title: const Text(AppStrings.removeFromFavoritesTitle),
            content: Text(
              'Are you sure you want to remove "$restaurantName" from favorites?',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () async {
                  Navigator.pop(dialogContext);
                  await controller.removeFavorite(restaurantId);

                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$restaurantName ${AppStrings.removedFromFavorites}'),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text(
                  AppStrings.removeButton,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }
}
