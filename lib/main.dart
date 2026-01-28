import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pawon_rasa/app.dart';
import 'package:pawon_rasa/shared/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  try {
    await configureDependencies();
  } catch (e) {
    debugPrint('Error initializing dependencies: $e');
  }

  runApp(const MyApp());
}
