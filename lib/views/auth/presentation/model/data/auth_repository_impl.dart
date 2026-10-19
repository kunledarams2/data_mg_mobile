
import 'package:data_mangr/views/auth/presentation/model/model/registration_request_model.dart';
import 'package:data_mangr/views/auth/presentation/model/data/auth_datasource.dart';
import 'package:data_mangr/views/auth/presentation/model/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  AuthRepositoryImpl({required this.authDatasource});
  final AuthDatasource authDatasource;

  @override
  Future<Object> register(RegistrationRequest registrationRequest) async {
    return authDatasource.createAccount(registrationRequest);
  }

}