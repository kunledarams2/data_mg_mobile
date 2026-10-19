// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegistrationRequest _$RegistrationRequestFromJson(Map<String, dynamic> json) =>
    RegistrationRequest(
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      phone_number: json['phone_number'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      organisation_name: json['organisation_name'] as String,
      username: json['username'] as String,
      organisation_type: json['organisation_type'] as String,
      organisation_id: json['organisation_id'] as String,
    );

Map<String, dynamic> _$RegistrationRequestToJson(
        RegistrationRequest instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'email': instance.email,
      'phone_number': instance.phone_number,
      'password': instance.password,
      'username': instance.username,
      'organisation_name': instance.organisation_name,
      'organisation_type': instance.organisation_type,
      'organisation_id': instance.organisation_id,
    };
