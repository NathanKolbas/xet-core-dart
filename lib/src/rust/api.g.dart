// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DartXetDownloadInfo _$DartXetDownloadInfoFromJson(Map<String, dynamic> json) =>
    _DartXetDownloadInfo(
      destinationPath: json['destinationPath'] as String,
      hash: json['hash'] as String,
      fileSize: BigInt.parse(json['fileSize'] as String),
    );

Map<String, dynamic> _$DartXetDownloadInfoToJson(
  _DartXetDownloadInfo instance,
) => <String, dynamic>{
  'destinationPath': instance.destinationPath,
  'hash': instance.hash,
  'fileSize': instance.fileSize.toString(),
};

_DartXetUploadInfo _$DartXetUploadInfoFromJson(Map<String, dynamic> json) =>
    _DartXetUploadInfo(
      hash: json['hash'] as String,
      fileSize: BigInt.parse(json['fileSize'] as String),
    );

Map<String, dynamic> _$DartXetUploadInfoToJson(_DartXetUploadInfo instance) =>
    <String, dynamic>{
      'hash': instance.hash,
      'fileSize': instance.fileSize.toString(),
    };
