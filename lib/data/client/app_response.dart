import 'package:json_annotation/json_annotation.dart';

import 'model_converter.dart';

part 'app_response.g.dart';

@JsonSerializable(explicitToJson: true)
class AppResponse<T> {
  final String message;
  final bool success;
  final String? error;
  final int? statusCode;
  // final String? newAccessToken;

  @ModelConverter()
  final T? data;

  const AppResponse(
      {required this.message,
        required this.success,
        required this.statusCode,
        required this.error,
        // required this.newAccessToken,
        this.data});

  factory AppResponse.fromJson(Map<String, dynamic> json) =>
      _$AppResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppResponseToJson(this);
}