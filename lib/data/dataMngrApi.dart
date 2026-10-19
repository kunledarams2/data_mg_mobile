
class Endpoints {
  Endpoints._();

  // base url
  static const coreAPiRender = "https://thriftpay.onrender.com";
  static const localAPI = "http://127.0.0.1:8000";
  static const herokuAPI = "https://thriftpay-46025c1ffdc3.herokuapp.com";
  static const apiVersion = 'v1';
  static const String baseUrl ="$localAPI/api/$apiVersion" /*"https://thriftpay-46025c1ffdc3.herokuapp.com/api"*/; // 6525-102-89-22-155.ngrok-free.app https://c1d7-102-89-46-50.eu.ngrok.io https://b68e-102-89-33-19.eu.ngrok.io  http://127.0.0.1:8000

  // receiveTimeout
  static const int receiveTimeout = 30000;

  // connectTimeout
  static const int connectionTimeout = 30000;
  static const String login = '$baseUrl/auth/login';
  static const String userAuthDetail = '$baseUrl/auth/user';
  static const String createAccount = '$baseUrl/auth/register';
  static const String createTransactionPin = '$baseUrl/auth/transaction/pin';
  static const String emailOtpVerification = '$baseUrl/auth/verify/email';
  static const String resetEmailOtp ='$baseUrl/auth/verify/email/reset';
  static const String resetForgotPasswordOtp ='$baseUrl/auth/forgot/password/reset';

  static const String getAvailableSubs ='$baseUrl/auth/subscription';
  static const String subscribePlan = '$baseUrl/auth/subscribe/plan';

  static const String entries = '$baseUrl/entries';
  static const String theme = '$baseUrl/theme';

}