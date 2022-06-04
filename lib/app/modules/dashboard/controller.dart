import 'package:get/get.dart';

class DashboardController extends GetxController {

  var currentPageIndex = 0.obs;

  @override
  void onInit() {
    int? index = Get.arguments;

    if (index != null) {
      currentPageIndex.value = index;
    }

    super.onInit();
  }

  void changePageIndex(int index) {
    currentPageIndex.value = index;
  }
}