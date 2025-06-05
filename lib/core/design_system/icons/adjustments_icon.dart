import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AdjustmentsIcon extends StatelessWidget {
  const AdjustmentsIcon({super.key, this.size = 32});

  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: SvgPicture.asset(
        'assets/adjustments-horizontal.svg',
        semanticsLabel: 'Adjustments icon',
        height: size,
      ),
    );
  }
}
