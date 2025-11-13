// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  nickname: json['nickname'] as String,
  profileImageUrl: json['profileImageUrl'] as String,
  username: json['username'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'nickname': instance.nickname,
  'profileImageUrl': instance.profileImageUrl,
  'username': instance.username,
  'password': instance.password,
};
