import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';
import 'package:sizer/sizer.dart';

class AddReviewDialog extends HookWidget {
  final Function(String name, String review) onSubmit;
  final bool isLoading;

  const AddReviewDialog({
    super.key,
    required this.onSubmit,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController();
    final reviewController = useTextEditingController();
    final formKey = useMemoized(() => GlobalKey<FormState>());

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusXL),
      ),
      child: Container(
        padding: EdgeInsets.all(AppSizes.paddingXL),
        decoration: BoxDecoration(
          color: AppColors.surfaceOf(context),
          borderRadius: BorderRadius.circular(AppSizes.radiusXL),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: AppSizes.paddingS * 0.6,
                    height: AppSizes.buttonHeight,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(AppSizes.radiusS),
                    ),
                  ),
                  SizedBox(width: AppSizes.paddingL),
                  Expanded(
                    child: Text(
                      AppStrings.addReviewTitle,
                      style: AppTextStyles.h2.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: AppColors.textPrimaryOf(context),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: isLoading ? null : () => Navigator.pop(context),
                    icon: Icon(
                      Icons.close,
                      color: AppColors.textSecondaryOf(context),
                      size: AppSizes.iconXL,
                    ),
                  ),
                ],
              ),
              SizedBox(height: AppSizes.paddingL),
              Text(
                AppStrings.nameLabel,
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryOf(context),
                ),
              ),
              SizedBox(height: AppSizes.paddingS),
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: AppStrings.nameHint,
                  hintStyle: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondaryOf(context).withOpacity(0.5),
                    fontSize: 14.sp,
                  ),
                  filled: true,
                  fillColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColors.surfaceVariantDark
                          : AppColors.surfaceVariantLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.w),
                    borderSide: BorderSide(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white.withOpacity(0.12)
                              : Colors.black.withOpacity(0.08),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.w),
                    borderSide: BorderSide(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white.withOpacity(0.12)
                              : Colors.black.withOpacity(0.08),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.w),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 2.h,
                  ),
                ),
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryOf(context),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                enabled: !isLoading,
              ),
              SizedBox(height: 2.5.h),
              Text(
                'Review',
                style: AppTextStyles.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryOf(context),
                ),
              ),
              SizedBox(height: 1.h),
              TextFormField(
                controller: reviewController,
                decoration: InputDecoration(
                  hintText: 'Write your review here...',
                  hintStyle: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondaryOf(context).withOpacity(0.5),
                    fontSize: 14.sp,
                  ),
                  filled: true,
                  fillColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? AppColors.surfaceVariantDark
                          : AppColors.surfaceVariantLight,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.w),
                    borderSide: BorderSide(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white.withOpacity(0.12)
                              : Colors.black.withOpacity(0.08),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.w),
                    borderSide: BorderSide(
                      color:
                          Theme.of(context).brightness == Brightness.dark
                              ? Colors.white.withOpacity(0.12)
                              : Colors.black.withOpacity(0.08),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(2.w),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 4.w,
                    vertical: 2.h,
                  ),
                ),
                style: AppTextStyles.bodySmall.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.textPrimaryOf(context),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Review cannot be empty';
                  }
                  return null;
                },
                enabled: !isLoading,
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed:
                          isLoading ? null : () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        side: BorderSide(
                          color: AppColors.textSecondaryOf(
                            context,
                          ).withOpacity(0.3),
                        ),
                      ),
                      child: Text(
                        'Cancel',
                        style: AppTextStyles.bodySmall.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                          color: AppColors.textSecondaryOf(context),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 3.w),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed:
                          isLoading
                              ? null
                              : () {
                                if (formKey.currentState!.validate()) {
                                  onSubmit(
                                    nameController.text,
                                    reviewController.text,
                                  );
                                }
                              },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        elevation: 0,
                      ),
                      child:
                          isLoading
                              ? SizedBox(
                                width: 5.w,
                                height: 5.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                              : Text(
                                'Submit Review',
                                style: AppTextStyles.bodySmall.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                ),
                              ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
