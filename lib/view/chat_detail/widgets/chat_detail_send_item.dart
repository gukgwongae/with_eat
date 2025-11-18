import 'package:flutter/material.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_timeFormat.dart';

class ChatDetailSendItem extends StatelessWidget {
  ChatDetailSendItem({required this.content, required this.dateTime});

  final String content;
  final DateTime dateTime;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          // 보낸 메시지
          child: Text(content, style: TextStyle(fontSize: 13)),
        ),
        Text(
          ChatDetailTimeFormat(DateTime.now()),
          style: TextStyle(fontSize: 11, color: Colors.black45),
        ),
      ],
    );
  }
}
