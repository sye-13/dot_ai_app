import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.accentGreen,
      onPrimary: Colors.white,
      secondary: AppColors.indicatorActive,
      onSecondary: Colors.white,
      surface: AppColors.backgroundLight,
      onSurface: AppColors.primaryText,
      error: Colors.red,
      onError: Colors.white,
    ),

    textTheme: TextTheme(
      bodyLarge: AppTextStyles.bodyLarge,
      bodySmall: AppTextStyles.bodyExtraSmallMuted,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.accentGreen,
        foregroundColor: Colors.white,
      ),
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.surface,
      elevation: 0,
      surfaceTintColor: AppColors.surface,
      iconTheme: const IconThemeData(color: Colors.black),
      centerTitle: true,
    ),

    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 0,
      color: Colors.transparent,
    ),
  );

  static OutlinedBorder border = RoundedSuperellipseBorder(
    borderRadius: BorderRadius.circular(16),
    side: const BorderSide(width: 0.5, color: AppColors.mutedText),
  );

  static ShapeDecoration shapeDecoration({required Color color}) =>
      ShapeDecoration(shape: border, color: color);

  static LinearGradient backgroundGradient = const LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.gradientStart,
      AppColors.gradientMiddle,
      AppColors.gradientEnd,
    ],
    stops: [0.0, 0.5, 1.0],
  );
}
