
import 'package:app_hortifruti_pratico/app/data/models/city.dart';
import 'package:app_hortifruti_pratico/app/data/provider/api.dart';

class UserAddressRepository {

  final Api _api;

  UserAddressRepository(this._api);

  Future<List<CityModel>> getCities() => _api.getCities();
}