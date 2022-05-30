import 'package:app_hortifruti_pratico/app/data/provider/api.dart';
import 'package:app_hortifruti_pratico/app/modules/store/controller.dart';
import 'package:app_hortifruti_pratico/app/modules/store/repository.dart';
import 'package:get/get.dart';

class StoreBinding implements Bindings {

  @override
  void dependencies() {
    Get.lazyPut<StoreController>(
      () => StoreController(StoreRepository(Get.find<Api>()))
    );
  }
}