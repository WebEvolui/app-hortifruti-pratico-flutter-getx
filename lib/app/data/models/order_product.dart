import 'package:app_hortifruti_pratico/app/data/models/product.dart';

class OrderProductModel {

  ProductModel product;
  num quantity;
  num value;
  String? observation;

  OrderProductModel({
    required this.product,
    required this.quantity,
    required this.value,
    this.observation,
  });

  num get total => value * quantity;

  factory OrderProductModel.fromJson(Map<String, dynamic> json) => OrderProductModel(
    product: ProductModel.fromJson(json['produto']),
    quantity: json['quantidade'],
    value: json['valor'],
    observation: json['observacao'],
  );
}