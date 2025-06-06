import 'package:dot_ai_app/chat/model/chat_entry.dart';
import 'package:dot_ai_app/chat/model/processing_task.dart';
import 'package:dot_ai_app/chat/model/quick_action.dart';

final entries = <ChatEntry>[
  AIChatMessage(
    message: """
I booked a table for two at 12:15 next Tuesday. Jane received the invite and I've blocked travel time in your calendar. Enjoy your lunch next week!
""",
  ),
  AIChatMessage(
    message: """
✅ **Table successfully reserved**

Tuesday July 25th, 2024 at 12:15  
**The best restaurant**, World
""",
  ),
  AIProcessingEntry(
    tasks: <ProcessingTask>[
      ProcessingTask(label: "Checking calendar availability..."),
      ProcessingTask(label: "Finding suitable time slots..."),
      ProcessingTask(label: "Adjusting non-priority tasks..."),
      ProcessingTask(label: "Prioritizing preferences..."),
      ProcessingTask(label: "Sending invite to Jane..."),
    ],
  ),
  UserChatEntry(message: 'Yes please.'),
  AIChatMessage(
    message: """
I found the restaurant 'The best restaurant' nearby both of your locations, with a Google review score of 4.4.

Would you like me to book a table?""",
  ),
  AIProcessingEntry(
    tasks: <ProcessingTask>[
      ProcessingTask(label: "Identifying attendees..."),
      ProcessingTask(label: "Scanning for restaurants nearby..."),
      ProcessingTask(label: "Calculating travel times..."),
    ],
  ),
  AIChatMessage(
    message:
    """Sure thing! Let me check yours and Jane's availability for lunch next week.""",
  ),
  UserChatEntry(
    message:
    "Hi DotAI, I'd like to have lunch with Jane sometime next week. Can you make that happen?",
  ),
  AIChatMessage(
    message: """
Good morning, John!  
How can I help you today?
""",
    quickActions: <QuickAction>[
      QuickAction(label: "What's planned today?"),
      QuickAction(label: "How's the weather?"),
    ],
  ),
];