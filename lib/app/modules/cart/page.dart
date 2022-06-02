import 'package:app_hortifruti_pratico/app/modules/cart/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartPage extends GetView<CartController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CartPage')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var cartProduct in controller.products)
              ListTile(
                title: Text(cartProduct.product.name),
                subtitle: Text('${NumberFormat.simpleCurrency().format(cartProduct.total)} (${NumberFormat.simpleCurrency().format(cartProduct.product.price)})'),
              )
          ],
        ),
      )
    );
  }
}