import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/repository.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  
  AuthRepository _repository;

  AuthService(this._repository);

  Future<void> login(UserLoginRequestModel userLoginRequest) async {
    var userLoginResponse = await _repository.login(userLoginRequest);

    print(userLoginResponse.token);
  }
}