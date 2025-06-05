import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MicOnIcon extends StatelessWidget {
  const MicOnIcon({super.key, this.size = 32, this.color = Colors.black});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/microphone.svg',
      semanticsLabel: 'Mic on icon',
      height: size,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
