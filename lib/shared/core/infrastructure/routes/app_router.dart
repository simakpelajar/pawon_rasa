import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pawon_rasa/features/detail-restaurant/presentation/screens/detail_screen.dart';
import 'package:pawon_rasa/features/home/presentation/screens/home_screen.dart';
import 'package:pawon_rasa/shared/core/infrastructure/routes/route_name.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppRouter {
  static GoRouter create() {
    return GoRouter(
      navigatorKey: _rootKey,
      initialLocation: '/',
      routes: [
        GoRoute(
          path: '/',
          name: RouteName.home,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: '/detail-restaurant/:id',
          name: RouteName.detailRestaurant,
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return DetailScreen(restaurantId: id);
          },
        ),
      ],
      errorBuilder:
          (context, state) => Scaffold(
            body: Center(
              child: Text(
                'Error: ${state.error?.toString() ?? "Unknown error"}',
              ),
            ),
          ),
      debugLogDiagnostics: kDebugMode,
    );
  }
}
