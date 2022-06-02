import 'package:app_hortifruti_pratico/app/data/models/product.dart';

class CartProductModel {

  ProductModel product;
  num quantity;
  String? observation;

  CartProductModel({
    required this.product,
    required this.quantity,
    this.observation,
  });

  num get total => product.price * quantity;
}