

import 'package:json_annotation/json_annotation.dart';
part 'subscribe_request_model.g.dart';

@JsonSerializable()
class SubscribeRequest {
  final String amount;
  final String email;
  final String plan_id;
  final String payment_reference;
  final String user_id;


  SubscribeRequest({
    required this.amount,
    required this.email,
    required this.plan_id,
    required this.payment_reference,
    required this.user_id

  });

  Map<String, dynamic> toJson() => _$SubscribeRequestToJson(this);

  factory SubscribeRequest.fromJson(Map<String, dynamic> json) =>
      _$SubscribeRequestFromJson(json);
}