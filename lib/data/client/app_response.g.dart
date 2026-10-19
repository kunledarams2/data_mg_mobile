// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponse<T> _$AppResponseFromJson<T>(Map<String, dynamic> json) =>
    AppResponse<T>(
      message: json['message'] as String,
      success: json['success'] as bool,
      statusCode: json['statusCode'] as int?,
      error: json['error'] as String?,
      data: ModelConverter<T?>().fromJson(json['data']),
    );

Map<String, dynamic> _$AppResponseToJson<T>(AppResponse<T> instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
      'error': instance.error,
      'statusCode': instance.statusCode,
      'data': _$JsonConverterToJson<Object?, T>(
          instance.data, ModelConverter<T?>().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
