


import '../data/client/base_client.dart';
import '../data/client/result.dart';
import '../data/client/token_interceptor.dart';
import '../data/dataMngrApi.dart';
import '../views/auth/presentation/model/model/registration_request_model.dart';
import '../views/auth/presentation/model/model/subscribe_request_model.dart';
import '../views/auth/presentation/model/model/subscription_plan_response.dart';

class  AuthenticationService extends BaseService{

  final TokenInterceptor interceptor;

  AuthenticationService({required this.interceptor});

  Future<SubscriptionResponse> getSubscriptions() async {

    dio.interceptors.add(interceptor);
    var response = await dio.get(Endpoints.getAvailableSubs);
    var responseData = SubscriptionResponse.fromJson(response.data);
    return responseData;

  }

  Future  createAccount(RegistrationRequest registrationRequest) async{
    var response = await dio.post( Endpoints.createAccount, data: registrationRequest.toJson());
    return response;
  }

  Future<Object>verifyEmail (String otp ) async{
    var requestBody = <String, String>{
      'otp':otp ,
    };
    dio.interceptors.add(interceptor);
    var response = await dio.post( Endpoints.emailOtpVerification, data: requestBody);
    return response;
  }

  Future  subscribe(SubscribeRequest subscribeRequest) async{
    var response = await dio.post( Endpoints.subscribePlan, data: subscribeRequest.toJson());
    return response;
  }



/* final DioClient dioClient;

  AuthenticationService({required this.dioClient});*/

/*  Future<Result<LoginResponseData>> loginService(String email, String password) async{
    var requestBody = LoginRequest(email: email, password: password);
    // var rsp = await dioClient.
    *//*var response = await dio.post( Endpoints.login,data: requestBody.toJson());
    var loginResponse = LoginResponse.fromJson(response.data);
    print(loginResponse);*//*
    return handleRemoteCall(() => dio.post( Endpoints.login,data: requestBody.toJson()));
  }

  Future<LoginResponse> userAuthDetails() async{
    // var requestBody = LoginRequest(email: email, password: password);
    // var rsp = await dioClient.
    dio.interceptors.add(interceptor);
    var response = await dio.get( Endpoints.userAuthDetail);
    var loginResponse = LoginResponse.fromJson(response.data);
    print(loginResponse);
    return loginResponse;
  }



  }*/


}