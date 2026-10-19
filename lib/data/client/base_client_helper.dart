

import 'dart:io';

import 'package:data_mangr/data/client/result.dart';
import 'package:dio/dio.dart';

import 'package:flutter/foundation.dart';

import 'app_response_helper.dart';


Future<Result<T>> handleRemoteCallHelper<T>(
    Future<Response> Function() call,
   /* T Function(Map<String, dynamic>) fromJsonT,*/) async {
  try {
    Response response = await call();

    if (response.data == null) {
      return Failure('Could not retrieve response from server');
    }

    final appResponse = AppResponseHelper.fromJson(response.data );

    if (!appResponse.success) return Failure(appResponse.message);

    //update access token
    /*   if (appResponse.newAccessToken != null) {
        final cacheManager = CacheManagerImpl();
        Future.wait([
          cacheManager.updateToken(
              CacheKeys.accessToken, appResponse.newAccessToken.toString()),
        ]);
      }*/

    return Success(appResponse.data);
  } on DioError catch (e) {
    final data = e.response?.data;

    const serverError = HttpStatus.internalServerError;
    if (data == null ||
        (e.response?.statusCode ?? serverError) >= serverError) {
      return Failure('Could not retrieve response from server');
    }

    final appResponse = AppResponseHelper.fromJson(data);

    return Failure(appResponse.message);
  } catch (e) {
    if (kDebugMode) {
      print('Error handling the remote call: $e');
    }
    return Failure('An Error Occurred.');
  }
}