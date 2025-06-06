import 'package:dot_ai_app/chat/presentation/chat_screen.dart';
import 'package:dot_ai_app/core/design_system/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.theme,
      home: const ChatScreen(),
    );
  }
}
