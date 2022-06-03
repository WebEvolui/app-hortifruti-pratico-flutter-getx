import 'package:app_hortifruti_pratico/app/data/models/user_login_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final _authService = Get.find<AuthService>();
  var emailController = TextEditingController(text: 'teste@email.com');
  var passwordController = TextEditingController(text: 'senha123');

  void login() {
    var userLoginRequestModel = UserLoginRequestModel(
      email: emailController.text,
      password: passwordController.text,
    );

    _authService
      .login(userLoginRequestModel)
      .then((value) => null);
  }
}