import 'package:app_hortifruti_pratico/app/modules/login/controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}