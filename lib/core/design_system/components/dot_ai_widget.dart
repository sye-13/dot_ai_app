import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:dot_ai_app/core/design_system/components/colored_dot.dart';
import 'package:flutter/material.dart';

class DotAIWidget extends StatelessWidget {
  const DotAIWidget({super.key, this.size = 16.0});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ColoredDot(color: AppColors.indicatorIdle, size: 14.0),
        const SizedBox(width: 4.0),
        Text(
          'Dot AI',
          style: AppTextStyles.dotAIBoldLabel.copyWith(fontSize: size),
        ),
      ],
    );
  }
}
