import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/states/detail_state.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/providers/detail_controller.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/widgets/add_review_dialog.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/widgets/detail_header.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/widgets/detail_info.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/widgets/menu_section.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/widgets/review_section.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/widgets/index.dart';
import 'package:provider/provider.dart';

class DetailScreen extends HookWidget {
  final String restaurantId;

  const DetailScreen({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    final controller = useMemoized(() => getIt<DetailController>());

    useEffect(() {
      controller.loadRestaurantDetail(restaurantId);
      return null;
    }, [restaurantId]);

    return ChangeNotifierProvider.value(
      value: controller,
      child: Scaffold(
        body: Consumer<DetailController>(
          builder: (context, controller, _) {
            final state = controller.state;

            return switch (state) {
              DetailInitial() => const SizedBox.shrink(),
              DetailLoading() => Skeletonizer(
                enabled: true,
                child: CustomScrollView(
                  slivers: [
                    DetailHeader(
                      detail: const RestaurantDetailEntity(
                        id: 'loading',
                        name: 'Restaurant Name',
                        description: 'Description text here',
                        city: 'City Name',
                        address: 'Address goes here',
                        pictureId: '',
                        categories: [CategoryEntity(name: 'Category')],
                        menus: MenusEntity(
                          foods: [MenuItemEntity(name: 'Food')],
                          drinks: [MenuItemEntity(name: 'Drink')],
                        ),
                        rating: 4.5,
                        customerReviews: [],
                      ),
                      isSkeleton: true,
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          DetailInfo(
                            detail: RestaurantDetailEntity(
                              id: 'loading',
                              name: 'Restaurant Name',
                              description: 'Description text here',
                              city: 'City Name',
                              address: 'Address goes here',
                              pictureId: '',
                              categories: [CategoryEntity(name: 'Category')],
                              menus: MenusEntity(
                                foods: [MenuItemEntity(name: 'Food')],
                                drinks: [MenuItemEntity(name: 'Drink')],
                              ),
                              rating: 4.5,
                              customerReviews: [],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DetailLoaded() => CustomScrollView(
                slivers: [
                  DetailHeader(detail: state.detail),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailInfo(detail: state.detail),
                        const Divider(),
                        MenuSection(menus: state.detail.menus),
                        const Divider(),
                        ReviewSection(
                          reviews: state.detail.customerReviews,
                          onAddReview: () {
                            showGeneralDialog(
                              context: context,
                              barrierDismissible: !controller.isAddingReview,
                              barrierLabel: 'Add Review',
                              barrierColor: Colors.black54,
                              transitionDuration: AppSizes.durationMedium,
                              pageBuilder: (
                                dialogContext,
                                animation,
                                secondaryAnimation,
                              ) {
                                return Center(
                                  child: Consumer<DetailController>(
                                    builder: (_, ctrl, __) {
                                      // Show error if review submission failed
                                      if (ctrl.reviewErrorMessage != null) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    ctrl.reviewErrorMessage!,
                                                  ),
                                                  backgroundColor: Colors.red,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  duration: const Duration(
                                                    seconds: 3,
                                                  ),
                                                ),
                                              );
                                              ctrl.clearReviewError();
                                            });
                                      }

                                      return AddReviewDialog(
                                        isLoading: ctrl.isAddingReview,
                                        onSubmit: (name, review) async {
                                          await ctrl.addReview(
                                            id: restaurantId,
                                            name: name,
                                            review: review,
                                          );
                                          // Only close dialog if no error
                                          if (ctrl.reviewErrorMessage == null) {
                                            Navigator.pop(dialogContext);
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Review added successfully!',
                                                  ),
                                                  backgroundColor: Colors.green,
                                                  behavior:
                                                      SnackBarBehavior.floating,
                                                  duration: Duration(
                                                    seconds: 2,
                                                  ),
                                                ),
                                              );
                                            }
                                          }
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                              transitionBuilder: (
                                context,
                                animation,
                                secondaryAnimation,
                                child,
                              ) {
                                final curved = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeOutCubic,
                                  reverseCurve: Curves.easeInCubic,
                                );
                                return FadeTransition(
                                  opacity: animation,
                                  child: ScaleTransition(
                                    scale: Tween<double>(
                                      begin: 0.98,
                                      end: 1,
                                    ).animate(curved),
                                    child: child,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              DetailError() => ErrorStateWidget(
                failure: state.failure,
                onRetry: () => controller.loadRestaurantDetail(restaurantId),
              ),
            };
          },
        ),
      ),
    );
  }
}
