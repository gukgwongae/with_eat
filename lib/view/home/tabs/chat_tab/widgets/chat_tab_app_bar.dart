import 'package:flutter/material.dart';

class ChatTabAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text('채팅'),
      automaticallyImplyLeading: false, // 뒤로가기 없애기
    );
  }
}
