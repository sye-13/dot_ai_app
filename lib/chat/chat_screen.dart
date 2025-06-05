import 'package:dot_ai_app/core/design_system/buttons/control_button.dart';
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
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const HomeIcon()),
        actions: [IconButton(onPressed: () {}, icon: const AdjustmentsIcon())],
      ),
      body: const Placeholder(),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ControlButton(onPressed: () {}, child: const MicOffIcon()),
              ControlButton(
                onPressed: () {},
                padding: 20.0,
                color: AppColors.accentGreen,
                child: const MicOnIcon(color: AppColors.surface),
              ),
              ControlButton(onPressed: () {}, child: const KeyboardIcon()),
            ],
          ),
        ),
      ),
    );
  }
}
