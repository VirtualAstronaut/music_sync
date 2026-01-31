// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VideoInfo {

 String get title; String get author; String get duration; String get url; String get thumbnail; String get audioUrl; String get videoId;
/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VideoInfoCopyWith<VideoInfo> get copyWith => _$VideoInfoCopyWithImpl<VideoInfo>(this as VideoInfo, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VideoInfo&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.videoId, videoId) || other.videoId == videoId));
}


@override
int get hashCode => Object.hash(runtimeType,title,author,duration,url,thumbnail,audioUrl,videoId);

@override
String toString() {
  return 'VideoInfo(title: $title, author: $author, duration: $duration, url: $url, thumbnail: $thumbnail, audioUrl: $audioUrl, videoId: $videoId)';
}


}

/// @nodoc
abstract mixin class $VideoInfoCopyWith<$Res>  {
  factory $VideoInfoCopyWith(VideoInfo value, $Res Function(VideoInfo) _then) = _$VideoInfoCopyWithImpl;
@useResult
$Res call({
 String title, String author, String duration, String url, String thumbnail, String audioUrl, String videoId
});




}
/// @nodoc
class _$VideoInfoCopyWithImpl<$Res>
    implements $VideoInfoCopyWith<$Res> {
  _$VideoInfoCopyWithImpl(this._self, this._then);

  final VideoInfo _self;
  final $Res Function(VideoInfo) _then;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? author = null,Object? duration = null,Object? url = null,Object? thumbnail = null,Object? audioUrl = null,Object? videoId = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VideoInfo].
extension VideoInfoPatterns on VideoInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VideoInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VideoInfo value)  $default,){
final _that = this;
switch (_that) {
case _VideoInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VideoInfo value)?  $default,){
final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String author,  String duration,  String url,  String thumbnail,  String audioUrl,  String videoId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
return $default(_that.title,_that.author,_that.duration,_that.url,_that.thumbnail,_that.audioUrl,_that.videoId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String author,  String duration,  String url,  String thumbnail,  String audioUrl,  String videoId)  $default,) {final _that = this;
switch (_that) {
case _VideoInfo():
return $default(_that.title,_that.author,_that.duration,_that.url,_that.thumbnail,_that.audioUrl,_that.videoId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String author,  String duration,  String url,  String thumbnail,  String audioUrl,  String videoId)?  $default,) {final _that = this;
switch (_that) {
case _VideoInfo() when $default != null:
return $default(_that.title,_that.author,_that.duration,_that.url,_that.thumbnail,_that.audioUrl,_that.videoId);case _:
  return null;

}
}

}

/// @nodoc


class _VideoInfo implements VideoInfo {
  const _VideoInfo({required this.title, required this.author, required this.duration, required this.url, required this.thumbnail, required this.audioUrl, required this.videoId});
  

@override final  String title;
@override final  String author;
@override final  String duration;
@override final  String url;
@override final  String thumbnail;
@override final  String audioUrl;
@override final  String videoId;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VideoInfoCopyWith<_VideoInfo> get copyWith => __$VideoInfoCopyWithImpl<_VideoInfo>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VideoInfo&&(identical(other.title, title) || other.title == title)&&(identical(other.author, author) || other.author == author)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.url, url) || other.url == url)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.audioUrl, audioUrl) || other.audioUrl == audioUrl)&&(identical(other.videoId, videoId) || other.videoId == videoId));
}


@override
int get hashCode => Object.hash(runtimeType,title,author,duration,url,thumbnail,audioUrl,videoId);

@override
String toString() {
  return 'VideoInfo(title: $title, author: $author, duration: $duration, url: $url, thumbnail: $thumbnail, audioUrl: $audioUrl, videoId: $videoId)';
}


}

/// @nodoc
abstract mixin class _$VideoInfoCopyWith<$Res> implements $VideoInfoCopyWith<$Res> {
  factory _$VideoInfoCopyWith(_VideoInfo value, $Res Function(_VideoInfo) _then) = __$VideoInfoCopyWithImpl;
@override @useResult
$Res call({
 String title, String author, String duration, String url, String thumbnail, String audioUrl, String videoId
});




}
/// @nodoc
class __$VideoInfoCopyWithImpl<$Res>
    implements _$VideoInfoCopyWith<$Res> {
  __$VideoInfoCopyWithImpl(this._self, this._then);

  final _VideoInfo _self;
  final $Res Function(_VideoInfo) _then;

/// Create a copy of VideoInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? author = null,Object? duration = null,Object? url = null,Object? thumbnail = null,Object? audioUrl = null,Object? videoId = null,}) {
  return _then(_VideoInfo(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,author: null == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,thumbnail: null == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String,audioUrl: null == audioUrl ? _self.audioUrl : audioUrl // ignore: cast_nullable_to_non_nullable
as String,videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
