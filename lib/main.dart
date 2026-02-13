import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawon_rasa/app.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';
import 'package:pawon_rasa/shared/core/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  try {
    await configureDependencies();
    final notificationService = NotificationService();
    await notificationService.initialize();
  } catch (e) {
    debugPrint('Error initializing dependencies: $e');
  }

  runApp(const MyApp());
}
