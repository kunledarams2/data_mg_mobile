



import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/authentication_controller.dart';
import '../controller/tab_host_controller.dart';
import '../data/client/token_interceptor.dart';
import '../services/authentication_service.dart';
import 'local/cache_manager.dart';

class CoreBinding implements Bindings {
  @override
  void dependencies() async {
    // initialize bindings that are shared throughout the application

    Get.lazyPut<CacheManager>(() => CacheManagerImpl());
    Get.lazyPut(() => TokenInterceptor(cacheManager: Get.find<CacheManager>()));
    Get.lazyPut(() => AuthenticationService(interceptor: Get.find<TokenInterceptor>()));

    // Get.lazyPut(() => DashBoardService(interceptor: Get.find<TokenInterceptor>()));
    Get.lazyPut(() => AuthenticationController(
      authenticationService: Get.find<AuthenticationService>(),
    /*  cacheManager:  Get.find<CacheManager>(), userManager: Get.find<UserManager>(),*/
    ));
    // Get.lazyPut(() => DashBoardController(
    // dashBoardService: Get.find<DashBoardService>(),
    // ));
    Get.lazyPut(() => TabHostController());

 /*   Get.lazyPut<UserManager>(
            () => UserManagerImpl(cacheManager: Get.find<CacheManager>()));

  *//*  Get.lazyPut(() => BiometricAuthController(localAuth: LocalAuthentication(),
      secureStorage: FlutterSecureStorage(), ));*//*

    Get.put(BiometricAuthController(localAuth: LocalAuthentication(),
      secureStorage: FlutterSecureStorage(),),permanent: true);*/




  }
}
