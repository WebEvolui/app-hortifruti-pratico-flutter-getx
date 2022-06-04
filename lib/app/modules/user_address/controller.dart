import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController {

  final _authService = Get.find<AuthService>();
  var streetController = TextEditingController(text: 'Rua A');
  var numberController = TextEditingController(text: '10');
  var neighborhoodController = TextEditingController(text: 'Centro');
  var referencePointController = TextEditingController(text: 'Perto da praça');
  var complementController = TextEditingController(text: '');

  void submit() {

  }
}