// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Post _$PostFromJson(Map<String, dynamic> json) => _Post(
  postId: json['postId'] as String,
  authorId: json['authorId'] as String,
  thumbnail: json['thumbnail'] as String,
  title: json['title'] as String,
  restName: json['restName'] as String,
  meetDate: DateTime.parse(json['meetDate'] as String),
  description: json['description'] as String,
  map: json['map'] as String?,
  nickname: json['nickname'] as String,
  profileImage: json['profileImage'] as String,
  uploadAt: DateTime.parse(json['uploadAt'] as String),
  updateAt: json['updateAt'] == null
      ? null
      : DateTime.parse(json['updateAt'] as String),
);

Map<String, dynamic> _$PostToJson(_Post instance) => <String, dynamic>{
  'postId': instance.postId,
  'authorId': instance.authorId,
  'thumbnail': instance.thumbnail,
  'title': instance.title,
  'restName': instance.restName,
  'meetDate': instance.meetDate.toIso8601String(),
  'description': instance.description,
  'map': instance.map,
  'nickname': instance.nickname,
  'profileImage': instance.profileImage,
  'uploadAt': instance.uploadAt.toIso8601String(),
  'updateAt': instance.updateAt?.toIso8601String(),
};
