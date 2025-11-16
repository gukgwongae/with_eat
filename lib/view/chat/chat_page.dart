import 'package:flutter/material.dart';
import 'package:with_eat/view/chat/chat_room_page.dart';
import 'package:with_eat/view/home/bottom_nav_bar.dart';
import 'package:with_eat/view/home/home_page.dart';
import 'package:with_eat/view/my/my_page.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  final testChat = const [
    {
      "userId": "1",
      "nickname": "강준석",
      "profile": "https://picsum.photos/200/300",
      "lastMessage": "혹시 내일 약속 가능한가요?",
      "time": "오전 10:32",
      "unread": 2,
    },
    {
      "userId": "2",
      "nickname": "이장수",
      "profile": "https://picsum.photos/200/301",
      "lastMessage": "감사합니다!",
      "time": "어제",
      "unread": 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("채팅"), automaticallyImplyLeading: false),
      body: ListView.separated(
        itemCount: testChat.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final chat = testChat[index];

          return ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatRoomPage(
                    userId: chat["userId"].toString(),
                    nickname: chat["nickname"].toString(),
                  ),
                ),
              );
            },
            leading: CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(chat["profile"].toString()),
            ),
            title: Text(
              chat["nickname"].toString(), // 임시로 text이므로 .toString()있어야함
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              chat["lastMessage"].toString(),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat["time"].toString(),
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                const SizedBox(height: 6),

                // 안 읽음 아이콘
                if (chat["unread"] as int > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      "${chat["unread"]}",
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
              ],
            ),
          );
        },
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ChatPage()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ChatPage()),
            );
          }
        },
      ),
    );
  }
}
