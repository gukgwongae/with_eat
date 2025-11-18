import 'package:flutter/material.dart';

class ChatDetailBottomSheet extends StatefulWidget {
  ChatDetailBottomSheet(this.bottomPadding, {required this.onSend});
  final double bottomPadding;
  final Function(String message) onSend;

  @override
  State<ChatDetailBottomSheet> createState() => _ChatDetailBottomSheetState();
}

class _ChatDetailBottomSheetState extends State<ChatDetailBottomSheet> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSend() {
    final text = controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text); // 상위에서 메시지 리스트에 추가
      controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70 + widget.bottomPadding,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (text) {
                      onSend();
                    },
                    decoration: InputDecoration(
                      hintText: "메시지 입력",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onSend,
                  child: Container(
                    width: 50,
                    height: 50,
                    color: Colors.transparent,
                    child: Icon(
                      Icons.send,
                      color: Theme.of(context).highlightColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: widget.bottomPadding),
        ],
      ),
    );
  }
}
