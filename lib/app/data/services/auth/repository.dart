
import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class AuthRepository {

  final Api _api;

  AuthRepository(this._api);

  Future login(UserLoginRequestModel userLoginRequest) => _api.login(userLoginRequest);
}