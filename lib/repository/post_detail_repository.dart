import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:with_eat/model/post_detail/post_detail.dart';

class PostDetailRepository {
  PostDetailRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  CollectionReference<Map<String, dynamic>> get _collection =>
      _firestore.collection('posts');

  Future<List<PostDetail>> fetchAll() async {
    final snapshot = await _collection
        .orderBy('reservedAt', descending: true)
        .get();
    return snapshot.docs
        .map((doc) => _fromFirestore(doc.id, doc.data()))
        .toList();
  }

  Future<PostDetail> fetchById(String postId) async {
    final doc = await _collection.doc(postId).get();
    if (doc.exists && doc.data() != null) {
      return _fromFirestore(doc.id, doc.data()!);
    }
    final fallbackFields = ['postid', 'postsid', 'postId'];
    for (final field in fallbackFields) {
      final query = await _collection
          .where(field, isEqualTo: postId)
          .limit(1)
          .get();
      if (query.docs.isNotEmpty) {
        final matched = query.docs.first;
        return _fromFirestore(matched.id, matched.data());
      }
    }
    throw Exception('게시글($postId)을 찾을 수 없습니다.');
  }

  PostDetail _fromFirestore(String documentId, Map<String, dynamic> data) {
    final imagesRaw = data['images'];
    final images = imagesRaw is Iterable
        ? imagesRaw.map((e) => e.toString()).toList()
        : imagesRaw == null
        ? <String>[]
        : <String>[imagesRaw.toString()];

    final locationRaw = data['location'] as Map<String, dynamic>? ?? const {};

    return PostDetail(
      hostId: data['hostId']?.toString() ?? '',
      hostNickname: data['hostNickname']?.toString() ?? '',
      hostProfileImage: data['hostProfileImage']?.toString() ?? '',
      postTitle: data['postTitle']?.toString() ?? '',
      description: data['description']?.toString() ?? '',
      restName: data['restName']?.toString() ?? '',
      location: Location(
        lat: _toDouble(locationRaw['lat']),
        lng: _toDouble(locationRaw['lng']),
        address: locationRaw['address']?.toString() ?? '',
      ),
      images: images,
      reservedAt: _toDateTime(data['reservedAt']),
      chatroomId: data['chatroomId']?.toString() ?? '',
      postid:
          (data['postid'] ?? data['postsid'] ?? data['postId'] ?? documentId)
              .toString(),
    );
  }

  double _toDouble(dynamic value) {
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0;
    return 0;
  }

  DateTime _toDateTime(dynamic value) {
    if (value is Timestamp) return value.toDate();
    if (value is DateTime) return value;
    if (value is String) return DateTime.tryParse(value) ?? DateTime.now();
    return DateTime.now();
  }
}
