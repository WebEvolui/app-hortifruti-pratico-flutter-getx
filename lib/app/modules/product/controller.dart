import 'package:app_hortifruti_pratico/app/data/models/product.dart';
import 'package:app_hortifruti_pratico/app/data/models/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {

  final product = Rxn<ProductModel>();
  final store = Rxn<StoreModel>();
  final observationController = TextEditingController();

  @override
  void onInit() {
    product.value = Get.arguments['product'];
    store.value = Get.arguments['store'];

    super.onInit();
  }

  void addToCart() {
    observationController.text;
  }
}