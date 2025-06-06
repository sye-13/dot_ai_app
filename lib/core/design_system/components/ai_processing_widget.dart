import 'package:dot_ai_app/chat/model/processing_task.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:dot_ai_app/core/design_system/components/typing_text.dart';
import 'package:flutter/material.dart';

class AIProcessingWidget extends StatelessWidget {
  final List<ProcessingTask> tasks;
  final bool animate;

  const AIProcessingWidget({
    super.key,
    required this.tasks,
    this.animate = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width * 0.7;
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: width),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
              tasks
                  .map(
                    (task) =>
                        animate
                            ? TypingText(
                              fullText: task.label,
                              style: AppTextStyles.bodyMediumMuted,
                            )
                            : Text(
                              task.label,
                              style: AppTextStyles.bodyMediumMuted,
                            ),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
