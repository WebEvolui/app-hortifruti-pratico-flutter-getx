import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  final box = GetStorage();
  final _token = ''.obs;
  String get token => _token.value;

  @override
  void onInit() {
    _token.value = box.read(StorageKey.token.toString());

    super.onInit();
  }

  Future<void> saveToken(String token) {
    return box.write(StorageKey.token.toString(), token);
  }
}

enum StorageKey {
  token
}
