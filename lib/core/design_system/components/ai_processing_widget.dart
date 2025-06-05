import 'package:dot_ai_app/chat/model/processing_task.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:flutter/material.dart';

class AIProcessingWidget extends StatelessWidget {
  final List<ProcessingTask> tasks;

  const AIProcessingWidget({super.key, required this.tasks});

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
                        Text(task.label, style: AppTextStyles.bodyMediumMuted),
                  )
                  .toList(),
        ),
      ),
    );
  }
}
