import 'package:json_annotation/json_annotation.dart';

part 'subscription_plan_response.g.dart';

@JsonSerializable()
class SubscriptionResponse{
  final bool success;
  final List<SubscriptionPlan> data;
  final String message;


  SubscriptionResponse({
    required this.success,
    required this.data,
    required this.message
  });

  Map<String, dynamic> toJson() => _$SubscriptionResponseToJson(this);

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);
}



@JsonSerializable()
class SubscriptionPlan{


  final int id;
  final String created_at;
  final String updated_at;
  final String name;
  final int entries;
  final int team_member;
  final int messages;
  final int themes;
  final bool can_export;
  final bool can_view_analysis;
  final int price;

  SubscriptionPlan({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.name,
    required this.entries,
    required this.team_member,
    required this.messages,
    required this.themes,
    required this.can_export,
    required this.can_view_analysis,
    required this.price,
  });



  Map<String, dynamic> toJson() => _$SubscriptionPlanToJson(this);

  factory SubscriptionPlan.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionPlanFromJson(json);
}