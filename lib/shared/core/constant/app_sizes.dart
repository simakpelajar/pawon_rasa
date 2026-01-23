import 'package:sizer/sizer.dart';

class AppSizes {
  AppSizes._();

  // Padding & Margin
  static double get paddingXS => 0.5.h;
  static double get paddingS => 1.h;
  static double get paddingM => 2.h;
  static double get paddingL => 3.h;
  static double get paddingXL => 4.h;

  // Border Radius
  static double get radiusS => 1.h;
  static double get radiusM => 1.5.h;
  static double get radiusL => 2.h;
  static double get radiusXL => 3.h;

  // Icon Sizes
  static double get iconS => 2.h;
  static double get iconM => 3.h;
  static double get iconL => 4.h;
  static double get iconXL => 6.h;

  // Image Sizes
  static double get imageHeightCard => 25.h;
  static double get imageHeightDetail => 37.5.h;

  // Button Heights
  static double get buttonHeight => 6.h;
  static double get buttonHeightSmall => 4.5.h;

  // Animation Durations (milliseconds)
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 220);
  static const Duration durationMedium = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
}
