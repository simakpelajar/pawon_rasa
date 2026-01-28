import 'package:flutter/material.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/shared/core/constant/app_assets.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:sizer/sizer.dart';

class DetailHeader extends StatelessWidget {
  final RestaurantDetailEntity detail;
  final bool isSkeleton;

  const DetailHeader({
    super.key,
    required this.detail,
    this.isSkeleton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 280,
      pinned: true,
      backgroundColor: AppColors.primary,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 12.w, right: 16.w, bottom: 2.h),
        title: Text(
          detail.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 18.sp,
            letterSpacing: 1,
            shadows: [
              Shadow(
                offset: Offset(0, 2),
                blurRadius: 8,
                color: Colors.black.withOpacity(0.6),
              ),
            ],
          ),
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            if (isSkeleton)
              Container(color: AppColors.surfaceVariantOf(context))
            else
              Image.network(
                AppAssets.getImageUrl(detail.pictureId, size: ImageSize.large),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: AppColors.surfaceVariantOf(context),
                    child: Icon(
                      Icons.restaurant,
                      size: 100,
                      color: AppColors.textSecondaryOf(context),
                    ),
                  );
                },
              ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: [0.3, 0.7, 1.0],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
