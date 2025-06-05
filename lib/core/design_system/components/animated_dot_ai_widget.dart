import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:dot_ai_app/core/design_system/components/colored_dot.dart';
import 'package:flutter/material.dart';

class AnimatedDotAIWidget extends StatefulWidget {
  const AnimatedDotAIWidget({super.key, this.size = 12.0});

  final double? size;

  @override
  State<AnimatedDotAIWidget> createState() => _AnimatedDotAIWidgetState();
}

class _AnimatedDotAIWidgetState extends State<AnimatedDotAIWidget>
    with TickerProviderStateMixin {
  late final AnimationController _textController;
  late final AnimationController _dotController;
  late final Animation<double> _textAnimation;
  late final Animation<double> _dotAnimation;

  @override
  void initState() {
    super.initState();

    // Text bounce animation
    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _textAnimation = CurvedAnimation(
      parent: _textController,
      curve: Curves.elasticOut,
    );

    // Dot fade-in animation
    _dotController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _dotAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _dotController, curve: Curves.easeIn));

    // Start the animations
    _textController.forward().then((_) {
      _dotController.forward();
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(width: 4.0),
        FadeTransition(
          opacity: _dotAnimation,
          child: ColoredDot(color: AppColors.indicatorIdle),
        ),
        const SizedBox(width: 4.0),
        ScaleTransition(
          scale: _textAnimation,
          child: ShaderMask(
            shaderCallback:
                (bounds) => LinearGradient(
                  colors: AppColors.dotAIGradientColors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ).createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
            blendMode: BlendMode.srcIn,
            child: Text(
              'Dot AI',
              style: AppTextStyles.dotAIBoldLabel.copyWith(
                fontSize: widget.size,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
