
import 'package:app_hortifruti_pratico/app/data/models/order.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class OrderListRepository {

  final Api _api;

  OrderListRepository(this._api);

  Future<List<OrderModel>> getOrders() => _api.getOrders();
}