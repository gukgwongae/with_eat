import 'package:flutter/material.dart';

class ChatDetailProductArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      padding: EdgeInsets.only(
        left: 20,
        top: 10,
        bottom: 10,
      ), // ← 상단 padding 12 추가 (핵심)
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/fork.png'),
          SizedBox(width: 12),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '삼겹살 먹으러 갈 사람 구함',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
