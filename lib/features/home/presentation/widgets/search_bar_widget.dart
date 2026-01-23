import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool showClearButton;
  final bool isOnPrimaryBackground;
  final ValueChanged<String> onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback onClear;

  const SearchBarWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.showClearButton,
    required this.isOnPrimaryBackground,
    required this.onChanged,
    this.onSubmitted,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isOnPrimaryBackground
        ? Colors.white
        : AppColors.surfaceOf(context);
    final borderColor = isOnPrimaryBackground
        ? Colors.white.withOpacity(0.8)
        : AppColors.surfaceVariantOf(context);
    final iconColor = isOnPrimaryBackground
        ? AppColors.primary
        : AppColors.textSecondaryOf(context);
    final textColor = AppColors.textPrimaryOf(context);

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.w),
        border: Border.all(color: borderColor),
        boxShadow: isOnPrimaryBackground ? [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ] : AppColors.shadowOf(context),
      ),
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      height: 6.5.h,
      child: Row(
        children: [
          Icon(Icons.search, color: iconColor, size: 20.sp),
          SizedBox(width: 3.w),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              onSubmitted: onSubmitted,
              textInputAction: TextInputAction.search,
              style: TextStyle(
                color: textColor,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                isDense: true,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: AppColors.textSecondaryOf(context),
                  fontSize: 14.sp,
                ),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                filled: false,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
          if (showClearButton)
            InkWell(
              onTap: onClear,
              borderRadius: BorderRadius.circular(100),
              child: Padding(
                padding: EdgeInsets.all(AppSizes.paddingS),
                child: Icon(Icons.close, color: iconColor, size: 18.sp),
              ),
            ),
        ],
      ),
    );
  }
}
