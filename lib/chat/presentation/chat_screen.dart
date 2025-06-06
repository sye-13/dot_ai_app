import 'dart:async';

import 'package:dot_ai_app/chat/data/previous_chat_entries.dart';
import 'package:dot_ai_app/chat/model/chat_entry.dart';
import 'package:dot_ai_app/chat/model/processing_task.dart';
import 'package:dot_ai_app/core/design_system/app_colors.dart';
import 'package:dot_ai_app/core/design_system/app_text_styles.dart';
import 'package:dot_ai_app/core/design_system/app_theme.dart';
import 'package:dot_ai_app/core/design_system/components/ai_chat_bubble.dart';
import 'package:dot_ai_app/core/design_system/components/ai_processing_widget.dart';
import 'package:dot_ai_app/core/design_system/components/colored_dot.dart';
import 'package:dot_ai_app/core/design_system/components/custom_app_bar.dart';
import 'package:dot_ai_app/core/design_system/components/dot_ai_widget.dart';
import 'package:dot_ai_app/core/design_system/components/input_panel.dart';
import 'package:dot_ai_app/core/design_system/components/user_chat_bubble.dart';
import 'package:dot_ai_app/core/design_system/icons/adjustments_icon.dart';
import 'package:dot_ai_app/core/design_system/icons/home_icon.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final ScrollController _scrollController;
  late final StreamController<List<ChatEntry>> _chatController;
  late final List<ChatEntry> _chatEntries;
  final _uuid = Uuid();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _chatEntries = [];
    _chatController = StreamController<List<ChatEntry>>.broadcast();
    _chatController.sink.add(_chatEntries);
    _loadPreviousChatEntries();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _chatController.close();
    super.dispose();
  }

  Future<void> _loadPreviousChatEntries() async {
    await Future.delayed(const Duration(milliseconds: 800), () {
      _chatEntries.addAll(previousEntries);
      _chatController.sink.add(_chatEntries);
    });
  }

  void _sendUserMessage(String message) {
    _chatEntries.insert(0, UserChatEntry(id: _uuid.v4(), message: message));
    _chatController.sink.add(_chatEntries);
  }

  Future<void> _sendSimulatedAIMessages(String prompt) async {
    _chatEntries.insert(
      0,
      AIChatMessage(id: _uuid.v4(), message: 'Sure thing, on it!'),
    );
    _chatController.sink.add(_chatEntries);
    await Future.delayed(const Duration(milliseconds: 500), () {
      _chatEntries.insert(
        0,
        AIProcessingEntry(
          id: _uuid.v4(),
          tasks: <ProcessingTask>[
            const ProcessingTask(
              label: """
Checking X...  
Making sure that Y...  
Adjusting the results with Z...  
     """,
            ),
          ],
        ),
      );
      _chatController.sink.add(_chatEntries);
    });
    await Future.delayed(const Duration(milliseconds: 3800), () {
      _chatEntries.insert(
        0,
        AIChatMessage(
          id: _uuid.v4(),
          message: """
✅ **Fulfilled your request**

Your request was: $prompt.
""",
        ),
      );
      _chatController.sink.add(_chatEntries);
    });

    await Future.delayed(const Duration(milliseconds: 600), () {
      _chatEntries.insert(
        0,
        AIChatMessage(
          id: _uuid.v4(),
          message:
              "If you need further assistance or have more questions, feel free to ask!",
        ),
      );
      _chatController.sink.add(_chatEntries);
    });
  }

  void _onNewPrompt(String message) {
    if (message.isNotEmpty) {
      _sendUserMessage(message);
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
    _sendSimulatedAIMessages(message);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: DotAIWidget(
          coloredDot: ColoredDot(color: AppColors.indicatorIdle, size: 14.0),
          label: Text(
            'Dot AI',
            style: AppTextStyles.dotAIBoldLabel.copyWith(fontSize: 14.0),
          ),
        ),
        startIcon: IconButton(onPressed: () {}, icon: const HomeIcon()),
        endIcon: IconButton(onPressed: () {}, icon: const AdjustmentsIcon()),
      ),
      body: Container(
        decoration: BoxDecoration(gradient: AppTheme.backgroundGradient),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<ChatEntry>>(
                stream: _chatController.stream,
                initialData: previousEntries,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    final chatEntries = snapshot.data!;
                    return ListView.separated(
                      key: PageStorageKey('dotAIChat'),
                      controller: _scrollController,
                      reverse: true,
                      itemCount: chatEntries.length,
                      padding: const EdgeInsets.only(top: 20.0),
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 24.0);
                      },
                      itemBuilder: (BuildContext context, int index) {
                        final entry = chatEntries[index];
                        final animate =
                            index == 0 && entry != previousEntries[0];
                        switch (entry) {
                          case UserChatEntry():
                            return Align(
                              key: ValueKey(entry.id),
                              alignment: Alignment.centerRight,
                              child: UserChatBubble(
                                message: entry.message,
                                textAlign: TextAlign.right,
                              ),
                            );
                          case AIChatMessage():
                            return Align(
                              key: ValueKey(entry.id),
                              alignment: Alignment.centerLeft,
                              child: AIChatBubble(
                                aiChatEntry: entry,
                                textAlign: TextAlign.left,
                                animate: animate,
                              ),
                            );
                          case AIProcessingEntry():
                            return Align(
                              key: ValueKey(entry.id),
                              alignment: Alignment.centerLeft,
                              child: AIProcessingWidget(
                                tasks: entry.tasks,
                                animate: animate,
                              ),
                            );
                        }
                      },
                    );
                  } else {
                    return Text('No messages yet');
                  }
                },
              ),
            ),
            SafeArea(
              child: ColoredBox(
                color: AppColors.gradientEnd,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InputPanel(onPromptSubmitted: _onNewPrompt),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
