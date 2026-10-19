import 'package:json_annotation/json_annotation.dart';

// import 'model_converter.dart';
//
// part 'app_response.g.dart';

// @JsonSerializable(explicitToJson: true)
class AppResponseHelper<T> {
  final String message;
  final bool success;
  final String? error;
  final int? statusCode;

  final T? data;

  const AppResponseHelper({
    required this.message,
    required this.success,
    required this.statusCode,
    required this.error,
    this.data,
  });

  factory AppResponseHelper.fromJson(Map<String, dynamic> json) {
    return AppResponseHelper<T>(
      message: json['message'] as String,
      success: json['success'] as bool,
      statusCode: json['statusCode'] as int?,
      error: json['error'] as String?,
      data: json['data'],
    );
  }

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'message': message,
      'success': success,
      'statusCode': statusCode,
      'error': error,
      'data': toJsonT(data!),
    };
  }
}
