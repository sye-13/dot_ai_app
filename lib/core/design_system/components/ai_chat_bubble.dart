import 'package:dot_ai_app/chat/model/chat_entry.dart';
import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:dot_ai_app/core/design_system/components/animated_dot_ai_widget.dart';
import 'package:dot_ai_app/core/design_system/components/chat_bubble_border.dart';
import 'package:dot_ai_app/core/design_system/components/typing_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AIChatBubble extends StatelessWidget {
  final AIChatMessage aiChatEntry;
  final TextAlign textAlign;
  final bool displayLabel;
  final bool animate;

  const AIChatBubble({
    super.key,
    required this.aiChatEntry,
    required this.textAlign,
    this.displayLabel = true,
    this.animate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatBubbleBorder(
          backgroundColor: AppColors.bubbleAI,
          child:
              animate
                  ? TypingText(fullText: aiChatEntry.message)
                  : MarkdownBody(data: aiChatEntry.message),
        ),
        if (displayLabel) ...{
          const SizedBox(height: 2.0),
          AnimatedDotAIWidget(animate: animate),
        },
        if (aiChatEntry.quickActions.isNotEmpty) ...[
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
                aiChatEntry.quickActions
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
