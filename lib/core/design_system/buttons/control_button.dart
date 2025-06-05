import 'package:flutter/material.dart';

class ControlButton extends StatelessWidget {
  const ControlButton({
    super.key,
    required this.child,
    this.padding = 10.0,
    this.color = Colors.white,
    this.onPressed,
  });

  final Widget child;
  final double padding;
  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: CircleBorder(),
        backgroundColor: color,
        side: BorderSide.none,
        padding: EdgeInsets.all(padding),
      ),
      child: child,
    );
  }
}
