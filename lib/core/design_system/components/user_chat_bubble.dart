import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:dot_ai_app/core/design_system/components/chat_bubble_border.dart';
import 'package:flutter/material.dart';

class UserChatBubble extends StatelessWidget {
  const UserChatBubble({
    super.key,
    required this.message,
    required this.textAlign,
  });

  final String message;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return ChatBubbleBorder(
      backgroundColor: AppColors.bubbleUser,
      child: Text(
        message,
        textAlign: textAlign,
        style: AppTextStyles.bodyMedium,
      ),
    );
  }
}
