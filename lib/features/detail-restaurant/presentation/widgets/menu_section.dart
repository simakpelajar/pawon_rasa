import 'package:flutter/material.dart';
import 'package:pawon_rasa/features/detail-restaurant/domain/entities/restaurant_detail_entity.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/constant/app_text_styles.dart';
import 'package:sizer/sizer.dart';

class MenuSection extends StatelessWidget {
  final MenusEntity menus;

  const MenuSection({super.key, required this.menus});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(4.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                'Menu',
                style: AppTextStyles.h2.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.sp,
                  color: AppColors.textPrimaryOf(context),
                ),
              ),
            ],
          ),
          SizedBox(height: 3.h),
          _MenuCategory(
            title: 'Makanan',
            icon: Icons.restaurant_menu,
            items: menus.foods,
          ),
          SizedBox(height: 3.h),
          _MenuCategory(
            title: 'Minuman',
            icon: Icons.local_cafe,
            items: menus.drinks,
          ),
        ],
      ),
    );
  }
}

class _MenuCategory extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<MenuItemEntity> items;

  const _MenuCategory({
    required this.title,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 1.w,
              height: 6.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(1.w),
              ),
            ),
            SizedBox(width: 3.w),
            Icon(icon, size: 5.w, color: AppColors.textSecondaryOf(context)),
            SizedBox(width: 2.w),
            Text(
              title,
              style: AppTextStyles.h3.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                color: AppColors.textPrimaryOf(context),
              ),
            ),
          ],
        ),
        SizedBox(height: 2.h),
        Padding(
          padding: EdgeInsets.only(left: 4.w),
          child: Wrap(
            spacing: 2.5.w,
            runSpacing: 1.2.h,
            children:
                items
                    .map(
                      (item) => Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                          vertical: 1.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.surfaceVariantDark
                                  : AppColors.surfaceVariantLight,
                          borderRadius: BorderRadius.circular(2.w),
                          border: Border.all(
                            color:
                                Theme.of(context).brightness == Brightness.dark
                                    ? Colors.white.withOpacity(0.08)
                                    : Colors.black.withOpacity(0.05),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          item.name,
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textPrimaryOf(context),
                            fontSize: 14.5.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
