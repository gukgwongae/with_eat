import 'package:flutter/material.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_bottom_sheet.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_list_view.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_post_area.dart';
import 'package:with_eat/view/chat_detail/widgets/chat_detail_send_item.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final List<Widget> messages = []; // 메시지 리스트 저장

  void addMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      messages.add(ChatDetailSendItem(content: text, dateTime: DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('강준석'), centerTitle: true),

        bottomSheet: ChatDetailBottomSheet(
          MediaQuery.of(context).padding.bottom,
          onSend: addMessage, // 보낸 메시지 추가 연결
        ),

        body: Column(
          children: [
            ChatDetailProductArea(),
            ChatDetailListView(messages: messages),
          ],
        ),
      ),
    );
  }
}
