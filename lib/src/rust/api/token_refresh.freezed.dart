// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_refresh.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DartTokenInfo {

 String get token; BigInt get expiration;
/// Create a copy of DartTokenInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartTokenInfoCopyWith<DartTokenInfo> get copyWith => _$DartTokenInfoCopyWithImpl<DartTokenInfo>(this as DartTokenInfo, _$identity);

  /// Serializes this DartTokenInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartTokenInfo&&(identical(other.token, token) || other.token == token)&&(identical(other.expiration, expiration) || other.expiration == expiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiration);

@override
String toString() {
  return 'DartTokenInfo(token: $token, expiration: $expiration)';
}


}

/// @nodoc
abstract mixin class $DartTokenInfoCopyWith<$Res>  {
  factory $DartTokenInfoCopyWith(DartTokenInfo value, $Res Function(DartTokenInfo) _then) = _$DartTokenInfoCopyWithImpl;
@useResult
$Res call({
 String token, BigInt expiration
});




}
/// @nodoc
class _$DartTokenInfoCopyWithImpl<$Res>
    implements $DartTokenInfoCopyWith<$Res> {
  _$DartTokenInfoCopyWithImpl(this._self, this._then);

  final DartTokenInfo _self;
  final $Res Function(DartTokenInfo) _then;

/// Create a copy of DartTokenInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? expiration = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}

}


/// Adds pattern-matching-related methods to [DartTokenInfo].
extension DartTokenInfoPatterns on DartTokenInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartTokenInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartTokenInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartTokenInfo value)  $default,){
final _that = this;
switch (_that) {
case _DartTokenInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartTokenInfo value)?  $default,){
final _that = this;
switch (_that) {
case _DartTokenInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  BigInt expiration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartTokenInfo() when $default != null:
return $default(_that.token,_that.expiration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  BigInt expiration)  $default,) {final _that = this;
switch (_that) {
case _DartTokenInfo():
return $default(_that.token,_that.expiration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  BigInt expiration)?  $default,) {final _that = this;
switch (_that) {
case _DartTokenInfo() when $default != null:
return $default(_that.token,_that.expiration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartTokenInfo implements DartTokenInfo {
  const _DartTokenInfo({required this.token, required this.expiration});
  factory _DartTokenInfo.fromJson(Map<String, dynamic> json) => _$DartTokenInfoFromJson(json);

@override final  String token;
@override final  BigInt expiration;

/// Create a copy of DartTokenInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartTokenInfoCopyWith<_DartTokenInfo> get copyWith => __$DartTokenInfoCopyWithImpl<_DartTokenInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartTokenInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartTokenInfo&&(identical(other.token, token) || other.token == token)&&(identical(other.expiration, expiration) || other.expiration == expiration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,expiration);

@override
String toString() {
  return 'DartTokenInfo(token: $token, expiration: $expiration)';
}


}

/// @nodoc
abstract mixin class _$DartTokenInfoCopyWith<$Res> implements $DartTokenInfoCopyWith<$Res> {
  factory _$DartTokenInfoCopyWith(_DartTokenInfo value, $Res Function(_DartTokenInfo) _then) = __$DartTokenInfoCopyWithImpl;
@override @useResult
$Res call({
 String token, BigInt expiration
});




}
/// @nodoc
class __$DartTokenInfoCopyWithImpl<$Res>
    implements _$DartTokenInfoCopyWith<$Res> {
  __$DartTokenInfoCopyWithImpl(this._self, this._then);

  final _DartTokenInfo _self;
  final $Res Function(_DartTokenInfo) _then;

/// Create a copy of DartTokenInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? expiration = null,}) {
  return _then(_DartTokenInfo(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,expiration: null == expiration ? _self.expiration : expiration // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}


}

// dart format on
