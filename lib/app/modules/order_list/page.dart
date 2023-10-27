import 'package:app_hortifruti_pratico/app/modules/order_list/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderListPage extends GetView<OrderListController> {
  const OrderListPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meus Pedidos')),
      body: controller.obx(
        (state) => ListView(
          children: [
            for (var order in state!)
              ListTile(
                title: Text('#${order.hashId}'),
                subtitle: Text(order.store.name),
                trailing: Chip(label: Text(order.statusList.last.name)),
                onTap: () => Get.toNamed(Routes.order.replaceFirst(':id', order.hashId)),
              )
          ],
        ),
        onEmpty: const Center(
          child: Text(
            'Você não fez nenhum pedido ainda.',
            textAlign: TextAlign.center,
          ),
        ),
        onError: (error) => Center(
          child: ElevatedButton(
            onPressed: () => Get.toNamed(Routes.login),
            child: const Text('Entre com a sua conta para ver os pedidos'),
          )
        )
      )
    );
  }
}