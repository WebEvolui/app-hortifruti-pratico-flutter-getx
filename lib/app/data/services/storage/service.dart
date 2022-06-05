import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final box = GetStorage();
  final _token = RxnString();
  String? get token => _token.value;
  final _cityId = RxnInt();
  int? get cityId => _cityId.value;

  @override
  void onInit() {
    _token.value = box.read(StorageKey.token.toString());
    box.listenKey(
      StorageKey.token.toString(),
      (value) => _token.value = value
    );
    _cityId.value = box.read(StorageKey.cityId.toString());
    box.listenKey(
      StorageKey.cityId.toString(),
      (value) => _cityId.value = value
    );

    super.onInit();
  }

  Future<void> saveToken(String token) {
    return box.write(StorageKey.token.toString(), token);
  }

  Future<void> removeToken() {
    return box.remove(StorageKey.token.toString());
  }

  Future<void> saveCityId(int cityId) {
    return box.write(StorageKey.cityId.toString(), cityId);
  }
}

enum StorageKey {
  token,
  cityId,
}
