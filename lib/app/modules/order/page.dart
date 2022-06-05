import 'package:app_hortifruti_pratico/app/modules/order/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends GetView<OrderController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalhes do pedido')),
      body: controller.obx(
        (state) => ListView(
          children: [
            
          ],
        )
      )
    );
  }
}