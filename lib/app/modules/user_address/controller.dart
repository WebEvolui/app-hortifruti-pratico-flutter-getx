import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_address_request.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruti_pratico/app/modules/user_address/repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressController extends GetxController with StateMixin<List<CityModel>> {

  final UserAddressRepository _repository;

  UserAddressController(this._repository);

  final formKey = GlobalKey<FormState>();
  final _authService = Get.find<AuthService>();
  var streetController = TextEditingController(text: 'Rua A');
  var numberController = TextEditingController(text: '10');
  var neighborhoodController = TextEditingController(text: 'Centro');
  var referencePointController = TextEditingController(text: 'Perto da praça');
  var complementController = TextEditingController(text: '');
  final cityId = RxnInt();
  final _address = Rxn<AddressModel>();
  final editing = RxBool(false);

  @override
  void onInit() {
    if (Get.arguments != null) {
      editing(true);
      _address.value = Get.arguments;

      streetController.text = _address.value!.street;
      numberController.text = _address.value!.number;
      neighborhoodController.text = _address.value!.neighborhood;
      referencePointController.text = _address.value!.referencePoint;
      complementController.text = _address.value!.complement ?? '';
      cityId.value = _address.value!.city!.id;
    }

    _repository.getCities().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error));
    });

    super.onInit();
  }

  void submit() {
    Get.focusScope!.unfocus();

    if (!formKey.currentState!.validate()) {
      return;
    }

    var userAddressRequest = UserAddressRequestModel(
      id: editing.isTrue ? _address.value!.id : null,
      street: streetController.text,
      number: numberController.text,
      neighborhood: neighborhoodController.text,
      referencePoint: referencePointController.text,
      cityId: cityId.value!,
      complement: complementController.text,
    );

    if (editing.isTrue) {
      return _updateAddress(userAddressRequest);
    }

    _addAddress(userAddressRequest);
  }

  void _updateAddress(UserAddressRequestModel userAddressRequest) {
    _repository.putAddress(userAddressRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(content: Text('Seu endereço foi atualizado'))
      );

      Get.back(result: true);
    }, onError: (error) => Get.dialog(
      AlertDialog(title: Text(error.toString()))
    ));
  }

  void _addAddress(UserAddressRequestModel userAddressRequest) {
    _repository.postAddress(userAddressRequest).then((value) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        const SnackBar(content: Text('Um novo endereço foi cadastrado'))
      );

      Get.back(result: true);
    }, onError: (error) => Get.dialog(
      AlertDialog(title: Text(error.toString()))
    ));
  }

  void changeCity(int? cityIdSelected) {
    cityId.value = cityIdSelected;
  }
}