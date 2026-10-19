
import '../../../../../data/client/base_client.dart';
import '../../../../../data/client/token_interceptor.dart';
import '../../../../../data/dataMngrApi.dart';
import '../model/registration_request_model.dart';

class AuthEndpoint{

}

class AuthDatasource extends BaseService {


  AuthDatasource({required this.interceptor});
  final TokenInterceptor interceptor;

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

}