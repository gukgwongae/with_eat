import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRoom {
  ChatRoom({
    required this.id,
    required this.postId,
    required this.postTitle,
    required this.hostNickname,
    required this.lastMessage,
    required this.updatedAt,
  });

  final String id;
  final String postId;
  final String postTitle;
  final String hostNickname;
  final String lastMessage;
  final DateTime updatedAt;

  factory ChatRoom.fromDocument(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data() ?? {};
    final timestamp = data['updatedAt'];
    DateTime updatedAt;
    if (timestamp is Timestamp) {
      updatedAt = timestamp.toDate();
    } else if (timestamp is DateTime) {
      updatedAt = timestamp;
    } else {
      updatedAt = DateTime.now();
    }
    return ChatRoom(
      id: doc.id,
      postId: data['postId']?.toString() ?? '',
      postTitle: data['postTitle']?.toString() ?? '',
      hostNickname: data['hostNickname']?.toString() ?? '',
      lastMessage: data['lastMessage']?.toString() ?? '',
      updatedAt: updatedAt,
    );
  }
}
