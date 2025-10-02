// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DartXetDownloadInfo {

 String get destinationPath; String get hash; BigInt get fileSize;
/// Create a copy of DartXetDownloadInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartXetDownloadInfoCopyWith<DartXetDownloadInfo> get copyWith => _$DartXetDownloadInfoCopyWithImpl<DartXetDownloadInfo>(this as DartXetDownloadInfo, _$identity);

  /// Serializes this DartXetDownloadInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartXetDownloadInfo&&(identical(other.destinationPath, destinationPath) || other.destinationPath == destinationPath)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationPath,hash,fileSize);

@override
String toString() {
  return 'DartXetDownloadInfo(destinationPath: $destinationPath, hash: $hash, fileSize: $fileSize)';
}


}

/// @nodoc
abstract mixin class $DartXetDownloadInfoCopyWith<$Res>  {
  factory $DartXetDownloadInfoCopyWith(DartXetDownloadInfo value, $Res Function(DartXetDownloadInfo) _then) = _$DartXetDownloadInfoCopyWithImpl;
@useResult
$Res call({
 String destinationPath, String hash, BigInt fileSize
});




}
/// @nodoc
class _$DartXetDownloadInfoCopyWithImpl<$Res>
    implements $DartXetDownloadInfoCopyWith<$Res> {
  _$DartXetDownloadInfoCopyWithImpl(this._self, this._then);

  final DartXetDownloadInfo _self;
  final $Res Function(DartXetDownloadInfo) _then;

/// Create a copy of DartXetDownloadInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? destinationPath = null,Object? hash = null,Object? fileSize = null,}) {
  return _then(_self.copyWith(
destinationPath: null == destinationPath ? _self.destinationPath : destinationPath // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}

}


/// Adds pattern-matching-related methods to [DartXetDownloadInfo].
extension DartXetDownloadInfoPatterns on DartXetDownloadInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartXetDownloadInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartXetDownloadInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartXetDownloadInfo value)  $default,){
final _that = this;
switch (_that) {
case _DartXetDownloadInfo():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartXetDownloadInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DartXetDownloadInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String destinationPath,  String hash,  BigInt fileSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartXetDownloadInfo() when $default != null:
return $default(_that.destinationPath,_that.hash,_that.fileSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String destinationPath,  String hash,  BigInt fileSize)  $default,) {final _that = this;
switch (_that) {
case _DartXetDownloadInfo():
return $default(_that.destinationPath,_that.hash,_that.fileSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String destinationPath,  String hash,  BigInt fileSize)?  $default,) {final _that = this;
switch (_that) {
case _DartXetDownloadInfo() when $default != null:
return $default(_that.destinationPath,_that.hash,_that.fileSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartXetDownloadInfo extends DartXetDownloadInfo {
  const _DartXetDownloadInfo({required this.destinationPath, required this.hash, required this.fileSize}): super._();
  factory _DartXetDownloadInfo.fromJson(Map<String, dynamic> json) => _$DartXetDownloadInfoFromJson(json);

@override final  String destinationPath;
@override final  String hash;
@override final  BigInt fileSize;

/// Create a copy of DartXetDownloadInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartXetDownloadInfoCopyWith<_DartXetDownloadInfo> get copyWith => __$DartXetDownloadInfoCopyWithImpl<_DartXetDownloadInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartXetDownloadInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartXetDownloadInfo&&(identical(other.destinationPath, destinationPath) || other.destinationPath == destinationPath)&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,destinationPath,hash,fileSize);

@override
String toString() {
  return 'DartXetDownloadInfo(destinationPath: $destinationPath, hash: $hash, fileSize: $fileSize)';
}


}

/// @nodoc
abstract mixin class _$DartXetDownloadInfoCopyWith<$Res> implements $DartXetDownloadInfoCopyWith<$Res> {
  factory _$DartXetDownloadInfoCopyWith(_DartXetDownloadInfo value, $Res Function(_DartXetDownloadInfo) _then) = __$DartXetDownloadInfoCopyWithImpl;
@override @useResult
$Res call({
 String destinationPath, String hash, BigInt fileSize
});




}
/// @nodoc
class __$DartXetDownloadInfoCopyWithImpl<$Res>
    implements _$DartXetDownloadInfoCopyWith<$Res> {
  __$DartXetDownloadInfoCopyWithImpl(this._self, this._then);

  final _DartXetDownloadInfo _self;
  final $Res Function(_DartXetDownloadInfo) _then;

/// Create a copy of DartXetDownloadInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? destinationPath = null,Object? hash = null,Object? fileSize = null,}) {
  return _then(_DartXetDownloadInfo(
destinationPath: null == destinationPath ? _self.destinationPath : destinationPath // ignore: cast_nullable_to_non_nullable
as String,hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}


}


/// @nodoc
mixin _$DartXetUploadInfo {

 String get hash; BigInt get fileSize;
/// Create a copy of DartXetUploadInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartXetUploadInfoCopyWith<DartXetUploadInfo> get copyWith => _$DartXetUploadInfoCopyWithImpl<DartXetUploadInfo>(this as DartXetUploadInfo, _$identity);

  /// Serializes this DartXetUploadInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartXetUploadInfo&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,fileSize);

@override
String toString() {
  return 'DartXetUploadInfo(hash: $hash, fileSize: $fileSize)';
}


}

/// @nodoc
abstract mixin class $DartXetUploadInfoCopyWith<$Res>  {
  factory $DartXetUploadInfoCopyWith(DartXetUploadInfo value, $Res Function(DartXetUploadInfo) _then) = _$DartXetUploadInfoCopyWithImpl;
@useResult
$Res call({
 String hash, BigInt fileSize
});




}
/// @nodoc
class _$DartXetUploadInfoCopyWithImpl<$Res>
    implements $DartXetUploadInfoCopyWith<$Res> {
  _$DartXetUploadInfoCopyWithImpl(this._self, this._then);

  final DartXetUploadInfo _self;
  final $Res Function(DartXetUploadInfo) _then;

/// Create a copy of DartXetUploadInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hash = null,Object? fileSize = null,}) {
  return _then(_self.copyWith(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}

}


/// Adds pattern-matching-related methods to [DartXetUploadInfo].
extension DartXetUploadInfoPatterns on DartXetUploadInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartXetUploadInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartXetUploadInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartXetUploadInfo value)  $default,){
final _that = this;
switch (_that) {
case _DartXetUploadInfo():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartXetUploadInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DartXetUploadInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String hash,  BigInt fileSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartXetUploadInfo() when $default != null:
return $default(_that.hash,_that.fileSize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String hash,  BigInt fileSize)  $default,) {final _that = this;
switch (_that) {
case _DartXetUploadInfo():
return $default(_that.hash,_that.fileSize);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String hash,  BigInt fileSize)?  $default,) {final _that = this;
switch (_that) {
case _DartXetUploadInfo() when $default != null:
return $default(_that.hash,_that.fileSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartXetUploadInfo extends DartXetUploadInfo {
  const _DartXetUploadInfo({required this.hash, required this.fileSize}): super._();
  factory _DartXetUploadInfo.fromJson(Map<String, dynamic> json) => _$DartXetUploadInfoFromJson(json);

@override final  String hash;
@override final  BigInt fileSize;

/// Create a copy of DartXetUploadInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartXetUploadInfoCopyWith<_DartXetUploadInfo> get copyWith => __$DartXetUploadInfoCopyWithImpl<_DartXetUploadInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartXetUploadInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartXetUploadInfo&&(identical(other.hash, hash) || other.hash == hash)&&(identical(other.fileSize, fileSize) || other.fileSize == fileSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hash,fileSize);

@override
String toString() {
  return 'DartXetUploadInfo(hash: $hash, fileSize: $fileSize)';
}


}

/// @nodoc
abstract mixin class _$DartXetUploadInfoCopyWith<$Res> implements $DartXetUploadInfoCopyWith<$Res> {
  factory _$DartXetUploadInfoCopyWith(_DartXetUploadInfo value, $Res Function(_DartXetUploadInfo) _then) = __$DartXetUploadInfoCopyWithImpl;
@override @useResult
$Res call({
 String hash, BigInt fileSize
});




}
/// @nodoc
class __$DartXetUploadInfoCopyWithImpl<$Res>
    implements _$DartXetUploadInfoCopyWith<$Res> {
  __$DartXetUploadInfoCopyWithImpl(this._self, this._then);

  final _DartXetUploadInfo _self;
  final $Res Function(_DartXetUploadInfo) _then;

/// Create a copy of DartXetUploadInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hash = null,Object? fileSize = null,}) {
  return _then(_DartXetUploadInfo(
hash: null == hash ? _self.hash : hash // ignore: cast_nullable_to_non_nullable
as String,fileSize: null == fileSize ? _self.fileSize : fileSize // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}


}

// dart format on
