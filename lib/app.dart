import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/core/constant/app_theme.dart';
import 'package:pawon_rasa/shared/core/constant/app_strings.dart';
import 'package:pawon_rasa/shared/core/providers/theme_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = getIt<GoRouter>();
    final themeController = getIt<ThemeController>();

    return ChangeNotifierProvider.value(
      value: themeController,
      child: Consumer<ThemeController>(
        builder: (context, theme, _) {
          return Sizer(
            builder: (context, orientation, deviceType) {
              return MaterialApp.router(
                title: AppStrings.appName,
                theme: AppTheme.lightTheme,
                darkTheme: AppTheme.darkTheme,
                themeMode: theme.themeMode,
                themeAnimationDuration: const Duration(milliseconds: 300),
                themeAnimationCurve: Curves.easeInOut,
                routerConfig: router,
                debugShowCheckedModeBanner: false,
              );
            },
          );
        },
      ),
    );
  }
}
