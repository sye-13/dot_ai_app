import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MicOffIcon extends StatelessWidget {
  const MicOffIcon({super.key, this.size = 28.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/microphone-off.svg',
      semanticsLabel: 'Mic off icon',
      height: size,
    );
  }
}
