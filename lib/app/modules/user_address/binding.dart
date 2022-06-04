import 'package:app_hortifruti_pratico/app/modules/user_address/controller.dart';
import 'package:get/get.dart';

class UserAddressBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<UserAddressController>(() => UserAddressController());
  }
}