import 'package:flutter/material.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_timeFormat.dart';

class ChatDetailReceiveItem extends StatelessWidget {
  const ChatDetailReceiveItem({
    super.key,
    required this.imgUrl,
    required this.showProfile,
    required this.content,
    required this.dateTime,
  });

  final String imgUrl;
  final bool showProfile;
  final String content;
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showProfile)
          SizedBox.square(
            dimension: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: imgUrl.isNotEmpty
                  ? Image.network(imgUrl, fit: BoxFit.cover)
                  : Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.person),
                    ),
            ),
          )
        else
          const SizedBox(width: 40),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Text(content, style: const TextStyle(fontSize: 13)),
              ),
              Text(
                ChatDetailTimeFormat(dateTime),
                style: const TextStyle(fontSize: 11, color: Colors.black45),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
