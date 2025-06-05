import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  // Large primary text, normal weight
  static const TextStyle bodyMedium = TextStyle(
    color: AppColors.primaryText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Large primary text, normal weight
  static const TextStyle bodyLarge = TextStyle(
    color: AppColors.primaryText,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // Large muted text, normal weight
  static const TextStyle bodyMediumMuted = TextStyle(
    color: AppColors.mutedText,
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Large muted text, normal weight
  static const TextStyle bodyLargeMuted = TextStyle(
    color: AppColors.mutedText,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  // Small primary text, normal weight
  static const TextStyle bodySmall = TextStyle(
    color: AppColors.primaryText,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // Extra small muted text, normal weight
  static const TextStyle bodyExtraSmallMuted = TextStyle(
    color: AppColors.mutedText,
    fontSize: 10,
    fontWeight: FontWeight.normal,
  );

  // Bold DotAI label style (used in DotAI widgets)
  static const TextStyle dotAIBoldLabel = TextStyle(
    fontWeight: FontWeight.bold,
  );

  // Muted label style used in suggestions heading and quick action chips
  static const TextStyle suggestionLabel = TextStyle(
    color: AppColors.mutedText,
    fontWeight: FontWeight.normal,
  );
}
