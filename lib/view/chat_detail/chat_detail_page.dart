import 'package:flutter/material.dart';
import 'package:with_eat/core/user_session.dart';
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
  String? _currentUserId;
  bool _loadingUser = true;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final nickname = await UserSession.getNickname();
    if (!mounted) return;
    setState(() {
      _currentUserId = nickname;
      _loadingUser = false;
    });
    if (nickname != null && nickname.isNotEmpty) {
      await _chatRepository.addMember(widget.chatRoomId, nickname);
    }
  }

  Future<void> _handleSend(String text) async {
    final trimmed = text.trim();
    if (trimmed.isEmpty) return;
    final userId = _currentUserId;
    if (userId == null || userId.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('닉네임을 먼저 설정해주세요.')));
      return;
    }
    try {
      await _chatRepository.sendMessage(
        chatRoomId: widget.chatRoomId,
        senderId: userId,
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
            if (_loadingUser ||
                snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            final messages = snapshot.data ?? [];
            return Column(
              children: [
                ChatDetailProductArea(
                  title: widget.post.postTitle,
                  subtitle: widget.post.restName,
                  imageUrl: widget.post.images.isNotEmpty
                      ? widget.post.images.first
                      : '',
                ),
                ChatDetailListView(
                  messages: messages,
                  currentUserId: _currentUserId ?? '',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
