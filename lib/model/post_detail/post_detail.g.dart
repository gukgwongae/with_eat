// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PostDetail _$PostDetailFromJson(Map<String, dynamic> json) => _PostDetail(
  id: json['id'] as String,
  hostId: json['hostId'] as String,
  hostNickname: json['hostNickname'] as String,
  hostProfileImage: json['hostProfileImage'] as String,
  postTitle: json['postTitle'] as String,
  description: json['description'] as String,
  restName: json['restName'] as String,
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  images: (json['images'] as List<dynamic>).map((e) => e as String).toList(),
  reservedAt: DateTime.parse(json['reservedAt'] as String),
  chatroomId: json['chatroomId'] as String,
);

Map<String, dynamic> _$PostDetailToJson(_PostDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hostId': instance.hostId,
      'hostNickname': instance.hostNickname,
      'hostProfileImage': instance.hostProfileImage,
      'postTitle': instance.postTitle,
      'description': instance.description,
      'restName': instance.restName,
      'location': instance.location,
      'images': instance.images,
      'reservedAt': instance.reservedAt.toIso8601String(),
      'chatroomId': instance.chatroomId,
    };

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  address: json['address'] as String,
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'lat': instance.lat,
  'lng': instance.lng,
  'address': instance.address,
};
