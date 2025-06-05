import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget leftIcon;
  final Widget rightIcon;
  final double height;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.leftIcon,
    required this.rightIcon,
    this.height = 100.0,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.surface,
      height: height,
      padding: const EdgeInsets.only(top: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(padding: const EdgeInsets.only(left: 20.0), child: leftIcon),
          Expanded(child: Center(child: title)),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: rightIcon,
          ),
        ],
      ),
    );
  }
}