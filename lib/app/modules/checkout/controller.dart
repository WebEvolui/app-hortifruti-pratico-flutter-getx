import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/models/order_request.dart';
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
  
  final loading = true.obs;
  num get totalCart => _cartService.total;
  num get deliveryCost {
    if (getShippingByCity != null) {
      return getShippingByCity!.cost;
    }
    
    return 0;
  }
  ShippingByCityModel? get getShippingByCity {
    if (addressSelected.value == null) {
      return null;
    }

    return _cartService.store.value!.shippingByCity.firstWhereOrNull(
      (shippingByCity) => shippingByCity.id == addressSelected.value!.city!.id
    );
  }
  num get totalOrder => totalCart + deliveryCost;
  List<PaymentMethodModel> get paymentMethods => _cartService.store.value!.paymentMethods;
  final paymentMethod = Rxn<PaymentMethodModel>();
  bool get isLogged => _authService.isLogged;
  final addresses = RxList<AddressModel>.empty();
  final addressSelected = Rxn<AddressModel>();
  bool get deliveryToMyAddress => getShippingByCity != null;
  bool get canSendOrder => isLogged && deliveryToMyAddress;

  @override
  void onInit() {
    fetchAddresses();

    super.onInit();
  }

  void changePaymentMethod(PaymentMethodModel? newPaymentMethod) {
    paymentMethod.value = newPaymentMethod;
  }

  void goToNewAddress() async {
    var result = await Get.toNamed(Routes.userAddress);

    if (result is bool && result) {
      fetchAddresses();
    }
  }

  void goToLogin() {
    Get.toNamed(Routes.login);
  }

  void fetchAddresses() {
    _repository.getUserAddresses().then((data) {
      addresses.assignAll(data);

      if (addresses.isNotEmpty) {
        addressSelected.value = addresses.first;
      }
      loading(false);
    }, onError: (error) {
      loading(false);
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

  void sendOrder() {
    if (paymentMethod.value == null) {
      ScaffoldMessenger.of(Get.overlayContext!).showSnackBar(
        SnackBar(content: Text('Escolha a forma de pagamento do seu pedido.'))
      );

      return;
    }

    var orderRequest = OrderRequestModel(
      store: _cartService.store.value!,
      paymentMethod: paymentMethod.value!,
      cartProducts: _cartService.products,
      address: addressSelected.value!,
      observation: _cartService.observation.value
    );

    _repository.postOrder(orderRequest).then((value) {
      Get.dialog(
        AlertDialog(
          title: Text('Pedido enviado!'),
          actions: [
            TextButton(
              onPressed: () {
                _cartService.finalizeCart();
                Get.offAllNamed(Routes.dashboard);
              },
              child: Text('Ver Meus Pedidos')
            )
          ],
        ),
        barrierDismissible: false,
      );
    });
  }
}