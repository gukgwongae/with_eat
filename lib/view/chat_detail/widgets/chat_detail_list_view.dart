import 'package:flutter/material.dart';
import 'package:with_eat/model/chat/chat_message.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_receive_item.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_send_item.dart';

class ChatDetailListView extends StatelessWidget {
  const ChatDetailListView({
    super.key,
    required this.messages,
    required this.currentUserId,
  });

  final List<ChatMessage> messages;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          final isMine = message.senderId == currentUserId;
          if (isMine) {
            return ChatDetailSendItem(
              content: message.content,
              dateTime: message.createdAt,
            );
          }
          return ChatDetailReceiveItem(
            imgUrl: '',
            showProfile: false,
            content: message.content,
            dateTime: message.createdAt,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
