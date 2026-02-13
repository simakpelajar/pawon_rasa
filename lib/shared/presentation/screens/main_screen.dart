import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pawon_rasa/features/favorites/presentation/screens/favorites_screen.dart';
import 'package:pawon_rasa/features/favorites/presentation/providers/favorites_controller.dart';
import 'package:pawon_rasa/features/home/presentation/screens/home_screen.dart';
import 'package:pawon_rasa/features/settings/presentation/screens/settings_screen.dart';
import 'package:pawon_rasa/shared/core/constant/app_colors.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/core/providers/main_navigation_controller.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MainNavigationController(),
      child: Consumer<MainNavigationController>(
        builder: (context, navController, _) {
          return Scaffold(
            body: IndexedStack(
              index: navController.currentIndex,
              children: const [
                HomeScreen(),
                FavoritesScreen(),
                SettingsScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: navController.currentIndex,
              onTap: (index) {
                navController.setIndex(index);
                if (index == 1) {
                  getIt<FavoritesController>().loadFavorites();
                }
              },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.surfaceOf(context),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textSecondaryOf(context),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              elevation: 8,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  activeIcon: Icon(Icons.favorite),
                  label: 'Favorite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined),
                  activeIcon: Icon(Icons.settings),
                  label: 'Pengaturan',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
