import 'package:app_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_address_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruti_pratico/app/modules/user_address/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController with StateMixin<List<CityModel>> {

  final UserAddressRepository _repository;

  UserAddressController(this._repository);

  final _authService = Get.find<AuthService>();
  var streetController = TextEditingController(text: 'Rua A');
  var numberController = TextEditingController(text: '10');
  var neighborhoodController = TextEditingController(text: 'Centro');
  var referencePointController = TextEditingController(text: 'Perto da praça');
  var complementController = TextEditingController(text: '');
  final cityId = RxnInt();

  @override
  void onInit() {
    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });

    super.onInit();
  }

  void submit() {
    var userAddressRequest = UserAddressRequestModel(
      street: streetController.text,
      number: numberController.text,
      neighborhood: neighborhoodController.text,
      referencePoint: referencePointController.text,
      cityId: cityId.value!,
      complement: complementController.text,
    );

    _repository.postAddress(userAddressRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(content: Text('Um novo endereço foi cadastrado'))
      );
    }, onError: (error) => Get.dialog(
      AlertDialog(title: Text(error.toString()))
    ));
  }

  void changeCity(int? cityIdSelected) {
    cityId.value = cityIdSelected;
  }
}