import 'package:flutter/material.dart';
import 'package:dot_ai_app/core/design_system/app_colors.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.child,
    this.padding = 10.0,
    this.color,
    this.gradient,
    this.onPressed,
  });

  final Widget child;
  final double padding;
  final Color? color;
  final Gradient? gradient;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: color ?? Colors.transparent,
        side: BorderSide.none,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient:
              gradient ??
              LinearGradient(colors: [AppColors.surface, AppColors.surface]),
          color: color ?? AppColors.surface,
          borderRadius: BorderRadius.circular(36),
        ),
        child: Padding(padding: EdgeInsets.all(padding), child: child),
      ),
    );
  }
}
