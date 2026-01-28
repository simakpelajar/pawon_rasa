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
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/infrastructure/routes/route_name.dart';
import 'package:pawon_rasa/shared/widgets/index.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    final controller = useMemoized(() => getIt<HomeController>());
    final isSearching = useState(false);

    useEffect(() {
      controller.loadRestaurants();
      return null;
    }, []);

    return ChangeNotifierProvider.value(
      value: controller,
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
                  controller: controller,
                ),
              ),

              Consumer<HomeController>(
                builder: (context, ctrl, _) {
                  return ctrl.state.when(
                    initial:
                        () => SliverFillRemaining(
                          hasScrollBody: true,
                          child: const Center(
                            child: Text(
                              'Start searching your favorite restaurants!',
                            ),
                          ),
                        ),
                    loading:
                        () => SliverPadding(
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
                        ),
                    loaded:
                        (restaurants) =>
                            restaurants.isEmpty
                                ? SliverFillRemaining(
                                  child: const EmptyStateWidget(),
                                )
                                : SliverPadding(
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
                                        ),
                                      );
                                    }, childCount: restaurants.length),
                                  ),
                                ),
                    error:
                        (failure) => SliverFillRemaining(
                          hasScrollBody: true,
                          child: ErrorStateWidget(
                            failure: failure,
                            onRetry: () => ctrl.loadRestaurants(),
                          ),
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
}
