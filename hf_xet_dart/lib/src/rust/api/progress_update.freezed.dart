// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_update.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DartItemProgressUpdate {

 String get itemName; BigInt get totalBytes; BigInt get bytesCompleted; BigInt get bytesCompletionIncrement;
/// Create a copy of DartItemProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartItemProgressUpdateCopyWith<DartItemProgressUpdate> get copyWith => _$DartItemProgressUpdateCopyWithImpl<DartItemProgressUpdate>(this as DartItemProgressUpdate, _$identity);

  /// Serializes this DartItemProgressUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartItemProgressUpdate&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.bytesCompleted, bytesCompleted) || other.bytesCompleted == bytesCompleted)&&(identical(other.bytesCompletionIncrement, bytesCompletionIncrement) || other.bytesCompletionIncrement == bytesCompletionIncrement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,totalBytes,bytesCompleted,bytesCompletionIncrement);

@override
String toString() {
  return 'DartItemProgressUpdate(itemName: $itemName, totalBytes: $totalBytes, bytesCompleted: $bytesCompleted, bytesCompletionIncrement: $bytesCompletionIncrement)';
}


}

/// @nodoc
abstract mixin class $DartItemProgressUpdateCopyWith<$Res>  {
  factory $DartItemProgressUpdateCopyWith(DartItemProgressUpdate value, $Res Function(DartItemProgressUpdate) _then) = _$DartItemProgressUpdateCopyWithImpl;
@useResult
$Res call({
 String itemName, BigInt totalBytes, BigInt bytesCompleted, BigInt bytesCompletionIncrement
});




}
/// @nodoc
class _$DartItemProgressUpdateCopyWithImpl<$Res>
    implements $DartItemProgressUpdateCopyWith<$Res> {
  _$DartItemProgressUpdateCopyWithImpl(this._self, this._then);

  final DartItemProgressUpdate _self;
  final $Res Function(DartItemProgressUpdate) _then;

/// Create a copy of DartItemProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemName = null,Object? totalBytes = null,Object? bytesCompleted = null,Object? bytesCompletionIncrement = null,}) {
  return _then(_self.copyWith(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as BigInt,bytesCompleted: null == bytesCompleted ? _self.bytesCompleted : bytesCompleted // ignore: cast_nullable_to_non_nullable
as BigInt,bytesCompletionIncrement: null == bytesCompletionIncrement ? _self.bytesCompletionIncrement : bytesCompletionIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}

}


/// Adds pattern-matching-related methods to [DartItemProgressUpdate].
extension DartItemProgressUpdatePatterns on DartItemProgressUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartItemProgressUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartItemProgressUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartItemProgressUpdate value)  $default,){
final _that = this;
switch (_that) {
case _DartItemProgressUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartItemProgressUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _DartItemProgressUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemName,  BigInt totalBytes,  BigInt bytesCompleted,  BigInt bytesCompletionIncrement)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartItemProgressUpdate() when $default != null:
return $default(_that.itemName,_that.totalBytes,_that.bytesCompleted,_that.bytesCompletionIncrement);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemName,  BigInt totalBytes,  BigInt bytesCompleted,  BigInt bytesCompletionIncrement)  $default,) {final _that = this;
switch (_that) {
case _DartItemProgressUpdate():
return $default(_that.itemName,_that.totalBytes,_that.bytesCompleted,_that.bytesCompletionIncrement);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemName,  BigInt totalBytes,  BigInt bytesCompleted,  BigInt bytesCompletionIncrement)?  $default,) {final _that = this;
switch (_that) {
case _DartItemProgressUpdate() when $default != null:
return $default(_that.itemName,_that.totalBytes,_that.bytesCompleted,_that.bytesCompletionIncrement);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartItemProgressUpdate implements DartItemProgressUpdate {
  const _DartItemProgressUpdate({required this.itemName, required this.totalBytes, required this.bytesCompleted, required this.bytesCompletionIncrement});
  factory _DartItemProgressUpdate.fromJson(Map<String, dynamic> json) => _$DartItemProgressUpdateFromJson(json);

@override final  String itemName;
@override final  BigInt totalBytes;
@override final  BigInt bytesCompleted;
@override final  BigInt bytesCompletionIncrement;

/// Create a copy of DartItemProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartItemProgressUpdateCopyWith<_DartItemProgressUpdate> get copyWith => __$DartItemProgressUpdateCopyWithImpl<_DartItemProgressUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartItemProgressUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartItemProgressUpdate&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.bytesCompleted, bytesCompleted) || other.bytesCompleted == bytesCompleted)&&(identical(other.bytesCompletionIncrement, bytesCompletionIncrement) || other.bytesCompletionIncrement == bytesCompletionIncrement));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemName,totalBytes,bytesCompleted,bytesCompletionIncrement);

@override
String toString() {
  return 'DartItemProgressUpdate(itemName: $itemName, totalBytes: $totalBytes, bytesCompleted: $bytesCompleted, bytesCompletionIncrement: $bytesCompletionIncrement)';
}


}

/// @nodoc
abstract mixin class _$DartItemProgressUpdateCopyWith<$Res> implements $DartItemProgressUpdateCopyWith<$Res> {
  factory _$DartItemProgressUpdateCopyWith(_DartItemProgressUpdate value, $Res Function(_DartItemProgressUpdate) _then) = __$DartItemProgressUpdateCopyWithImpl;
@override @useResult
$Res call({
 String itemName, BigInt totalBytes, BigInt bytesCompleted, BigInt bytesCompletionIncrement
});




}
/// @nodoc
class __$DartItemProgressUpdateCopyWithImpl<$Res>
    implements _$DartItemProgressUpdateCopyWith<$Res> {
  __$DartItemProgressUpdateCopyWithImpl(this._self, this._then);

  final _DartItemProgressUpdate _self;
  final $Res Function(_DartItemProgressUpdate) _then;

/// Create a copy of DartItemProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemName = null,Object? totalBytes = null,Object? bytesCompleted = null,Object? bytesCompletionIncrement = null,}) {
  return _then(_DartItemProgressUpdate(
itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as BigInt,bytesCompleted: null == bytesCompleted ? _self.bytesCompleted : bytesCompleted // ignore: cast_nullable_to_non_nullable
as BigInt,bytesCompletionIncrement: null == bytesCompletionIncrement ? _self.bytesCompletionIncrement : bytesCompletionIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,
  ));
}


}


/// @nodoc
mixin _$DartTotalProgressUpdate {

 BigInt get totalBytes; BigInt get totalBytesIncrement; BigInt get totalBytesCompleted; BigInt get totalBytesCompletionIncrement; double? get totalBytesCompletionRate; BigInt get totalTransferBytes; BigInt get totalTransferBytesIncrement; BigInt get totalTransferBytesCompleted; BigInt get totalTransferBytesCompletionIncrement; double? get totalTransferBytesCompletionRate;
/// Create a copy of DartTotalProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DartTotalProgressUpdateCopyWith<DartTotalProgressUpdate> get copyWith => _$DartTotalProgressUpdateCopyWithImpl<DartTotalProgressUpdate>(this as DartTotalProgressUpdate, _$identity);

  /// Serializes this DartTotalProgressUpdate to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DartTotalProgressUpdate&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.totalBytesIncrement, totalBytesIncrement) || other.totalBytesIncrement == totalBytesIncrement)&&(identical(other.totalBytesCompleted, totalBytesCompleted) || other.totalBytesCompleted == totalBytesCompleted)&&(identical(other.totalBytesCompletionIncrement, totalBytesCompletionIncrement) || other.totalBytesCompletionIncrement == totalBytesCompletionIncrement)&&(identical(other.totalBytesCompletionRate, totalBytesCompletionRate) || other.totalBytesCompletionRate == totalBytesCompletionRate)&&(identical(other.totalTransferBytes, totalTransferBytes) || other.totalTransferBytes == totalTransferBytes)&&(identical(other.totalTransferBytesIncrement, totalTransferBytesIncrement) || other.totalTransferBytesIncrement == totalTransferBytesIncrement)&&(identical(other.totalTransferBytesCompleted, totalTransferBytesCompleted) || other.totalTransferBytesCompleted == totalTransferBytesCompleted)&&(identical(other.totalTransferBytesCompletionIncrement, totalTransferBytesCompletionIncrement) || other.totalTransferBytesCompletionIncrement == totalTransferBytesCompletionIncrement)&&(identical(other.totalTransferBytesCompletionRate, totalTransferBytesCompletionRate) || other.totalTransferBytesCompletionRate == totalTransferBytesCompletionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBytes,totalBytesIncrement,totalBytesCompleted,totalBytesCompletionIncrement,totalBytesCompletionRate,totalTransferBytes,totalTransferBytesIncrement,totalTransferBytesCompleted,totalTransferBytesCompletionIncrement,totalTransferBytesCompletionRate);

@override
String toString() {
  return 'DartTotalProgressUpdate(totalBytes: $totalBytes, totalBytesIncrement: $totalBytesIncrement, totalBytesCompleted: $totalBytesCompleted, totalBytesCompletionIncrement: $totalBytesCompletionIncrement, totalBytesCompletionRate: $totalBytesCompletionRate, totalTransferBytes: $totalTransferBytes, totalTransferBytesIncrement: $totalTransferBytesIncrement, totalTransferBytesCompleted: $totalTransferBytesCompleted, totalTransferBytesCompletionIncrement: $totalTransferBytesCompletionIncrement, totalTransferBytesCompletionRate: $totalTransferBytesCompletionRate)';
}


}

/// @nodoc
abstract mixin class $DartTotalProgressUpdateCopyWith<$Res>  {
  factory $DartTotalProgressUpdateCopyWith(DartTotalProgressUpdate value, $Res Function(DartTotalProgressUpdate) _then) = _$DartTotalProgressUpdateCopyWithImpl;
@useResult
$Res call({
 BigInt totalBytes, BigInt totalBytesIncrement, BigInt totalBytesCompleted, BigInt totalBytesCompletionIncrement, double? totalBytesCompletionRate, BigInt totalTransferBytes, BigInt totalTransferBytesIncrement, BigInt totalTransferBytesCompleted, BigInt totalTransferBytesCompletionIncrement, double? totalTransferBytesCompletionRate
});




}
/// @nodoc
class _$DartTotalProgressUpdateCopyWithImpl<$Res>
    implements $DartTotalProgressUpdateCopyWith<$Res> {
  _$DartTotalProgressUpdateCopyWithImpl(this._self, this._then);

  final DartTotalProgressUpdate _self;
  final $Res Function(DartTotalProgressUpdate) _then;

/// Create a copy of DartTotalProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBytes = null,Object? totalBytesIncrement = null,Object? totalBytesCompleted = null,Object? totalBytesCompletionIncrement = null,Object? totalBytesCompletionRate = freezed,Object? totalTransferBytes = null,Object? totalTransferBytesIncrement = null,Object? totalTransferBytesCompleted = null,Object? totalTransferBytesCompletionIncrement = null,Object? totalTransferBytesCompletionRate = freezed,}) {
  return _then(_self.copyWith(
totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesIncrement: null == totalBytesIncrement ? _self.totalBytesIncrement : totalBytesIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesCompleted: null == totalBytesCompleted ? _self.totalBytesCompleted : totalBytesCompleted // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesCompletionIncrement: null == totalBytesCompletionIncrement ? _self.totalBytesCompletionIncrement : totalBytesCompletionIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesCompletionRate: freezed == totalBytesCompletionRate ? _self.totalBytesCompletionRate : totalBytesCompletionRate // ignore: cast_nullable_to_non_nullable
as double?,totalTransferBytes: null == totalTransferBytes ? _self.totalTransferBytes : totalTransferBytes // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesIncrement: null == totalTransferBytesIncrement ? _self.totalTransferBytesIncrement : totalTransferBytesIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesCompleted: null == totalTransferBytesCompleted ? _self.totalTransferBytesCompleted : totalTransferBytesCompleted // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesCompletionIncrement: null == totalTransferBytesCompletionIncrement ? _self.totalTransferBytesCompletionIncrement : totalTransferBytesCompletionIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesCompletionRate: freezed == totalTransferBytesCompletionRate ? _self.totalTransferBytesCompletionRate : totalTransferBytesCompletionRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [DartTotalProgressUpdate].
extension DartTotalProgressUpdatePatterns on DartTotalProgressUpdate {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DartTotalProgressUpdate value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DartTotalProgressUpdate() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DartTotalProgressUpdate value)  $default,){
final _that = this;
switch (_that) {
case _DartTotalProgressUpdate():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DartTotalProgressUpdate value)?  $default,){
final _that = this;
switch (_that) {
case _DartTotalProgressUpdate() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BigInt totalBytes,  BigInt totalBytesIncrement,  BigInt totalBytesCompleted,  BigInt totalBytesCompletionIncrement,  double? totalBytesCompletionRate,  BigInt totalTransferBytes,  BigInt totalTransferBytesIncrement,  BigInt totalTransferBytesCompleted,  BigInt totalTransferBytesCompletionIncrement,  double? totalTransferBytesCompletionRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DartTotalProgressUpdate() when $default != null:
return $default(_that.totalBytes,_that.totalBytesIncrement,_that.totalBytesCompleted,_that.totalBytesCompletionIncrement,_that.totalBytesCompletionRate,_that.totalTransferBytes,_that.totalTransferBytesIncrement,_that.totalTransferBytesCompleted,_that.totalTransferBytesCompletionIncrement,_that.totalTransferBytesCompletionRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BigInt totalBytes,  BigInt totalBytesIncrement,  BigInt totalBytesCompleted,  BigInt totalBytesCompletionIncrement,  double? totalBytesCompletionRate,  BigInt totalTransferBytes,  BigInt totalTransferBytesIncrement,  BigInt totalTransferBytesCompleted,  BigInt totalTransferBytesCompletionIncrement,  double? totalTransferBytesCompletionRate)  $default,) {final _that = this;
switch (_that) {
case _DartTotalProgressUpdate():
return $default(_that.totalBytes,_that.totalBytesIncrement,_that.totalBytesCompleted,_that.totalBytesCompletionIncrement,_that.totalBytesCompletionRate,_that.totalTransferBytes,_that.totalTransferBytesIncrement,_that.totalTransferBytesCompleted,_that.totalTransferBytesCompletionIncrement,_that.totalTransferBytesCompletionRate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BigInt totalBytes,  BigInt totalBytesIncrement,  BigInt totalBytesCompleted,  BigInt totalBytesCompletionIncrement,  double? totalBytesCompletionRate,  BigInt totalTransferBytes,  BigInt totalTransferBytesIncrement,  BigInt totalTransferBytesCompleted,  BigInt totalTransferBytesCompletionIncrement,  double? totalTransferBytesCompletionRate)?  $default,) {final _that = this;
switch (_that) {
case _DartTotalProgressUpdate() when $default != null:
return $default(_that.totalBytes,_that.totalBytesIncrement,_that.totalBytesCompleted,_that.totalBytesCompletionIncrement,_that.totalBytesCompletionRate,_that.totalTransferBytes,_that.totalTransferBytesIncrement,_that.totalTransferBytesCompleted,_that.totalTransferBytesCompletionIncrement,_that.totalTransferBytesCompletionRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DartTotalProgressUpdate implements DartTotalProgressUpdate {
  const _DartTotalProgressUpdate({required this.totalBytes, required this.totalBytesIncrement, required this.totalBytesCompleted, required this.totalBytesCompletionIncrement, this.totalBytesCompletionRate, required this.totalTransferBytes, required this.totalTransferBytesIncrement, required this.totalTransferBytesCompleted, required this.totalTransferBytesCompletionIncrement, this.totalTransferBytesCompletionRate});
  factory _DartTotalProgressUpdate.fromJson(Map<String, dynamic> json) => _$DartTotalProgressUpdateFromJson(json);

@override final  BigInt totalBytes;
@override final  BigInt totalBytesIncrement;
@override final  BigInt totalBytesCompleted;
@override final  BigInt totalBytesCompletionIncrement;
@override final  double? totalBytesCompletionRate;
@override final  BigInt totalTransferBytes;
@override final  BigInt totalTransferBytesIncrement;
@override final  BigInt totalTransferBytesCompleted;
@override final  BigInt totalTransferBytesCompletionIncrement;
@override final  double? totalTransferBytesCompletionRate;

/// Create a copy of DartTotalProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DartTotalProgressUpdateCopyWith<_DartTotalProgressUpdate> get copyWith => __$DartTotalProgressUpdateCopyWithImpl<_DartTotalProgressUpdate>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DartTotalProgressUpdateToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DartTotalProgressUpdate&&(identical(other.totalBytes, totalBytes) || other.totalBytes == totalBytes)&&(identical(other.totalBytesIncrement, totalBytesIncrement) || other.totalBytesIncrement == totalBytesIncrement)&&(identical(other.totalBytesCompleted, totalBytesCompleted) || other.totalBytesCompleted == totalBytesCompleted)&&(identical(other.totalBytesCompletionIncrement, totalBytesCompletionIncrement) || other.totalBytesCompletionIncrement == totalBytesCompletionIncrement)&&(identical(other.totalBytesCompletionRate, totalBytesCompletionRate) || other.totalBytesCompletionRate == totalBytesCompletionRate)&&(identical(other.totalTransferBytes, totalTransferBytes) || other.totalTransferBytes == totalTransferBytes)&&(identical(other.totalTransferBytesIncrement, totalTransferBytesIncrement) || other.totalTransferBytesIncrement == totalTransferBytesIncrement)&&(identical(other.totalTransferBytesCompleted, totalTransferBytesCompleted) || other.totalTransferBytesCompleted == totalTransferBytesCompleted)&&(identical(other.totalTransferBytesCompletionIncrement, totalTransferBytesCompletionIncrement) || other.totalTransferBytesCompletionIncrement == totalTransferBytesCompletionIncrement)&&(identical(other.totalTransferBytesCompletionRate, totalTransferBytesCompletionRate) || other.totalTransferBytesCompletionRate == totalTransferBytesCompletionRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBytes,totalBytesIncrement,totalBytesCompleted,totalBytesCompletionIncrement,totalBytesCompletionRate,totalTransferBytes,totalTransferBytesIncrement,totalTransferBytesCompleted,totalTransferBytesCompletionIncrement,totalTransferBytesCompletionRate);

@override
String toString() {
  return 'DartTotalProgressUpdate(totalBytes: $totalBytes, totalBytesIncrement: $totalBytesIncrement, totalBytesCompleted: $totalBytesCompleted, totalBytesCompletionIncrement: $totalBytesCompletionIncrement, totalBytesCompletionRate: $totalBytesCompletionRate, totalTransferBytes: $totalTransferBytes, totalTransferBytesIncrement: $totalTransferBytesIncrement, totalTransferBytesCompleted: $totalTransferBytesCompleted, totalTransferBytesCompletionIncrement: $totalTransferBytesCompletionIncrement, totalTransferBytesCompletionRate: $totalTransferBytesCompletionRate)';
}


}

/// @nodoc
abstract mixin class _$DartTotalProgressUpdateCopyWith<$Res> implements $DartTotalProgressUpdateCopyWith<$Res> {
  factory _$DartTotalProgressUpdateCopyWith(_DartTotalProgressUpdate value, $Res Function(_DartTotalProgressUpdate) _then) = __$DartTotalProgressUpdateCopyWithImpl;
@override @useResult
$Res call({
 BigInt totalBytes, BigInt totalBytesIncrement, BigInt totalBytesCompleted, BigInt totalBytesCompletionIncrement, double? totalBytesCompletionRate, BigInt totalTransferBytes, BigInt totalTransferBytesIncrement, BigInt totalTransferBytesCompleted, BigInt totalTransferBytesCompletionIncrement, double? totalTransferBytesCompletionRate
});




}
/// @nodoc
class __$DartTotalProgressUpdateCopyWithImpl<$Res>
    implements _$DartTotalProgressUpdateCopyWith<$Res> {
  __$DartTotalProgressUpdateCopyWithImpl(this._self, this._then);

  final _DartTotalProgressUpdate _self;
  final $Res Function(_DartTotalProgressUpdate) _then;

/// Create a copy of DartTotalProgressUpdate
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBytes = null,Object? totalBytesIncrement = null,Object? totalBytesCompleted = null,Object? totalBytesCompletionIncrement = null,Object? totalBytesCompletionRate = freezed,Object? totalTransferBytes = null,Object? totalTransferBytesIncrement = null,Object? totalTransferBytesCompleted = null,Object? totalTransferBytesCompletionIncrement = null,Object? totalTransferBytesCompletionRate = freezed,}) {
  return _then(_DartTotalProgressUpdate(
totalBytes: null == totalBytes ? _self.totalBytes : totalBytes // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesIncrement: null == totalBytesIncrement ? _self.totalBytesIncrement : totalBytesIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesCompleted: null == totalBytesCompleted ? _self.totalBytesCompleted : totalBytesCompleted // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesCompletionIncrement: null == totalBytesCompletionIncrement ? _self.totalBytesCompletionIncrement : totalBytesCompletionIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalBytesCompletionRate: freezed == totalBytesCompletionRate ? _self.totalBytesCompletionRate : totalBytesCompletionRate // ignore: cast_nullable_to_non_nullable
as double?,totalTransferBytes: null == totalTransferBytes ? _self.totalTransferBytes : totalTransferBytes // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesIncrement: null == totalTransferBytesIncrement ? _self.totalTransferBytesIncrement : totalTransferBytesIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesCompleted: null == totalTransferBytesCompleted ? _self.totalTransferBytesCompleted : totalTransferBytesCompleted // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesCompletionIncrement: null == totalTransferBytesCompletionIncrement ? _self.totalTransferBytesCompletionIncrement : totalTransferBytesCompletionIncrement // ignore: cast_nullable_to_non_nullable
as BigInt,totalTransferBytesCompletionRate: freezed == totalTransferBytesCompletionRate ? _self.totalTransferBytesCompletionRate : totalTransferBytesCompletionRate // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
