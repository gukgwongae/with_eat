import 'package:flutter/material.dart';
import 'package:with_eat/model/chat/chat_message.dart';
import 'package:with_eat/model/post_detail/post_detail.dart';
import 'package:with_eat/repository/chat_repository.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_bottom_sheet.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_list_view.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_post_area.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.post,
    required this.chatRoomId,
  });

  final PostDetail post;
  final String chatRoomId;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final ChatRepository _chatRepository = ChatRepository();
  static const String _currentUserId =
      'hostId'; // TODO: replace with real user ID.

  Future<void> _handleSend(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    try {
      await _chatRepository.sendMessage(
        chatRoomId: widget.chatRoomId,
        senderId: _currentUserId,
        content: trimmed,
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('메시지 전송 실패: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('채팅'), centerTitle: true),

        bottomSheet: ChatDetailBottomSheet(
          MediaQuery.of(context).padding.bottom,
          onSend: _handleSend,
        ),
        body: StreamBuilder<List<ChatMessage>>(
          stream: _chatRepository.watchMessages(widget.chatRoomId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final messages = snapshot.data ?? [];
            return Column(
              children: [
                ChatDetailProductArea(
                  title: widget.post.postTitle,
                  subtitle: widget.post.restName,
                ),
                ChatDetailListView(
                  messages: messages,
                  currentUserId: _currentUserId,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
