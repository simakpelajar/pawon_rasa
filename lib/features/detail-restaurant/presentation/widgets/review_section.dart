import 'package:flutter/material.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';
import 'package:sizer/sizer.dart';

class ReviewSection extends StatelessWidget {
  final List<CustomerReviewEntity> reviews;
  final VoidCallback onAddReview;

  const ReviewSection({
    super.key,
    required this.reviews,
    required this.onAddReview,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.paddingXL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSizes.paddingM),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppSizes.radiusL),
                    ),
                    child: Icon(
                      Icons.rate_review,
                      color: AppColors.primary,
                      size: AppSizes.iconL,
                    ),
                  ),
                  SizedBox(width: AppSizes.paddingL),
                  Text(
                    'Review (${reviews.length})',
                    style: AppTextStyles.h2.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: AppColors.textPrimaryOf(context),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(AppSizes.radiusL),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: IconButton(
                  onPressed: onAddReview,
                  icon: Icon(
                    Icons.add_comment,
                    color: Colors.white,
                    size: AppSizes.iconL,
                  ),
                  tooltip: AppStrings.addReviewButton,
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.paddingM),
          if (reviews.isEmpty)
            Center(
              child: Container(
                padding: EdgeInsets.all(AppSizes.paddingXL * 2),
                child: Column(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 15.w,
                      color: AppColors.textSecondaryOf(
                        context,
                      ).withOpacity(0.5),
                    ),
                    SizedBox(height: AppSizes.paddingM),
                    Text(
                      'Belum ada review',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.textSecondaryOf(context),
                        fontSize: 14.sp,
                      ),
                    ),
                  ],
                ),
              ),
            )
          else
            ...reviews.map((review) => _ReviewCard(review: review)),
        ],
      ),
    );
  }
}

class _ReviewCard extends StatelessWidget {
  final CustomerReviewEntity review;

  const _ReviewCard({required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppSizes.paddingM),
      padding: EdgeInsets.all(AppSizes.paddingL),
      decoration: BoxDecoration(
        color: AppColors.surfaceOf(context),
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        border: Border.all(
          color:
              Theme.of(context).brightness == Brightness.dark
                  ? Colors.white.withOpacity(0.12)
                  : Colors.black.withOpacity(0.08),
          width: 1.2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 10.w,
                height: 10.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryLight],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.3),
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    review.name[0].toUpperCase(),
                    style: AppTextStyles.h3.copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: AppSizes.paddingL),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      review.name,
                      style: AppTextStyles.bodySmall.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: AppColors.textPrimaryOf(context),
                      ),
                    ),
                    SizedBox(height: AppSizes.paddingXS),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          size: AppSizes.iconS,
                          color: AppColors.textSecondaryOf(context),
                        ),
                        SizedBox(width: AppSizes.paddingS),
                        Text(
                          review.date,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondaryOf(context),
                            fontSize: 13.5.sp,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: AppSizes.paddingL),
          Container(
            padding: EdgeInsets.all(AppSizes.paddingM),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).brightness == Brightness.dark
                      ? AppColors.surfaceVariantDark
                      : AppColors.surfaceVariantLight,
              borderRadius: BorderRadius.circular(AppSizes.radiusM),
            ),
            child: Text(
              review.review,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondaryOf(context),
                fontSize: 13.5.sp,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
