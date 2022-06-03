import 'package:app_hortifruti_pratico/app/data/services/cart/service.dart';
import 'package:app_hortifruti_pratico/app/modules/checkout/repository.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {

  final CheckoutRepository _repository;
  final _cartService = Get.find<CartService>();
  
  CheckoutController(this._repository);

  num get totalCart => _cartService.total;
  num get deliveryCost => 0;
  num get totalOrder => totalCart + deliveryCost;
}