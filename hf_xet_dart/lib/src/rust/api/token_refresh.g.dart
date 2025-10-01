// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_refresh.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DartTokenInfo _$DartTokenInfoFromJson(Map<String, dynamic> json) =>
    _DartTokenInfo(
      token: json['token'] as String,
      expiration: BigInt.parse(json['expiration'] as String),
    );

Map<String, dynamic> _$DartTokenInfoToJson(_DartTokenInfo instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expiration': instance.expiration.toString(),
    };
