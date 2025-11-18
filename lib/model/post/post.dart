import 'package:freezed_annotation/freezed_annotation.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
abstract class Post with _$Post {
  factory Post({
    required String postId, // 포스트아이디
    required String authorId, // 작성자아이디
    required String thumbnail, // 썸네일
    required String title, // 제목
    required String restName, // 가게 이름
    required DateTime meetDate, // 일시
    required String description, // 설명
    String? map, // 지도 정보 (API, 좌표 등)
    required String nickname, // 닉네임
    required String profileImage, // 프로필 이미지
    required DateTime uploadAt, // 작성 시각
    DateTime? updateAt, // 수정 시각
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
