// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_plan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionResponse _$SubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionResponse(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => SubscriptionPlan.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String,
    );

Map<String, dynamic> _$SubscriptionResponseToJson(
        SubscriptionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
      'message': instance.message,
    };

SubscriptionPlan _$SubscriptionPlanFromJson(Map<String, dynamic> json) =>
    SubscriptionPlan(
      id: json['id'] as int,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      name: json['name'] as String,
      entries: json['entries'] as int,
      team_member: json['team_member'] as int,
      messages: json['messages'] as int,
      themes: json['themes'] as int,
      can_export: json['can_export'] as bool,
      can_view_analysis: json['can_view_analysis'] as bool,
      price: json['price'] as int,
    );

Map<String, dynamic> _$SubscriptionPlanToJson(SubscriptionPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'name': instance.name,
      'entries': instance.entries,
      'team_member': instance.team_member,
      'messages': instance.messages,
      'themes': instance.themes,
      'can_export': instance.can_export,
      'can_view_analysis': instance.can_view_analysis,
      'price': instance.price,
    };
