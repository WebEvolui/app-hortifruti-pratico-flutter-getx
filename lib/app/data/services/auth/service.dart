import 'package:app_hortifruti_pratico/app/data/models/user.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/repository.dart';
import 'package:app_hortifruti_pratico/app/data/services/storage/service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  final _storageService = Get.find<StorageService>();
  AuthRepository _repository;
  final user = Rxn<UserModel>();
  bool get isLogged => user.value != null;

  AuthService(this._repository);

  @override
  void onInit() async {
    await _getUser();

    super.onInit();
  }

  Future<void> login(UserLoginRequestModel userLoginRequest) async {
    var userLoginResponse = await _repository.login(userLoginRequest);
    await _storageService.saveToken(userLoginResponse.token);
    await _getUser();

    print(userLoginResponse.token);
  }

  Future _getUser() {
    return _repository.getUser()
      .then((value) {
        user.value = value;
      });
  }
}