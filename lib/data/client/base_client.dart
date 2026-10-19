import 'dart:io';

import 'package:data_mangr/data/client/extensions.dart';
import 'package:data_mangr/data/client/result.dart';
import 'package:data_mangr/data/client/token_interceptor.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';



import 'package:flutter/foundation.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import 'app_response.dart';




abstract class BaseService {
  late Dio dio;
  TokenInterceptor? tokenInterceptor;

  BaseService({Dio? dio, TokenInterceptor? tokenInterceptor}) {
    this.dio = dio ?? _configureDioForNonTest();
  }

  Dio _configureDioForNonTest() {
    int timeout = const Duration(seconds: 50).inMilliseconds;

    final options = BaseOptions(
        connectTimeout: timeout,
        receiveTimeout: timeout,
        responseType: ResponseType.json,
        contentType: 'application/json',
      headers: {
        'Accept': 'application/json'
      },
         );

    // add interceptors
    final dio = Dio(options);

    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    (HttpClient client){
      client.badCertificateCallback=
      (X509Certificate cert, String host, int port ) => true;
      return client;
    };

    tokenInterceptor?.let((element) => dio.interceptors.add(element));

    return dio;
  }

  Future<Result<T>> handleRemoteCall<T>(
      Future<Response> Function() call) async {
    try {
      Response response = await call();

      if (response.data == null) {
        return Failure('Could not retrieve response from server');
      }

      final appResponse = AppResponse.fromJson(response.data);

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

      final appResponse = AppResponse.fromJson(data);

      return Failure(appResponse.message);
    } catch (e) {
      if (kDebugMode) {
        print('Error handling the remote call: $e');
      }
      return Failure('An Error Occurred.');
    }
  }
}
