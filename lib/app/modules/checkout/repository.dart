import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/models/order_request.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class CheckoutRepository {

  final Api _api;

  CheckoutRepository(this._api);

  Future<List<AddressModel>> getUserAddresses() => _api.getUserAddresses();

  Future postOrder(OrderRequestModel orderRequest) => _api.postOrder(orderRequest);
}