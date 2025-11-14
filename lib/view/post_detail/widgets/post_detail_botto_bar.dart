import 'package:flutter/material.dart';

class BottomBarSection extends StatelessWidget {
  final VoidCallback onChat;
  final VoidCallback onFavorite;

  const BottomBarSection({
    super.key,
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
              icon: const Icon(Icons.star_border),
            ),

            const SizedBox(width: 8),

            Expanded(
              child: SizedBox(
                height: 48,
                child: ElevatedButton(
                  onPressed: onChat,
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