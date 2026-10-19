import 'package:dio/dio.dart';

import '../../core/local/cache_manager.dart';






class TokenInterceptor extends Interceptor {
  final CacheManager cacheManager;
  TokenInterceptor({required this.cacheManager});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // retrieve access token from the cache, and update request header with access token
    final accessToken  = cacheManager.getString(CacheKeys.accessToken);
    options.headers['Authorization'] = 'Bearer $accessToken';
    super.onRequest(options, handler);
  }
}