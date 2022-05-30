import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:app_hortifruti_pratico/app/modules/home/repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<StoreModel>> {
  HomeRepository _repository;

  HomeController(this._repository);

  @override
  void onInit() {
    _repository.getStores().then((data) {
      change(data, status: RxStatus.success());
    }, onError: (error) {
      change(null, status: RxStatus.error(error.toString()));
    });

    super.onInit();
  }
}