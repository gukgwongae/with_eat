// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Post {

 String get postId;// 포스트아이디
 String get authorId;// 작성자아이디
 String get thumbnail;// 썸네일
 String get title;// 제목
 String get restName;// 가게 이름
 DateTime get meetDate;// 일시
 String get description;// 설명
 String? get map;// 지도 정보 (API, 좌표 등)
 String get nickname;// 닉네임
 String get profileImage;// 프로필 이미지
 DateTime get uploadAt;// 작성 시각
 DateTime? get updateAt;
/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostCopyWith<Post> get copyWith => _$PostCopyWithImpl<Post>(this as Post, _$identity);

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Post&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.title, title) || other.title == title)&&(identical(other.restName, restName) || other.restName == restName)&&(identical(other.meetDate, meetDate) || other.meetDate == meetDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.map, map) || other.map == map)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.uploadAt, uploadAt) || other.uploadAt == uploadAt)&&(identical(other.updateAt, updateAt) || other.updateAt == updateAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,authorId,thumbnail,title,restName,meetDate,description,map,nickname,profileImage,uploadAt,updateAt);

@override
String toString() {
  return 'Post(postId: $postId, authorId: $authorId, thumbnail: $thumbnail, title: $title, restName: $restName, meetDate: $meetDate, description: $description, map: $map, nickname: $nickname, profileImage: $profileImage, uploadAt: $uploadAt, updateAt: $updateAt)';
}


}

/// @nodoc
abstract mixin class $PostCopyWith<$Res>  {
  factory $PostCopyWith(Post value, $Res Function(Post) _then) = _$PostCopyWithImpl;
@useResult
$Res call({
 String postId, String authorId, String thumbnail, String title, String restName, DateTime meetDate, String description, String? map, String nickname, String profileImage, DateTime uploadAt, DateTime? updateAt
});




}
/// @nodoc
class _$PostCopyWithImpl<$Res>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._self, this._then);

  final Post _self;
  final $Res Function(Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? postId = null,Object? authorId = null,Object? thumbnail = null,Object? title = null,Object? restName = null,Object? meetDate = null,Object? description = null,Object? map = freezed,Object? nickname = null,Object? profileImage = null,Object? uploadAt = null,Object? updateAt = freezed,}) {
  return _then(_self.copyWith(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,restName: null == restName ? _self.restName : restName // ignore: cast_nullable_to_non_nullable
as String,meetDate: null == meetDate ? _self.meetDate : meetDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,map: freezed == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,uploadAt: null == uploadAt ? _self.uploadAt : uploadAt // ignore: cast_nullable_to_non_nullable
as DateTime,updateAt: freezed == updateAt ? _self.updateAt : updateAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [Post].
extension PostPatterns on Post {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Post value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Post value)  $default,){
final _that = this;
switch (_that) {
case _Post():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Post value)?  $default,){
final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String postId,  String authorId,  String thumbnail,  String title,  String restName,  DateTime meetDate,  String description,  String? map,  String nickname,  String profileImage,  DateTime uploadAt,  DateTime? updateAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.postId,_that.authorId,_that.thumbnail,_that.title,_that.restName,_that.meetDate,_that.description,_that.map,_that.nickname,_that.profileImage,_that.uploadAt,_that.updateAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String postId,  String authorId,  String thumbnail,  String title,  String restName,  DateTime meetDate,  String description,  String? map,  String nickname,  String profileImage,  DateTime uploadAt,  DateTime? updateAt)  $default,) {final _that = this;
switch (_that) {
case _Post():
return $default(_that.postId,_that.authorId,_that.thumbnail,_that.title,_that.restName,_that.meetDate,_that.description,_that.map,_that.nickname,_that.profileImage,_that.uploadAt,_that.updateAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String postId,  String authorId,  String thumbnail,  String title,  String restName,  DateTime meetDate,  String description,  String? map,  String nickname,  String profileImage,  DateTime uploadAt,  DateTime? updateAt)?  $default,) {final _that = this;
switch (_that) {
case _Post() when $default != null:
return $default(_that.postId,_that.authorId,_that.thumbnail,_that.title,_that.restName,_that.meetDate,_that.description,_that.map,_that.nickname,_that.profileImage,_that.uploadAt,_that.updateAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Post implements Post {
   _Post({required this.postId, required this.authorId, required this.thumbnail, required this.title, required this.restName, required this.meetDate, required this.description, this.map, required this.nickname, required this.profileImage, required this.uploadAt, this.updateAt});
  factory _Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

@override final  String postId;
// 포스트아이디
@override final  String authorId;
// 작성자아이디
@override final  String thumbnail;
// 썸네일
@override final  String title;
// 제목
@override final  String restName;
// 가게 이름
@override final  DateTime meetDate;
// 일시
@override final  String description;
// 설명
@override final  String? map;
// 지도 정보 (API, 좌표 등)
@override final  String nickname;
// 닉네임
@override final  String profileImage;
// 프로필 이미지
@override final  DateTime uploadAt;
// 작성 시각
@override final  DateTime? updateAt;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostCopyWith<_Post> get copyWith => __$PostCopyWithImpl<_Post>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Post&&(identical(other.postId, postId) || other.postId == postId)&&(identical(other.authorId, authorId) || other.authorId == authorId)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.title, title) || other.title == title)&&(identical(other.restName, restName) || other.restName == restName)&&(identical(other.meetDate, meetDate) || other.meetDate == meetDate)&&(identical(other.description, description) || other.description == description)&&(identical(other.map, map) || other.map == map)&&(identical(other.nickname, nickname) || other.nickname == nickname)&&(identical(other.profileImage, profileImage) || other.profileImage == profileImage)&&(identical(other.uploadAt, uploadAt) || other.uploadAt == uploadAt)&&(identical(other.updateAt, updateAt) || other.updateAt == updateAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,postId,authorId,thumbnail,title,restName,meetDate,description,map,nickname,profileImage,uploadAt,updateAt);

@override
String toString() {
  return 'Post(postId: $postId, authorId: $authorId, thumbnail: $thumbnail, title: $title, restName: $restName, meetDate: $meetDate, description: $description, map: $map, nickname: $nickname, profileImage: $profileImage, uploadAt: $uploadAt, updateAt: $updateAt)';
}


}

/// @nodoc
abstract mixin class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) _then) = __$PostCopyWithImpl;
@override @useResult
$Res call({
 String postId, String authorId, String thumbnail, String title, String restName, DateTime meetDate, String description, String? map, String nickname, String profileImage, DateTime uploadAt, DateTime? updateAt
});




}
/// @nodoc
class __$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(this._self, this._then);

  final _Post _self;
  final $Res Function(_Post) _then;

/// Create a copy of Post
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? postId = null,Object? authorId = null,Object? thumbnail = null,Object? title = null,Object? restName = null,Object? meetDate = null,Object? description = null,Object? map = freezed,Object? nickname = null,Object? profileImage = null,Object? uploadAt = null,Object? updateAt = freezed,}) {
  return _then(_Post(
postId: null == postId ? _self.postId : postId // ignore: cast_nullable_to_non_nullable
as String,authorId: null == authorId ? _self.authorId : authorId // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,restName: null == restName ? _self.restName : restName // ignore: cast_nullable_to_non_nullable
as String,meetDate: null == meetDate ? _self.meetDate : meetDate // ignore: cast_nullable_to_non_nullable
as DateTime,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,map: freezed == map ? _self.map : map // ignore: cast_nullable_to_non_nullable
as String?,nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,profileImage: null == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as String,uploadAt: null == uploadAt ? _self.uploadAt : uploadAt // ignore: cast_nullable_to_non_nullable
as DateTime,updateAt: freezed == updateAt ? _self.updateAt : updateAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
