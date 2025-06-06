import 'package:dot_ai_app/chat/model/chat_entry.dart';
import 'package:dot_ai_app/chat/model/processing_task.dart';
import 'package:dot_ai_app/chat/model/quick_action.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

final previousEntries = <ChatEntry>[
  AIChatMessage(
    id: _uuid.v4(),
    message: """
I booked a table for two at 12:15 next Tuesday. Jane received the invite and I've blocked travel time in your calendar. Enjoy your lunch next week!
""",
  ),
  AIChatMessage(
    id: _uuid.v4(),
    message: """
✅ **Table successfully reserved**

Tuesday July 25th, 2024 at 12:15  
**The best restaurant**, World
""",
  ),
  AIProcessingEntry(
    id: _uuid.v4(),
    tasks: <ProcessingTask>[
      ProcessingTask(label: """
Checking calendar availability...  
Finding suitable time slots..  
Adjusting non-priority tasks...  
Prioritizing preferences...  
Sending invite to Jane...  
     """),
    ],
  ),
  UserChatEntry(id: _uuid.v4(), message: 'Yes please.'),
  AIChatMessage(
    id: _uuid.v4(),
    message: """
I found the restaurant 'The best restaurant' nearby both of your locations, with a Google review score of 4.4.

Would you like me to book a table?""",
  ),
  AIProcessingEntry(
    id: _uuid.v4(),
    tasks: <ProcessingTask>[
      ProcessingTask(label: "Identifying attendees..."),
      ProcessingTask(label: "Scanning for restaurants nearby..."),
      ProcessingTask(label: "Calculating travel times..."),
    ],
  ),
  AIChatMessage(
    id: _uuid.v4(),
    message:
        """Sure thing! Let me check yours and Jane's availability for lunch next week.""",
  ),
  UserChatEntry(
    id: _uuid.v4(),
    message:
        "Hi DotAI, I'd like to have lunch with Jane sometime next week. Can you make that happen?",
  ),
  AIChatMessage(
    id: _uuid.v4(),
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
