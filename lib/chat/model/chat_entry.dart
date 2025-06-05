import 'package:dot_ai_app/chat/model/processing_task.dart';
import 'package:dot_ai_app/chat/model/quick_action.dart';

sealed class ChatEntry {
  const ChatEntry();
}

final class UserChatEntry extends ChatEntry {
  final String message;

  const UserChatEntry({required this.message});
}

final class AIChatMessage extends ChatEntry {
  final String message;
  final List<QuickAction> quickActions;

  const AIChatMessage({required this.message, this.quickActions = const []});
}

final class AIProcessingEntry extends ChatEntry {
  final List<ProcessingTask> tasks;

  const AIProcessingEntry({required this.tasks});
}
