import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:with_eat/model/chat/chat_message.dart';
import 'package:with_eat/model/chat/chat_room.dart';

class ChatRepository {
  ChatRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> _messagesRef(String chatRoomId) =>
      _firestore.collection('chatRooms').doc(chatRoomId).collection('messages');
  CollectionReference<Map<String, dynamic>> get _rooms =>
      _firestore.collection('chatRooms');

  Stream<List<ChatMessage>> watchMessages(String chatRoomId) {
    return _messagesRef(chatRoomId)
        .orderBy('createdAt')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => ChatMessage.fromMap(doc.id, doc.data()))
              .toList(),
        );
  }

  Stream<List<ChatRoom>> watchAllRooms() {
    return _rooms
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map(ChatRoom.fromDocument).toList());
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
