
import 'package:app_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_hortifruti_pratico/app/data/models/user.dart';
// import 'package:app_hortifruti_pratico/app/data/models/user_profile_request.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class UserProfileRepository {

  final Api _api;

  UserProfileRepository(this._api);

  Future<UserModel> getUser() => _api.getUser();
}