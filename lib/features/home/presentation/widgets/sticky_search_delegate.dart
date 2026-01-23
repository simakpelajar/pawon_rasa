import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:pawon_rasa/features/home/domain/types/city_filter.dart';
import 'package:pawon_rasa/features/home/presentation/providers/home_controller.dart';
import 'package:pawon_rasa/features/home/presentation/widgets/search_bar_widget.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';

class StickySearchDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final TextEditingController searchController;
  final ValueNotifier<bool> isSearching;
  final HomeController controller;

  Timer? _debounce;

  StickySearchDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.searchController,
    required this.isSearching,
    required this.controller,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final isScrolled = shrinkOffset > 0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: maxHeight,
      decoration: BoxDecoration(
        color: isScrolled ? AppColors.primary : AppColors.backgroundOf(context),
        boxShadow:
            isScrolled
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
                : null,
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 6.w,
            vertical: AppSizes.paddingM * 0.75,
          ),
          child: Consumer<HomeController>(
            builder: (context, ctrl, _) {
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: SearchBarWidget(
                      controller: searchController,
                      hintText: 'Search restaurants…',
                      showClearButton: ctrl.searchQuery.isNotEmpty,
                      isOnPrimaryBackground: isScrolled,
                      onChanged: (value) {
                        isSearching.value = value.isNotEmpty;

                        _debounce?.cancel();

                        _debounce = Timer(
                          const Duration(milliseconds: 500),
                          () {
                            if (value.isEmpty) {
                              controller.clearSearch();
                            } else {
                              controller.searchRestaurants(value);
                            }
                          },
                        );
                      },
                      onSubmitted: (value) {
                        _debounce?.cancel();
                        if (value.isEmpty) {
                          controller.clearSearch();
                        } else {
                          controller.searchRestaurants(value);
                        }
                      },
                      onClear: () {
                        searchController.clear();
                        isSearching.value = false;
                        _debounce?.cancel();
                        controller.clearSearch();
                      },
                    ),
                  ),

                  SizedBox(width: AppSizes.paddingM),


                  SizedBox(
                    width: 25.w,
                    child: Container(
                      height: 6.5.h,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey[800]
                                : Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.w),
                        border: Border.all(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey[700]!
                                  : Colors.grey[300]!,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: ctrl.selectedCity,
                          isExpanded: true,
                          isDense: false,
                          icon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(width: 2.w),
                              Icon(
                                Icons.arrow_drop_down,
                                color:
                                    Theme.of(context).brightness ==
                                            Brightness.dark
                                        ? Colors.grey[300]
                                        : Colors.grey[700],
                                size: 20.sp,
                              ),
                            ],
                          ),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.grey[300]
                                    : Colors.grey[800],
                          ),
                          dropdownColor:
                              Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey[800]
                                  : Colors.grey[200],
                          items:
                              CityFilter.cities.map((String city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 14.sp,
                                        color:
                                            Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.grey[400]
                                                : Colors.grey[600],
                                      ),
                                      SizedBox(width: 2.w),
                                      Text(city),
                                    ],
                                  ),
                                );
                              }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.filterByCity(newValue);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant StickySearchDelegate oldDelegate) {
    return true;
  }

  void dispose() {
    _debounce?.cancel();
  }
}
