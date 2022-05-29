import 'package:app_hortifruti_pratico/app/modules/home/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}