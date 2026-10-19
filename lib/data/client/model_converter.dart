

import 'package:data_mangr/data/client/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:json_annotation/json_annotation.dart';



class ModelConverter<T> implements JsonConverter<T, Object?> {
  const ModelConverter();

  @override
  T fromJson(Object? json) {
    // handle `null` cases
    if (json == null) {
      return Object as T;
    }

    final paginationData = ['page', 'limit', 'total'];

    final feedData = ['total', 'from', 'limit'];

    final messageData = ['total', 'limit', 'from'];

    if (json is Map<String, dynamic>) {
      // move from most specific (i.e fields with the most keys) to least specific
     /* if (_hasAllJsonKeys(json, [ 'user'])) {
        return LoginResponseData.fromJson(json) as T;
      }

      if (_hasAllJsonKeys(json, [ 'account_number'])) {
        return AccountResolveData.fromJson(json) as T;
      }

      if (_hasAllJsonKeys(json, [ 'first_name'])) {
        return RegistrationResponseDatum.fromJson(json) as T;
      }

      if (_hasAllJsonKeys(json, [ 'start_date'])) {
        return ThriftPlanDatum.fromJson(json) as T;
      }*/


    }
    // return object for no matching class types
    return Object as T;
  }

  bool _hasAllJsonKeys(Map<String, dynamic> json, List<String> keys) {
    return keys.all((String key) => json.containsKey(key));
  }


  @override
  Object toJson(T object) {
    throw UnimplementedError();
  }
}