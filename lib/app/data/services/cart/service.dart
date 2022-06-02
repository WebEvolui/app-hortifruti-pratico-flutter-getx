import 'package:app_hortifruti_pratico/app/data/models/cart_product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';

class CartService extends GetxService {
  List<CartProductModel> products = RxList<CartProductModel>.empty();

  final store = Rxn<StoreModel>();

  void addProductToCart(CartProductModel cartProduct) {
    products.add(cartProduct);
  }

  void newCart(StoreModel newStore) {
    store.value = newStore;
    products.clear();
  }
}