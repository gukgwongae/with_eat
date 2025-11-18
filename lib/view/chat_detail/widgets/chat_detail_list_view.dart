import 'package:flutter/material.dart';

class ChatDetailListView extends StatelessWidget {
  const ChatDetailListView({required this.messages});

  final List<Widget> messages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return messages[index];
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 15);
        },

        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    );
  }
}
