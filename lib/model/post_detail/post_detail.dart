import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_detail.freezed.dart';
part 'post_detail.g.dart';

@freezed
abstract class PostDetail with _$PostDetail {
  factory PostDetail({
    required String id,
    required String hostId,
    required String hostNickname,
    required String hostProfileImage,
    required String postTitle,
    required String description,
    required String restName,
    required Location location,
    required List<String> images,
    required DateTime reservedAt,
    required String chatroomId, required String postid,
  }) = _PostDetail;

  factory PostDetail.fromJson(Map<String, dynamic> json) =>
      _$PostDetailFromJson(json);
}

@freezed
abstract class Location with _$Location {
  factory Location({
    required double lat,
    required double lng,
    required String address,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
