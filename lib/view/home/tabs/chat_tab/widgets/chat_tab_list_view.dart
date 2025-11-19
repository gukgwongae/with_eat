import 'package:flutter/material.dart';
import 'package:with_eat/model/chat/chat_room.dart';
import 'package:with_eat/repository/chat_repository.dart';
import 'package:with_eat/repository/post_detail_repository.dart';
import 'package:with_eat/view/chat_detail/chat_detail_page.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_timeFormat.dart';

class ChatTabListView extends StatelessWidget {
  ChatTabListView({super.key});

  final ChatRepository _chatRepository = ChatRepository();
  final PostDetailRepository _postRepository = PostDetailRepository();

  Future<void> _openChat(BuildContext context, ChatRoom room) async {
    try {
      final post = await _postRepository.fetchById(room.postId);
      if (!context.mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChatDetailPage(post: post, chatRoomId: room.id),
        ),
      );
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('채팅방을 여는 데 실패했습니다.\n$e')));
    }
  }

  Future<void> _confirmDelete(BuildContext context, ChatRoom room) async {
    final confirmed =
        await showDialog<bool>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('채팅방 삭제'),
            content: const Text('채팅방을 삭제하시겠습니까?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(false),
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(ctx).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                child: const Text('삭제'),
              ),
            ],
          ),
        ) ??
        false;
    if (!confirmed) return;

    try {
      await _chatRepository.deleteRoom(room.id);
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('채팅방이 삭제되었습니다.')));
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('채팅방 삭제 실패: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<ChatRoom>>(
        stream: _chatRepository.watchAllRooms(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final rooms = snapshot.data ?? [];
          if (rooms.isEmpty) {
            return const Center(child: Text('채팅방이 없습니다.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: rooms.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final room = rooms[index];
              return GestureDetector(
                onTap: () => _openChat(context, room),
                onLongPress: () => _confirmDelete(context, room),
                child: _ChatRoomTile(room: room),
              );
            },
          );
        },
      ),
    );
  }
}

class _ChatRoomTile extends StatelessWidget {
  const _ChatRoomTile({required this.room});

  final ChatRoom room;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFFBF4EE),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          color: Colors.transparent,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  SizedBox.square(
                    dimension: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.asset('assets/person.png'),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    room.hostNickname.isEmpty ? '작성자' : room.hostNickname,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      room.postTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      room.lastMessage.isEmpty
                          ? '아직 메시지가 없습니다.'
                          : room.lastMessage,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      ChatDetailTimeFormat(room.updatedAt),
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
