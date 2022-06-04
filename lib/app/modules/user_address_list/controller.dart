import 'package:app_hortifruti_pratico/app/data/models/address.dart';
import 'package:app_hortifruti_pratico/app/modules/user_address_list/repository.dart';
import 'package:get/get.dart';

class UserAddressListController extends GetxController with StateMixin<List<AddressModel>> {

  final UserAddressListRepository _repository;
  UserAddressListController(this._repository);

  @override
  void onInit() {
    _repository.getUserAddresses().then((data) {
      change(data, status: RxStatus.success());
    });
    
    super.onInit();
  }
}