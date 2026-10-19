


import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/client/app_response.dart';
import '../services/authentication_service.dart';
import '../views/auth/presentation/model/model/registration_request_model.dart';
import '../views/auth/presentation/model/model/subscribe_request_model.dart';
import '../views/auth/presentation/model/model/subscription_plan_response.dart';
import 'package:dio/dio.dart' as dio;

class  AuthenticationController extends GetxController{

  final AuthenticationService authenticationService;

  Rx<bool> isFetchPlan = false.obs;
  RxBool isVerifyEmail = false.obs;
  RxBool isLoading = false.obs;
  RxBool isButtonActive = false.obs;

  AuthenticationController({
    required this.authenticationService
});

  @override
  onInit(){

    super.onInit();
    isFetchPlan.value = false;
    // fetchSubscriptionPlan();

  }

  RxList<SubscriptionPlan> subPlanList =<SubscriptionPlan>[].obs;

  Future<dynamic> registerUser(RegistrationRequest registrationRequest)async{

    try{
      isLoading.value = true;

      dio.Response result =  await authenticationService.createAccount(registrationRequest);
      // final planResponse = AppResponseHelper.fromJson(result.data);
      final appResponse = AppResponse.fromJson(result.data);
      // final appResponse = AppResponse.fromJson(result.data);
      if(appResponse.success){
        // planThriftCycle.value = planCycleResponse.data;
        isLoading.value = false;
      }else{
        isLoading.value = false;

      }
      return result.data;

    }on dio. DioError catch(e){

      if (e.response !=null){
        isLoading.value = false;
        print(e.response?.data);

        return false;
      }else{
        isLoading.value = false;
        print('DioError [${e.type}]');
        return false;

      }
    }catch(e){
      isLoading.value = false;
      print('Error: $e');
      return false;
    }
   /* try{

      if ( result is Success){
        final successResult = result as Success;
        final loginResponse = successResult.data as LoginResponseData;

        Future.wait([cacheManager.saveString(CacheKeys.accessToken, loginResponse.user.token),
          userManager.updateUser(loginResponse.user),
          thriftService.saveFcmToken(fcmToken!)
        ]);

      }

      _isLoading.value = false;

    }catch(e){
      _isLoading.value = false;

    }
    return result;*/

  }

  Future<void> fetchSubscriptionPlan() async{
    isFetchPlan.value = true;
    var reObj = await authenticationService.getSubscriptions();
    print(reObj.toJson());
    if(reObj.success){
      if(reObj.data.isNotEmpty){
        subPlanList.value = reObj.data;
      }
      isFetchPlan.value = false;
    }
    isFetchPlan.value = false;
  }

  Future<Object>verifyRegEmail(String otp) async {
    isVerifyEmail.value = true;
    var response = await authenticationService.verifyEmail(otp);
    isVerifyEmail.value = false;
    return response;
  }

  Future<dynamic> planSubscribe(SubscribeRequest subscribeRequest)async{

    try{
      isLoading.value = true;

      dio.Response result =  await authenticationService.subscribe(subscribeRequest);
      // final planResponse = AppResponseHelper.fromJson(result.data);
      final appResponse = AppResponse.fromJson(result.data);
      // final appResponse = AppResponse.fromJson(result.data);
      if(appResponse.success){
        // planThriftCycle.value = planCycleResponse.data;
        isLoading.value = false;
      }else{
        isLoading.value = false;

      }
      return result.data;

    }on dio. DioError catch(e){

      if (e.response !=null){
        isLoading.value = false;
        print(e.response?.data);

        return false;
      }else{
        isLoading.value = false;
        print('DioError [${e.type}]');
        return false;

      }
    }catch(e){
      isLoading.value = false;
      print('Error: $e');
      return false;
    }
    /* try{

      if ( result is Success){
        final successResult = result as Success;
        final loginResponse = successResult.data as LoginResponseData;

        Future.wait([cacheManager.saveString(CacheKeys.accessToken, loginResponse.user.token),
          userManager.updateUser(loginResponse.user),
          thriftService.saveFcmToken(fcmToken!)
        ]);

      }

      _isLoading.value = false;

    }catch(e){
      _isLoading.value = false;

    }
    return result;*/

  }


}