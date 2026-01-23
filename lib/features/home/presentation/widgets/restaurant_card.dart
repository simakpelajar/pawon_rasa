import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pawon_rasa/features/home/domain/entities/restaurant_entity.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_assets.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';

class RestaurantCardNew extends StatelessWidget {
  final RestaurantEntity restaurant;
  final VoidCallback? onTap;
  final bool isSkeleton;

  const RestaurantCardNew({
    super.key,
    required this.restaurant,
    this.onTap,
    this.isSkeleton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: EdgeInsets.only(bottom: 0),
            decoration: BoxDecoration(
              color: AppColors.surfaceOf(context),
              borderRadius: BorderRadius.circular(4.w),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 3,
                  offset: Offset(0, 1),
                )
              ],
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white.withOpacity(0.12)
                    : Colors.black.withOpacity(0.08),
                width: 1.2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.w),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        if (isSkeleton)
                          Container(
                            width: 35.w,
                            color: AppColors.surfaceVariantOf(context),
                          )
                        else
                          CachedNetworkImage(
                            imageUrl: AppAssets.getImageUrl(
                              restaurant.pictureId,
                            ),
                            width: 35.w,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Container(
                              width: 35.w,
                              color: AppColors.surfaceVariantOf(context),
                            ),
                            errorWidget: (context, url, error) => Container(
                              width: 35.w,
                              color: AppColors.surfaceVariantOf(context),
                              child: Icon(
                                Icons.restaurant,
                                size: 12.sp,
                                color: AppColors.textSecondaryOf(context),
                              ),
                            ),
                          ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          height: 12.h,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0),
                                  Colors.black.withOpacity(0.5),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(3.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    restaurant.name,
                                    style: AppTextStyles.h3.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                      color: AppColors.textPrimaryOf(context),
                                      letterSpacing: 0.3,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w,
                                    vertical: 0.7.h,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEC6400),
                                    borderRadius: BorderRadius.circular(3.w),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(
                                          0xFFEC6400,
                                        ).withOpacity(0.3),
                                        blurRadius: 4,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 4.5.w,
                                      ),
                                      SizedBox(width: 1.5.w),
                                      Text(
                                        restaurant.rating.toString(),
                                        style: AppTextStyles.bodySmall.copyWith(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 1.h),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(1.5.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(2.w),
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 4.5.w,
                                    color: AppColors.primary,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                Expanded(
                                  child: Text(
                                    restaurant.city,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.textSecondaryOf(context),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        Container(
          margin: EdgeInsets.only(bottom: 2.h),
          decoration: BoxDecoration(
            color: AppColors.surfaceOf(context),
            borderRadius: BorderRadius.circular(3.w),
            border: Border.all(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.12)
                  : Colors.black.withOpacity(0.08),
              width: 1.2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 3,
                offset: Offset(0, 1),
              )
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.description_outlined,
                      size: 4.5.w,
                      color: AppColors.textSecondaryOf(context),
                    ),
                    SizedBox(width: 2.w),
                    Expanded(
                      child: Text(
                        'Detail Restorant',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5.sp,
                          color: AppColors.textSecondaryOf(context),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1.5.h),
                Text(
                  restaurant.description,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondaryOf(context),
                    fontSize: 13.sp,
                    height: 1.6,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
