import 'package:dot_ai_app/chat/model/processing_task.dart';
import 'package:dot_ai_app/chat/model/quick_action.dart';
import 'package:equatable/equatable.dart';

sealed class ChatEntry extends Equatable {
  const ChatEntry({required this.id});

  final String id;
}

final class UserChatEntry extends ChatEntry {
  final String message;

  const UserChatEntry({required super.id, required this.message});

  @override
  List<Object?> get props => [message];
}

final class AIChatMessage extends ChatEntry {
  final String message;
  final List<QuickAction> quickActions;

  const AIChatMessage({
    required super.id,
    required this.message,
    this.quickActions = const [],
  });

  @override
  List<Object?> get props => [message, quickActions];
}

final class AIProcessingEntry extends ChatEntry {
  final List<ProcessingTask> tasks;

  const AIProcessingEntry({required super.id, required this.tasks});

  @override
  List<Object?> get props => [tasks];
}
