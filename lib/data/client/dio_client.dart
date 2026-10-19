

import 'package:dio/dio.dart';

import '../dataMngrApi.dart';

class DioClient{

  final Dio _dio;

  DioClient(this._dio){
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout;


  }


}