import 'package:app_hortifruti_pratico/app/modules/checkout/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends GetView<CheckoutController> {
  const CheckoutPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Obx(() {
        if (controller.loading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Endereço',
                  style: Get.textTheme.titleLarge,
                ),
              ),
              if (controller.isLogged) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      if (controller.addresses.isNotEmpty) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                              Expanded(child: _buildAddress()),
                              TextButton(
                                onPressed: controller.showAddressList,
                                child: const Text('Alterar')
                              )
                          ],
                        ),
                        if (!controller.deliveryToMyAddress)
                          Text(
                            'O endereço selecionado não é atendido',
                            textAlign: TextAlign.center,
                            style: Get.textTheme.bodyLarge!.copyWith(color: Colors.red),
                          )
                      ]
                      else Center(
                        child: OutlinedButton(
                          onPressed: controller.goToNewAddress,
                          child: const Text('Cadastrar um endereço')
                        ),
                      )
                    ],
                  ),
                ),
              ]
              else Center(
                child: OutlinedButton(
                  onPressed: controller.goToLogin,
                  child: const Text('Entre com a sua conta para continuar')
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text(
                  'Forma de pagamento',
                  style: Get.textTheme.titleLarge,
                ),
              ),
              for (var paymentMethod in controller.paymentMethods)
                RadioListTile(
                  title: Text(paymentMethod.name),
                  value: paymentMethod,
                  groupValue: controller.paymentMethod.value,
                  onChanged: controller.changePaymentMethod
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Produtos: ',
                        style: Get.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency().format(controller.totalCart),
                      style: Get.textTheme.titleMedium,
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Custo de entrega: ',
                        style: Get.textTheme.titleMedium,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency().format(controller.deliveryCost),
                      style: Get.textTheme.titleMedium,
                    ),
                  ],
                )
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Total: ',
                        style: Get.textTheme.titleLarge,
                      ),
                    ),
                    Text(
                      NumberFormat.simpleCurrency().format(controller.totalOrder),
                      style: Get.textTheme.titleLarge,
                    ),
                  ],
                )
              ),
              Align(
                child: ElevatedButton(
                  onPressed: controller.canSendOrder
                    ? controller.sendOrder
                    : null,
                  child: const Text('Enviar pedido')
                ),
              ),
            ],
          ),
        );
      })
    );
  }

  Widget _buildAddress() {
    var address = controller.addressSelected.value!;
    return Text('${address.street}, n° ${address.number}, ${address.neighborhood}');
  }
}