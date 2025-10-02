// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DartItemProgressUpdate _$DartItemProgressUpdateFromJson(
  Map<String, dynamic> json,
) => _DartItemProgressUpdate(
  itemName: json['itemName'] as String,
  totalBytes: BigInt.parse(json['totalBytes'] as String),
  bytesCompleted: BigInt.parse(json['bytesCompleted'] as String),
  bytesCompletionIncrement: BigInt.parse(
    json['bytesCompletionIncrement'] as String,
  ),
);

Map<String, dynamic> _$DartItemProgressUpdateToJson(
  _DartItemProgressUpdate instance,
) => <String, dynamic>{
  'itemName': instance.itemName,
  'totalBytes': instance.totalBytes.toString(),
  'bytesCompleted': instance.bytesCompleted.toString(),
  'bytesCompletionIncrement': instance.bytesCompletionIncrement.toString(),
};

_DartTotalProgressUpdate _$DartTotalProgressUpdateFromJson(
  Map<String, dynamic> json,
) => _DartTotalProgressUpdate(
  totalBytes: BigInt.parse(json['totalBytes'] as String),
  totalBytesIncrement: BigInt.parse(json['totalBytesIncrement'] as String),
  totalBytesCompleted: BigInt.parse(json['totalBytesCompleted'] as String),
  totalBytesCompletionIncrement: BigInt.parse(
    json['totalBytesCompletionIncrement'] as String,
  ),
  totalBytesCompletionRate: (json['totalBytesCompletionRate'] as num?)
      ?.toDouble(),
  totalTransferBytes: BigInt.parse(json['totalTransferBytes'] as String),
  totalTransferBytesIncrement: BigInt.parse(
    json['totalTransferBytesIncrement'] as String,
  ),
  totalTransferBytesCompleted: BigInt.parse(
    json['totalTransferBytesCompleted'] as String,
  ),
  totalTransferBytesCompletionIncrement: BigInt.parse(
    json['totalTransferBytesCompletionIncrement'] as String,
  ),
  totalTransferBytesCompletionRate:
      (json['totalTransferBytesCompletionRate'] as num?)?.toDouble(),
);

Map<String, dynamic> _$DartTotalProgressUpdateToJson(
  _DartTotalProgressUpdate instance,
) => <String, dynamic>{
  'totalBytes': instance.totalBytes.toString(),
  'totalBytesIncrement': instance.totalBytesIncrement.toString(),
  'totalBytesCompleted': instance.totalBytesCompleted.toString(),
  'totalBytesCompletionIncrement': instance.totalBytesCompletionIncrement
      .toString(),
  'totalBytesCompletionRate': instance.totalBytesCompletionRate,
  'totalTransferBytes': instance.totalTransferBytes.toString(),
  'totalTransferBytesIncrement': instance.totalTransferBytesIncrement
      .toString(),
  'totalTransferBytesCompleted': instance.totalTransferBytesCompleted
      .toString(),
  'totalTransferBytesCompletionIncrement': instance
      .totalTransferBytesCompletionIncrement
      .toString(),
  'totalTransferBytesCompletionRate': instance.totalTransferBytesCompletionRate,
};
