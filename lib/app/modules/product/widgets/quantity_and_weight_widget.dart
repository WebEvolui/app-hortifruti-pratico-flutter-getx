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
    return Row(
      children: [
        Text(
          '${NumberFormat.decimalPattern().format(controller.min)}kg',
          style: Get.textTheme.overline,
        ),
        Expanded(
          child: GestureDetector(
            onTapDown: (details) => controller.enableSlider(),
            child: Slider(
              min: controller.min,
              max: controller.max,
              divisions: 19,
              label: controller.label,
              value: controller.weight,
              onChanged: (value) {
                if (controller.sliderEnabled.isTrue) {
                  controller.changeWeight(value);
                }
              }
            ),
          ),
        ),
        Text(
          '${NumberFormat.decimalPattern().format(controller.max)}kg',
          style: Get.textTheme.overline,
        ),
      ],
    );
  }
}

class QuantityAndWeightController extends GetxController {

  bool isKg;

  QuantityAndWeightController({required this.isKg});

  num quantity = 1;
  double get weight => quantity.toDouble();
  late double min;
  late double max;
  final sliderEnabled = false.obs;

  String get label {
    String unit = 'kg';
    String pattern = '0.00';
    var number = weight;

    if (number < 1) {
      number *= 1000;
      unit = 'g';
      pattern = '';
    } else if (number % number.toInt() == 0) {
      pattern = '';
    }

    return NumberFormat(pattern).format(number) + unit;
  }

  @override
  void onInit() {
    _updateMinAndMax();
    
    super.onInit();
  }

  void changeQuantity(num value) {
    quantity = value;

    _updateMinAndMax();
    update();
  }

  void changeWeight(double value) {
    quantity = value;

    update();
  }

  _updateMinAndMax() {
    min = weight - 1 + 0.05;
    max = weight;

    if (min < 0) {
      min = 0.05;
      max = 1;
    }
  }

  void enableSlider() => sliderEnabled.value = true;
}
