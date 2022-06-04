
import 'package:app_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_hortifruti_pratico/app/data/models/user_address_request.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class UserAddressRepository {

  final Api _api;

  UserAddressRepository(this._api);

  Future<List<CityModel>> getCities() => _api.getCities();
  
  Future<void> postAddress(UserAddressRequestModel userAddressRequest) => _api.postAddress(userAddressRequest);
}