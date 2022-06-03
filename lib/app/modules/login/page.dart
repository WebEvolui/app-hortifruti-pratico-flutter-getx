import 'package:app_hortifruti_pratico/app/modules/login/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('LoginPage')),
      body: Text('LoginPage')
    );
  }
}