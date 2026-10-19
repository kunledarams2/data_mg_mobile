import 'package:data_mangr/data/client/result.dart';

import '../model/registration_request_model.dart';

abstract class AuthRepository{
  Future<Object> register(RegistrationRequest registrationRequest);
}