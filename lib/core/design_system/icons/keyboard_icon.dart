import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KeyboardIcon extends StatelessWidget {
  const KeyboardIcon({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/keyboard.svg',
      semanticsLabel: 'Keyboard icon',
      height: size,
    );
  }
}
