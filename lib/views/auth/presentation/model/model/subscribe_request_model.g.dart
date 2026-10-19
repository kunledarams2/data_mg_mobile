// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribe_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribeRequest _$SubscribeRequestFromJson(Map<String, dynamic> json) =>
    SubscribeRequest(
      amount: json['amount'] as String,
      email: json['email'] as String,
      plan_id: json['plan_id'] as String,
      payment_reference: json['payment_reference'] as String,
      user_id: json['user_id'] as String,
    );

Map<String, dynamic> _$SubscribeRequestToJson(SubscribeRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'email': instance.email,
      'plan_id': instance.plan_id,
      'payment_reference': instance.payment_reference,
      'user_id': instance.user_id,
    };
