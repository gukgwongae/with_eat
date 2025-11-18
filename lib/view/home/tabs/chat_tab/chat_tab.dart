import 'package:flutter/material.dart';
import 'package:with_eat/view/home/tabs/chat_tab/widgets/chat_tab_app_bar.dart';
import 'package:with_eat/view/home/tabs/chat_tab/widgets/chat_tab_list_view.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(children: [ChatTabAppBar(), ChatTabListView()]),
    );
  }
}
