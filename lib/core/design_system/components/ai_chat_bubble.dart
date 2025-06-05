import 'package:dot_ai_app/chat/model/quick_action.dart';
import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:dot_ai_app/core/design_system/components/animated_dot_ai_widget.dart';
import 'package:dot_ai_app/core/design_system/components/chat_bubble_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AIChatBubble extends StatelessWidget {
  final String message;
  final TextAlign textAlign;
  final List<QuickAction> quickActions;
  final bool displayLabel;

  const AIChatBubble({
    super.key,
    required this.message,
    required this.textAlign,
    required this.quickActions,
    this.displayLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatBubbleBorder(
          backgroundColor: AppColors.bubbleAI,
          child: MarkdownBody(data: message),
        ),
        if (displayLabel) ...{
          const SizedBox(height: 2.0),
          const AnimatedDotAIWidget(),
        },
        if (quickActions.isNotEmpty) ...[
          const SizedBox(height: 12.0),
          Text(
            'Suggestions',
            textAlign: textAlign,
            style: AppTextStyles.suggestionLabel,
          ),
          const SizedBox(height: 8.0),
          Wrap(
            spacing: 96.0,
            runSpacing: 8.0,
            children:
                quickActions
                    .map(
                      (qa) => ChatBubbleBorder(
                        backgroundColor: AppColors.chipBackground,
                        child: GestureDetector(
                          child: Text(
                            qa.label,
                            style: AppTextStyles.suggestionLabel,
                          ),
                          onTap: () {},
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ],
    );
  }
}
