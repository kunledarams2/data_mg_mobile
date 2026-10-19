
import 'package:json_annotation/json_annotation.dart';
part 'registration_request_model.g.dart';

@JsonSerializable()
class RegistrationRequest {
  final String first_name;
  final String last_name;
  final String email;
  final String phone_number;
  final String password;
  final String username;
  final String  organisation_name;
  final String  organisation_type;
  final String  organisation_id;

  RegistrationRequest({
    required this.first_name,
    required this.last_name,
    required this.phone_number,
    required this.email,
    required this.password,
    required this.organisation_name,
  required this.username,
  required this.organisation_type,
  required this.organisation_id});

  Map<String, dynamic> toJson() => _$RegistrationRequestToJson(this);

  factory RegistrationRequest.fromJson(Map<String, dynamic> json) =>
      _$RegistrationRequestFromJson(json);
}