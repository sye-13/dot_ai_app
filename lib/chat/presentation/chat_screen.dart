import 'package:dot_ai_app/chat/data/test_data.dart';
import 'package:dot_ai_app/chat/model/chat_entry.dart';
import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_theme.dart';
import 'package:dot_ai_app/core/design_system/components/ai_chat_bubble.dart';
import 'package:dot_ai_app/core/design_system/components/ai_processing_widget.dart';
import 'package:dot_ai_app/core/design_system/components/custom_app_bar.dart';
import 'package:dot_ai_app/core/design_system/components/dot_ai_widget.dart';
import 'package:dot_ai_app/core/design_system/components/input_panel.dart';
import 'package:dot_ai_app/core/design_system/components/user_chat_bubble.dart';
import 'package:dot_ai_app/core/design_system/icons/adjustments_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/home_icon.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const DotAIWidget(),
        startIcon: IconButton(onPressed: () {}, icon: const HomeIcon()),
        endIcon: IconButton(onPressed: () {}, icon: const AdjustmentsIcon()),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                controller: _scrollController,
                reverse: true,
                itemCount: entries.length,
                padding: const EdgeInsets.only(top: 20.0),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 24.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  final entry = entries[index];
                  switch (entry) {
                    case UserChatEntry():
                      return Align(
                        alignment: Alignment.centerRight,
                        child: UserChatBubble(
                          message: entry.message,
                          textAlign: TextAlign.right,
                        ),
                      );
                    case AIChatMessage():
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: AIChatBubble(
                          message: entry.message,
                          textAlign: TextAlign.left,
                          quickActions: entry.quickActions,
                        ),
                      );
                    case AIProcessingEntry():
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: AIProcessingWidget(tasks: entry.tasks),
                      );
                  }
                },
              ),
            ),
            SafeArea(
              child: ColoredBox(
                color: AppColors.gradientEnd,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputPanel(
                    onPromptSubmitted: (String prompt) {
                      print('Prompt: $prompt');
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
