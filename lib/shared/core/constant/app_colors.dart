import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFFCE181B);
  static const Color primaryDark = Color(0xFFA31316);
  static const Color primaryLight = Color(0xFFE54245);

  // Accent Colors
  static const Color accent = Color(0xFFFF6B35);
  static const Color accentDark = Color(0xFFD64A1F);

  // Secondary Color
  static const Color secondary = Color(0xFFFF8F00);

  // Light Mode Colors
  static const Color backgroundLight = Color(0xFFFAFAFA);
  static const Color surfaceLight = Colors.white;
  static const Color surfaceVariantLight = Color(0xFFF5F5F5);
  static const Color textPrimaryLight = Color(0xFF212121);
  static const Color textSecondaryLight = Color(0xFF757575);
  static const Color textHintLight = Color(0xFF9E9E9E);

  // Dark Mode Colors
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color surfaceVariantDark = Color(0xFF2C2C2C);
  static const Color textPrimaryDark = Color(0xFFE5E5E5);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color textHintDark = Color(0xFF757575);

  // Context-aware color getters (use these for dynamic theming)
  static Color backgroundOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? backgroundDark
          : backgroundLight;

  static Color surfaceOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? surfaceDark
          : surfaceLight;

  static Color surfaceVariantOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? surfaceVariantDark
          : surfaceVariantLight;

  static Color textPrimaryOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? textPrimaryDark
          : textPrimaryLight;

  static Color textSecondaryOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? textSecondaryDark
          : textSecondaryLight;

  static Color textHintOf(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
          ? textHintDark
          : textHintLight;

  // Static colors for const TextStyles (backward compatibility)
  static const Color background = backgroundLight;
  static const Color surface = surfaceLight;
  static const Color surfaceVariant = surfaceVariantLight;
  static const Color textPrimary = textPrimaryLight;
  static const Color textSecondary = textSecondaryLight;
  static const Color textHint = textHintLight;

  // Status Colors (same for both themes)
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Rating
  static const Color rating = Color(0xFFFFB300);

  // Context-aware shadows
  static List<BoxShadow> shadowOf(BuildContext context) => [
    BoxShadow(
      color:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withOpacity(0.3)
              : Colors.black.withOpacity(0.08),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> shadowLargeOf(BuildContext context) => [
    BoxShadow(
      color:
          Theme.of(context).brightness == Brightness.dark
              ? Colors.black.withOpacity(0.5)
              : Colors.black.withOpacity(0.12),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  // Legacy shadows (for backward compatibility)
  static List<BoxShadow> get shadow => [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static List<BoxShadow> get shadowLarge => [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];
}
