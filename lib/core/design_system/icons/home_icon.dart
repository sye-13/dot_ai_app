import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeIcon extends StatelessWidget {
  const HomeIcon({super.key, this.size = 28.0});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/home.svg',
      semanticsLabel: 'Home icon',
      height: size,
    );
  }
}
