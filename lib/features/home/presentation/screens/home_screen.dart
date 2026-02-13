import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pawon_rasa/features/home/presentation/providers/home_controller.dart';
import 'package:pawon_rasa/features/home/presentation/widgets/header_section.dart';
import 'package:pawon_rasa/features/home/presentation/widgets/sticky_search_delegate.dart';
import 'package:pawon_rasa/features/home/presentation/widgets/restaurant_card.dart';
import 'package:pawon_rasa/features/favorites/presentation/providers/favorites_controller.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/infrastructure/routes/route_name.dart';
import 'package:pawon_rasa/shared/widgets/index.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/features/favorites/domain/entities/favorite_restaurant_entity.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final homeController = useMemoized(() => getIt<HomeController>());
    final favoritesController = useMemoized(() => getIt<FavoritesController>());
    final isSearching = useState(false);
    final rebuildTrigger = useState(0);
    useEffect(() {
      homeController.loadRestaurants();
      favoritesController.loadFavorites();
      return null;
    }, []);

    useEffect(() {
      void listener() {
        rebuildTrigger.value++;
      }

      favoritesController.addListener(listener);
      return () => favoritesController.removeListener(listener);
    }, [favoritesController]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: homeController),
        ChangeNotifierProvider.value(value: favoritesController),
      ],
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        color: AppColors.backgroundOf(context),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 200,
                floating: false,
                pinned: false,
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.w),
                    bottomRight: Radius.circular(8.w),
                  ),
                ),
                flexibleSpace: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.w),
                    bottomRight: Radius.circular(8.w),
                  ),
                  child: const FlexibleSpaceBar(background: HeaderSection()),
                ),
              ),

              SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: StickySearchDelegate(
                  minHeight: 11.h,
                  maxHeight: 11.h,
                  searchController: searchController,
                  isSearching: isSearching,
                  controller: homeController,
                ),
              ),

              Consumer2<HomeController, FavoritesController>(
                builder: (context, homeController, favoritesController, _) {
                  return homeController.state.when(
                    initial: () => _buildInitialState(),
                    loading: () => _buildLoadingState(),
                    loaded: (restaurants) => _buildLoadedState(
                      context,
                      restaurants,
                      favoritesController,
                    ),
                    error: (failure) => _buildErrorState(
                      failure,
                      homeController,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverFillRemaining _buildInitialState() {
    return SliverFillRemaining(
      hasScrollBody: true,
      child: const Center(
        child: Text(
          AppStrings.homeInitialMessage,
        ),
      ),
    );
  }

  SliverPadding _buildLoadingState() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: AppSizes.paddingM,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((
          context,
          index,
        ) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: AppSizes.paddingM,
            ),
            child: Skeletonizer(
              enabled: true,
              child: RestaurantCardNew(
                restaurant: RestaurantEntity(
                  id: 'skeleton',
                  name: 'Restaurant Name Here',
                  description:
                      'Description text goes here with some content to show',
                  pictureId: '',
                  city: 'City Name',
                  rating: 4.5,
                ),
                isSkeleton: true,
                onTap: () {},
              ),
            ),
          );
        }, childCount: 5),
      ),
    );
  }

  Widget _buildLoadedState(
    BuildContext context,
    List<RestaurantEntity> restaurants,
    FavoritesController favoritesController,
  ) {
    if (restaurants.isEmpty) {
      return SliverFillRemaining(
        child: const EmptyStateWidget(),
      );
    }

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.w,
        vertical: AppSizes.paddingM,
      ),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((
          context,
          index,
        ) {
          final restaurant = restaurants[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: AppSizes.paddingM,
            ),
            child: RestaurantCardNew(
              restaurant: restaurant,
              onTap: () {
                context.pushNamed(
                  RouteName.detailRestaurant,
                  pathParameters: {
                    'id': restaurant.id,
                  },
                );
              },
              onFavoriteTapped: () => _handleFavoriteTapped(
                context,
                restaurant,
                favoritesController,
              ),
            ),
          );
        }, childCount: restaurants.length),
      ),
    );
  }

  SliverFillRemaining _buildErrorState(
    Failure failure,
    HomeController homeController,
  ) {
    return SliverFillRemaining(
      hasScrollBody: true,
      child: ErrorStateWidget(
        failure: failure,
        onRetry: () => homeController.loadRestaurants(),
      ),
    );
  }

  Future<void> _handleFavoriteTapped(
    BuildContext context,
    RestaurantEntity restaurant,
    FavoritesController favoritesController,
  ) async {
    final isFavorited = favoritesController.isFavoriteId(restaurant.id);
    final entity = FavoriteRestaurantEntity(
      id: restaurant.id,
      name: restaurant.name,
      description: restaurant.description,
      pictureId: restaurant.pictureId,
      city: restaurant.city,
      rating: restaurant.rating,
      createdAt: DateTime.now(),
    );
    final success = await favoritesController.toggleFavorite(entity);
    if (success && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isFavorited
                ? AppStrings.favoriteRemoved
                : AppStrings.favoriteAdded,
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
