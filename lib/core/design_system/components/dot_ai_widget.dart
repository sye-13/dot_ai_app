import 'package:flutter/material.dart';

class DotAIWidget extends StatelessWidget {
  const DotAIWidget({
    super.key,
    this.fontSize = 16.0,
    required this.coloredDot,
    required this.label,
  });

  final double? fontSize;
  final Widget coloredDot;
  final Widget label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [coloredDot, const SizedBox(width: 4.0), label],
    );
  }
}
