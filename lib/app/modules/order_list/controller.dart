import 'package:app_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_hortifruti_pratico/app/modules/order_list/repository.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController with StateMixin<List<OrderModel>> {

  final OrderListRepository _repository;
  OrderListController(this._repository);

  @override
  void onInit() {
    _repository.getOrders().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}