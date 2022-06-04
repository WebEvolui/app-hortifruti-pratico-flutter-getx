import 'package:app_hortifruti_pratico/app/data/models/city.dart';
// import 'package:app_hortifruti_pratico/app/data/models/user_profile_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruti_pratico/app/modules/user_profile/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController with StateMixin<List<CityModel>> {

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
    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });

    super.onInit();
  }

  void logout() {
    
  }

  void submit() {
    Get.focusScope!.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    // var userAddressRequest = UserProfileRequestModel(
    //   street: streetController.text,
    //   number: numberController.text,
    //   neighborhood: neighborhoodController.text,
    //   referencePoint: referencePointController.text,
    //   cityId: cityId.value!,
    //   complement: complementController.text,
    // );

    // _repository.postAddress(userAddressRequest).then((value) {
    //   ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
    //     const SnackBar(content: Text('Um novo endereço foi cadastrado'))
    //   );

    //   Get.back(result: true);
    // }, onError: (error) => Get.dialog(
    //   AlertDialog(title: Text(error.toString()))
    // ));
  }
}