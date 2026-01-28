import 'package:flutter/material.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class DetailInfo extends StatelessWidget {
  final RestaurantDetailEntity detail;

  const DetailInfo({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: 1.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFFEC6400), Color(0xFFFF8F00)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(1.w),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rating',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondaryOf(context),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Color(0xFFEC6400),
                                size: 6.w,
                              ),
                              SizedBox(width: 1.5.w),
                              Text(
                                detail.rating.toString(),
                                style: AppTextStyles.h2.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.sp,
                                  color: AppColors.textPrimaryOf(context),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4.w),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    Container(
                      width: 1.w,
                      height: 8.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppColors.primary, AppColors.primaryLight],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                        borderRadius: BorderRadius.circular(1.w),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Lokasi',
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.textSecondaryOf(context),
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 0.5.h),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: AppColors.primary,
                                size: 5.w,
                              ),
                              SizedBox(width: 1.5.w),
                              Expanded(
                                child: Text(
                                  detail.city,
                                  style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textPrimaryOf(context),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.5.h),
          // Address - Minimalist Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.place_outlined,
                color: AppColors.textSecondaryOf(context),
                size: 5.w,
              ),
              SizedBox(width: 2.w),
              Expanded(
                child: Text(
                  detail.address,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondaryOf(context),
                    fontSize: 15.sp,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          Container(
            height: 0.2.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.1),
                  AppColors.primary.withOpacity(0.3),
                  AppColors.primary.withOpacity(0.1),
                ],
              ),
            ),
          ),
          SizedBox(height: 3.h),
          Row(
            children: [
              Container(
                width: 1.2.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(1.w),
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                'Kategori',
                style: AppTextStyles.h3.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.sp,
                  color: AppColors.textPrimaryOf(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.only(left: 4.2.w),
            child: Wrap(
              spacing: 2.w,
              runSpacing: 1.h,
              children:
                  detail.categories
                      .map(
                        (category) => Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3.5.w,
                            vertical: 0.8.h,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(1.5.w),
                            border: Border.all(
                              color: AppColors.primary.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            category.name,
                            style: AppTextStyles.bodySmall.copyWith(
                              color: AppColors.primary,
                              fontSize: 14.5.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          SizedBox(height: 3.h),
          Row(
            children: [
              Container(
                width: 1.2.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(1.w),
                ),
              ),
              SizedBox(width: 3.w),
              Text(
                'Deskripsi',
                style: AppTextStyles.h3.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 19.sp,
                  color: AppColors.textPrimaryOf(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.2.w),
            child: Text(
              detail.description,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondaryOf(context),
                fontSize: 15.5.sp,
                height: 1.65,
                letterSpacing: 0.15,
                wordSpacing: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
