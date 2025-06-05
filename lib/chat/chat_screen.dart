import 'package:dot_ai_app/chat/data/test_data.dart';
import 'package:dot_ai_app/chat/model/chat_entry.dart';
import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_theme.dart';
import 'package:dot_ai_app/core/design_system/buttons/control_button.dart';
import 'package:dot_ai_app/core/design_system/components/ai_chat_bubble.dart';
import 'package:dot_ai_app/core/design_system/components/ai_processing_widget.dart';
import 'package:dot_ai_app/core/design_system/components/custom_app_bar.dart';
import 'package:dot_ai_app/core/design_system/components/dot_ai_widget.dart';
import 'package:dot_ai_app/core/design_system/components/user_chat_bubble.dart';
import 'package:dot_ai_app/core/design_system/icons/adjustments_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/home_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/keyboard_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/mic_off_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/mic_on_icon.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChatView();
  }
}

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const DotAIWidget(),
        leftIcon: IconButton(onPressed: () {}, icon: const HomeIcon()),
        rightIcon: IconButton(onPressed: () {}, icon: const AdjustmentsIcon()),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView.separated(
            padding: const EdgeInsets.only(top: 20.0),
            itemCount: entries.length,
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
      ),
      bottomNavigationBar: SafeArea(
        child: ColoredBox(
          color: AppColors.gradientEnd,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ControlButton(onPressed: () {}, child: const MicOffIcon()),
                ControlButton(
                  onPressed: () {},
                  padding: 16.0,
                  gradient: AppTheme.primaryMicGradient,
                  child: const MicOnIcon(color: AppColors.surface),
                ),
                ControlButton(onPressed: () {}, child: const KeyboardIcon()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
