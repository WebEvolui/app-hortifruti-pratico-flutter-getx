import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightWidget extends StatelessWidget {

  bool isKg;

  QuantityAndWeightWidget({this.isKg = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuantityAndWeightController>(
      init: QuantityAndWeightController(isKg: isKg),
      builder: (controller) => Column(
        children: [
          QuantityWidget(),
          if (isKg)
            WeightWidget()
        ],
      ),
    );
  }
}

class QuantityWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    var quantity = controller.quantity;
    var isKg = controller.isKg;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: quantity > 1 ? () => controller.changeQuantity(quantity - 1) : null,
          child: const Icon(Icons.remove),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
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
          child: const Icon(Icons.add),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(40, 40),
          ),
        ),
      ],
    );
  }
}

class WeightWidget extends StatelessWidget {
  var controller = Get.find<QuantityAndWeightController>();

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 1,
      max: 2,
      divisions: 19,
      value: controller.weight,
      onChanged: controller.changeWeight
    );
  }
}

class QuantityAndWeightController extends GetxController {

  bool isKg;

  QuantityAndWeightController({required this.isKg});

  num quantity = 1;
  double get weight => quantity.toDouble();

  void changeQuantity(num value) {
    quantity = value;

    update();
  }

  void changeWeight(double value) {
    quantity = value;

    update();
  }
}
