import 'package:cloud_firestore/cloud_firestore.dart';

class ChatMessage {
  ChatMessage({
    required this.id,
    required this.senderId,
    required this.content,
    required this.createdAt,
  });

  final String id;
  final String senderId;
  final String content;
  final DateTime createdAt;

  factory ChatMessage.fromMap(String id, Map<String, dynamic> data) {
    final timestamp = data['createdAt'];
    DateTime createdAt;
    if (timestamp is DateTime) {
      createdAt = timestamp;
    } else if (timestamp is Timestamp) {
      createdAt = timestamp.toDate();
    } else {
      createdAt = DateTime.now();
    }
    return ChatMessage(
      id: id,
      senderId: data['senderId']?.toString() ?? '',
      content: data['content']?.toString() ?? '',
      createdAt: createdAt,
    );
  }
}
