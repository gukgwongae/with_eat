// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PostDetail {

 String get id; String get hostId; String get hostNickname; String get hostProfileImage; String get postTitle; String get description; String get restName; Location get location; List<String> get images; DateTime get reservedAt; String get chatroomId;
/// Create a copy of PostDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostDetailCopyWith<PostDetail> get copyWith => _$PostDetailCopyWithImpl<PostDetail>(this as PostDetail, _$identity);

  /// Serializes this PostDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.hostNickname, hostNickname) || other.hostNickname == hostNickname)&&(identical(other.hostProfileImage, hostProfileImage) || other.hostProfileImage == hostProfileImage)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.restName, restName) || other.restName == restName)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.images, images)&&(identical(other.reservedAt, reservedAt) || other.reservedAt == reservedAt)&&(identical(other.chatroomId, chatroomId) || other.chatroomId == chatroomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hostId,hostNickname,hostProfileImage,postTitle,description,restName,location,const DeepCollectionEquality().hash(images),reservedAt,chatroomId);

@override
String toString() {
  return 'PostDetail(id: $id, hostId: $hostId, hostNickname: $hostNickname, hostProfileImage: $hostProfileImage, postTitle: $postTitle, description: $description, restName: $restName, location: $location, images: $images, reservedAt: $reservedAt, chatroomId: $chatroomId)';
}


}

/// @nodoc
abstract mixin class $PostDetailCopyWith<$Res>  {
  factory $PostDetailCopyWith(PostDetail value, $Res Function(PostDetail) _then) = _$PostDetailCopyWithImpl;
@useResult
$Res call({
 String id, String hostId, String hostNickname, String hostProfileImage, String postTitle, String description, String restName, Location location, List<String> images, DateTime reservedAt, String chatroomId
});


$LocationCopyWith<$Res> get location;

}
/// @nodoc
class _$PostDetailCopyWithImpl<$Res>
    implements $PostDetailCopyWith<$Res> {
  _$PostDetailCopyWithImpl(this._self, this._then);

  final PostDetail _self;
  final $Res Function(PostDetail) _then;

/// Create a copy of PostDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? hostId = null,Object? hostNickname = null,Object? hostProfileImage = null,Object? postTitle = null,Object? description = null,Object? restName = null,Object? location = null,Object? images = null,Object? reservedAt = null,Object? chatroomId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hostId: null == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as String,hostNickname: null == hostNickname ? _self.hostNickname : hostNickname // ignore: cast_nullable_to_non_nullable
as String,hostProfileImage: null == hostProfileImage ? _self.hostProfileImage : hostProfileImage // ignore: cast_nullable_to_non_nullable
as String,postTitle: null == postTitle ? _self.postTitle : postTitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,restName: null == restName ? _self.restName : restName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,images: null == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<String>,reservedAt: null == reservedAt ? _self.reservedAt : reservedAt // ignore: cast_nullable_to_non_nullable
as DateTime,chatroomId: null == chatroomId ? _self.chatroomId : chatroomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of PostDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [PostDetail].
extension PostDetailPatterns on PostDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostDetail value)  $default,){
final _that = this;
switch (_that) {
case _PostDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostDetail value)?  $default,){
final _that = this;
switch (_that) {
case _PostDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String hostId,  String hostNickname,  String hostProfileImage,  String postTitle,  String description,  String restName,  Location location,  List<String> images,  DateTime reservedAt,  String chatroomId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostDetail() when $default != null:
return $default(_that.id,_that.hostId,_that.hostNickname,_that.hostProfileImage,_that.postTitle,_that.description,_that.restName,_that.location,_that.images,_that.reservedAt,_that.chatroomId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String hostId,  String hostNickname,  String hostProfileImage,  String postTitle,  String description,  String restName,  Location location,  List<String> images,  DateTime reservedAt,  String chatroomId)  $default,) {final _that = this;
switch (_that) {
case _PostDetail():
return $default(_that.id,_that.hostId,_that.hostNickname,_that.hostProfileImage,_that.postTitle,_that.description,_that.restName,_that.location,_that.images,_that.reservedAt,_that.chatroomId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String hostId,  String hostNickname,  String hostProfileImage,  String postTitle,  String description,  String restName,  Location location,  List<String> images,  DateTime reservedAt,  String chatroomId)?  $default,) {final _that = this;
switch (_that) {
case _PostDetail() when $default != null:
return $default(_that.id,_that.hostId,_that.hostNickname,_that.hostProfileImage,_that.postTitle,_that.description,_that.restName,_that.location,_that.images,_that.reservedAt,_that.chatroomId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostDetail implements PostDetail {
   _PostDetail({required this.id, required this.hostId, required this.hostNickname, required this.hostProfileImage, required this.postTitle, required this.description, required this.restName, required this.location, required final  List<String> images, required this.reservedAt, required this.chatroomId}): _images = images;
  factory _PostDetail.fromJson(Map<String, dynamic> json) => _$PostDetailFromJson(json);

@override final  String id;
@override final  String hostId;
@override final  String hostNickname;
@override final  String hostProfileImage;
@override final  String postTitle;
@override final  String description;
@override final  String restName;
@override final  Location location;
 final  List<String> _images;
@override List<String> get images {
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_images);
}

@override final  DateTime reservedAt;
@override final  String chatroomId;

/// Create a copy of PostDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostDetailCopyWith<_PostDetail> get copyWith => __$PostDetailCopyWithImpl<_PostDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.hostId, hostId) || other.hostId == hostId)&&(identical(other.hostNickname, hostNickname) || other.hostNickname == hostNickname)&&(identical(other.hostProfileImage, hostProfileImage) || other.hostProfileImage == hostProfileImage)&&(identical(other.postTitle, postTitle) || other.postTitle == postTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.restName, restName) || other.restName == restName)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._images, _images)&&(identical(other.reservedAt, reservedAt) || other.reservedAt == reservedAt)&&(identical(other.chatroomId, chatroomId) || other.chatroomId == chatroomId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,hostId,hostNickname,hostProfileImage,postTitle,description,restName,location,const DeepCollectionEquality().hash(_images),reservedAt,chatroomId);

@override
String toString() {
  return 'PostDetail(id: $id, hostId: $hostId, hostNickname: $hostNickname, hostProfileImage: $hostProfileImage, postTitle: $postTitle, description: $description, restName: $restName, location: $location, images: $images, reservedAt: $reservedAt, chatroomId: $chatroomId)';
}


}

/// @nodoc
abstract mixin class _$PostDetailCopyWith<$Res> implements $PostDetailCopyWith<$Res> {
  factory _$PostDetailCopyWith(_PostDetail value, $Res Function(_PostDetail) _then) = __$PostDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String hostId, String hostNickname, String hostProfileImage, String postTitle, String description, String restName, Location location, List<String> images, DateTime reservedAt, String chatroomId
});


@override $LocationCopyWith<$Res> get location;

}
/// @nodoc
class __$PostDetailCopyWithImpl<$Res>
    implements _$PostDetailCopyWith<$Res> {
  __$PostDetailCopyWithImpl(this._self, this._then);

  final _PostDetail _self;
  final $Res Function(_PostDetail) _then;

/// Create a copy of PostDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? hostId = null,Object? hostNickname = null,Object? hostProfileImage = null,Object? postTitle = null,Object? description = null,Object? restName = null,Object? location = null,Object? images = null,Object? reservedAt = null,Object? chatroomId = null,}) {
  return _then(_PostDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,hostId: null == hostId ? _self.hostId : hostId // ignore: cast_nullable_to_non_nullable
as String,hostNickname: null == hostNickname ? _self.hostNickname : hostNickname // ignore: cast_nullable_to_non_nullable
as String,hostProfileImage: null == hostProfileImage ? _self.hostProfileImage : hostProfileImage // ignore: cast_nullable_to_non_nullable
as String,postTitle: null == postTitle ? _self.postTitle : postTitle // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,restName: null == restName ? _self.restName : restName // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,images: null == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<String>,reservedAt: null == reservedAt ? _self.reservedAt : reservedAt // ignore: cast_nullable_to_non_nullable
as DateTime,chatroomId: null == chatroomId ? _self.chatroomId : chatroomId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of PostDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res> get location {
  
  return $LocationCopyWith<$Res>(_self.location, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// @nodoc
mixin _$Location {

 double get lat; double get lng; String get address;
/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocationCopyWith<Location> get copyWith => _$LocationCopyWithImpl<Location>(this as Location, _$identity);

  /// Serializes this Location to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Location&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address);

@override
String toString() {
  return 'Location(lat: $lat, lng: $lng, address: $address)';
}


}

/// @nodoc
abstract mixin class $LocationCopyWith<$Res>  {
  factory $LocationCopyWith(Location value, $Res Function(Location) _then) = _$LocationCopyWithImpl;
@useResult
$Res call({
 double lat, double lng, String address
});




}
/// @nodoc
class _$LocationCopyWithImpl<$Res>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._self, this._then);

  final Location _self;
  final $Res Function(Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lat = null,Object? lng = null,Object? address = null,}) {
  return _then(_self.copyWith(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Location].
extension LocationPatterns on Location {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Location value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Location value)  $default,){
final _that = this;
switch (_that) {
case _Location():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Location value)?  $default,){
final _that = this;
switch (_that) {
case _Location() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double lat,  double lng,  String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.lat,_that.lng,_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double lat,  double lng,  String address)  $default,) {final _that = this;
switch (_that) {
case _Location():
return $default(_that.lat,_that.lng,_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double lat,  double lng,  String address)?  $default,) {final _that = this;
switch (_that) {
case _Location() when $default != null:
return $default(_that.lat,_that.lng,_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Location implements Location {
   _Location({required this.lat, required this.lng, required this.address});
  factory _Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

@override final  double lat;
@override final  double lng;
@override final  String address;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocationCopyWith<_Location> get copyWith => __$LocationCopyWithImpl<_Location>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Location&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lat,lng,address);

@override
String toString() {
  return 'Location(lat: $lat, lng: $lng, address: $address)';
}


}

/// @nodoc
abstract mixin class _$LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$LocationCopyWith(_Location value, $Res Function(_Location) _then) = __$LocationCopyWithImpl;
@override @useResult
$Res call({
 double lat, double lng, String address
});




}
/// @nodoc
class __$LocationCopyWithImpl<$Res>
    implements _$LocationCopyWith<$Res> {
  __$LocationCopyWithImpl(this._self, this._then);

  final _Location _self;
  final $Res Function(_Location) _then;

/// Create a copy of Location
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lat = null,Object? lng = null,Object? address = null,}) {
  return _then(_Location(
lat: null == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double,lng: null == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
