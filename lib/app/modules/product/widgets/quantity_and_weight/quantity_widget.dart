import 'package:app_hortifruti_pratico/app/modules/product/widgets/quantity_and_weight/quantity_and_weight_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuantityWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    var isKg = controller.isKg;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: quantity > 1 ? () => controller.changeQuantity(quantity - 1) : null,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.remove),
        ),
        Container(
          width: isKg ? 96.0 : 48.0,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            NumberFormat.decimalPattern().format(quantity) + (isKg ? 'kg' : ''),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => controller.changeQuantity(quantity + 1),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}