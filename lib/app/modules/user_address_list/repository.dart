
import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class UserAddressListRepository {

  final Api _api;

  UserAddressListRepository(this._api);

  Future<List<AddressModel>> getUserAddresses() => _api.getUserAddresses();
}