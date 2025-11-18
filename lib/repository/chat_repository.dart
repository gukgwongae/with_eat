import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:with_eat/model/chat/chat_message.dart';

class ChatRepository {
  ChatRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _messagesRef(String chatRoomId) =>
      _firestore.collection('chatRooms').doc(chatRoomId).collection('messages');

  Stream<List<ChatMessage>> watchMessages(String chatRoomId) {
    return _messagesRef(chatRoomId)
        .orderBy('createdAt')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map(
                (doc) => ChatMessage.fromMap(doc.id, doc.data()),
              )
              .toList(),
        );
  }

  Future<void> sendMessage({
    required String chatRoomId,
    required String senderId,
    required String content,
  }) async {
    await _messagesRef(chatRoomId).add({
      'senderId': senderId,
      'content': content,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }
}
