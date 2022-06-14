import 'package:app_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_hortifruti_pratico/app/data/models/user.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_profile_request.dart';
// import 'package:app_hortifruti_pratico/app/data/models/user_profile_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruti_pratico/app/modules/user_profile/repository.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController with StateMixin<UserModel> {

  final UserProfileRepository _repository;

  UserProfileController(this._repository);

  final formKey = GlobalKey<FormState>();
  final _authService = Get.find<AuthService>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void onInit() {
    ever(_authService.user, (_) => fetchUser());

    fetchUser();

    super.onInit();
  }

  void fetchUser() {
    _repository.getUser().then((data) {
      nameController.text = data.name;
      emailController.text = data.email;
      phoneController.text = data.phone;
    
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });
  }

  void logout() async {
    await _authService.logout();

    Get.offAllNamed(Routes.dashboard);
  }

  void submit() {
    Get.focusScope!.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    var userProfileRequest = UserProfileRequestModel(
      name: nameController.text,
      email: emailController.text,
      phone: phoneController.text,
      password: passwordController.text,
    );

    _repository.putUser(userProfileRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(content: Text('Seu perfil foi atualizado'))
      );

      passwordController.text = '';
    }, onError: (error) {
      Get.dialog(AlertDialog(title: Text(error.toString())));
    });
  }
}