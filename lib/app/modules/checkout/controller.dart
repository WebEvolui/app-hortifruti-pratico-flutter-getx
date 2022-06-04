import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/models/payment_method.dart';
import 'package:app_hortifruti_pratico/app/data/models/shipping_by_city.dart';
import 'package:app_hortifruti_pratico/app/data/services/auth/service.dart';
import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:app_hortifruti_pratico/app/modules/checkout/repository.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {

  final CheckoutRepository _repository;
  final _cartService = Get.find<CartService>();
  final _authService = Get.find<AuthService>();
  
  CheckoutController(this._repository);

  num get totalCart => _cartService.total;
  num get deliveryCost {
    if (getShippingByCity != null) {
      return getShippingByCity!.cost;
    }
    
    return 0;
  }
  ShippingByCityModel? get getShippingByCity {
    var cityId = 1;
    return _cartService.store.value!.shippingByCity.firstWhereOrNull(
      (shippingByCity) => shippingByCity.id == cityId
    );
  }
  num get totalOrder => totalCart + deliveryCost;
  List<PaymentMethodModel> get paymentMethods => _cartService.store.value!.paymentMethods;
  final paymentMethod = Rxn<PaymentMethodModel>();
  bool get isLogged => _authService.isLogged;
  final addresses = RxList<AddressModel>.empty();
  final addressSelected = Rxn<AddressModel>();

  @override
  void onInit() {
    fetchAddresses();

    super.onInit();
  }

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  void goToNewAddress() {
    Get.toNamed(Routes.userAddress);
  }

  void goToLogin() {
    Get.toNamed(Routes.login);
  }

  fetchAddresses() {
    _repository.getUserAddresses().then((value) {
      addresses.addAll(value);

      if (addresses.isNotEmpty) {
        addressSelected.value = addresses.first;
      }
    });
  }

  void showAddressList() {
    Get.dialog(
      SimpleDialog(
        title: Text('Selecione um endereço'),
        children: [
          for (var address in addresses)
            SimpleDialogOption(
              child: Text('${address.street}, n° ${address.number}, ${address.neighborhood}'),
              onPressed: () {
                addressSelected.value = address;
                Get.back();
              },
            ),
          TextButton(
            onPressed: () {
              Get.back();
              goToNewAddress();
            },
            child: const Text('Cadastrar um endereço')
          )
        ],
      )
    );
  }
}