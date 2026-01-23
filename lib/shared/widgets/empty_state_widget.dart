import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData? icon;
  final Color? iconColor;

  const EmptyStateWidget({
    super.key,
    this.message = 'No Data',
    this.icon = Icons.restaurant_menu,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 12.h,
              color: iconColor ??
                  AppColors.textSecondaryOf(context).withOpacity(0.4),
            ),
            SizedBox(height: AppSizes.paddingM),
            Text(
              message,
              style: AppTextStyles.h3.copyWith(
                color: AppColors.textSecondaryOf(context),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
