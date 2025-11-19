import 'package:flutter/material.dart';
class ChatTabAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('채팅'),
      automaticallyImplyLeading: false,
    );
  }
}
