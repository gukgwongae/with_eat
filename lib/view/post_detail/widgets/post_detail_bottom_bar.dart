import 'package:flutter/material.dart';
import 'package:with_eat/view/chat_detail/chat_detail_page.dart';
import 'package:with_eat/view/home/tabs/chat_tab/chat_tab.dart';

class BottomBarSection extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onChat;
  final VoidCallback onFavorite;
  const BottomBarSection({
    super.key,
    required this.isFavorite,
    required this.onChat,
    required this.onFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            IconButton(
              onPressed: onFavorite,
              icon: Icon(
                isFavorite ? Icons.star : Icons.star_border,
                color: isFavorite ? Colors.amber : Colors.grey,
              ),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          //
                          return ChatDetailPage();
                        },
                      ),
                    );
                  },
                  child: const Text('채팅하기'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
