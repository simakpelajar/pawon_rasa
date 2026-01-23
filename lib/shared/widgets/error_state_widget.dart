import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pawon_rasa/shared/core/types/failure.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_sizes.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';

class ErrorStateWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback onRetry;
  final String? title;
  final String? retryLabel;

  const ErrorStateWidget({
    super.key,
    required this.failure,
    required this.onRetry,
    this.title,
    this.retryLabel,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.all(AppSizes.paddingXL),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 10.h,
                    color: AppColors.error.withOpacity(0.7),
                  ),
                  SizedBox(height: AppSizes.paddingM),
                  Text(
                    title ?? 'Terjadi Kesalahan',
                    style: AppTextStyles.h2.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: AppSizes.paddingS),
                  Text(
                    errorToMessage(failure),
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondaryOf(context),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSizes.paddingL),
                  ElevatedButton.icon(
                    onPressed: onRetry,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingXL,
                        vertical: AppSizes.paddingM,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radiusM),
                      ),
                    ),
                    label: Text(
                      retryLabel ?? 'Try Again',
                      style: AppTextStyles.button,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
