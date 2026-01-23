import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:pawon_rasa/shared/core/providers/theme_controller.dart';

class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeController, _) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Container(
          padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.w),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(isDark ? 0.1 : 0.15),
            borderRadius: BorderRadius.circular(5.w),
            border: Border.all(
              color: Colors.white.withOpacity(isDark ? 0.15 : 0.2),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.light_mode,
                color: Colors.white.withOpacity(isDark ? 0.5 : 1.0),
                size: 5.w,
              ),
              SizedBox(width: 1.w),
              Switch(
                value: isDark,
                onChanged: (value) => themeController.toggleTheme(),
                activeColor: Colors.white,
                activeTrackColor: Colors.white.withOpacity(0.3),
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(0.3),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              SizedBox(width: 1.w),
              Icon(
                Icons.dark_mode,
                color: Colors.white.withOpacity(isDark ? 1.0 : 0.5),
                size: 5.w,
              ),
            ],
          ),
        );
      },
    );
  }
}
