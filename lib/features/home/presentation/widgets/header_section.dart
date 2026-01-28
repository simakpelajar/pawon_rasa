import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';
import 'package:pawon_rasa/shared/widgets/index.dart';
import 'package:pawon_rasa/shared/core/constant/app_assets.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(AppAssets.banner),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary.withOpacity(0.80),
                  AppColors.primary.withOpacity(0.55),
                  Colors.black.withOpacity(0.35),
                ],
              ),
            ),
          ),
          _buildDecorativeCircles(),
          SafeArea(bottom: false, child: _buildContent()),
        ],
      ),
    );
  }

  Widget _buildDecorativeCircles() {
    return Stack(
      children: [
        Positioned(top: -5.h, right: -8.w, child: _buildCircle(40.w, 0.1)),
        Positioned(top: 4.h, right: 13.w, child: _buildCircle(21.w, 0.08)),
        Positioned(top: 10.h, left: -5.w, child: _buildCircle(27.w, 0.06)),
      ],
    );
  }

  Widget _buildCircle(double size, double opacity) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withOpacity(opacity),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(6.w, AppSizes.paddingM, 6.w, 3.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14.5.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Pawon Rasa',
                      style: AppTextStyles.h1.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 26.sp,
                        letterSpacing: -0.4,
                      ),
                    ),
                  ],
                ),
              ),
              Transform.scale(scale: 0.8, child: const ThemeToggleButton()),
            ],
          ),
          SizedBox(height: AppSizes.paddingS),
          Text(
            'Curated plates, crafted stories. Find your next favorite spot.',
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.white.withOpacity(0.9),
              fontSize: 12.5.sp,
              letterSpacing: 0.15,
              height: 1.35,
            ),
          ),
          SizedBox(height: 1.8.h),
          _buildFeatureChips(),
        ],
      ),
    );
  }

  Widget _buildFeatureChips() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _featureChip(AppAssets.iconNusantaraFlavors, 'Nusantara flavors'),
          SizedBox(width: 2.w),
          _featureChip(AppAssets.iconTopRestaurants, 'Top restaurants'),
          SizedBox(width: 2.w),
          _featureChip(AppAssets.iconFastDelivery, 'Fast delivery'),
        ],
      ),
    );
  }

  Widget _featureChip(String iconPath, String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3.6.w, vertical: 1.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 17.sp, width: 17.sp),
          SizedBox(width: 2.2.w),
          Text(
            text,
            style: AppTextStyles.bodySmall.copyWith(
              color: Colors.white,
              fontSize: 12.5.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
