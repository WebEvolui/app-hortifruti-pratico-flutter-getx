import 'package:get/get.dart';
import 'package:intl/intl.dart';

class QuantityAndWeightController extends GetxController {

  bool isKg;

  QuantityAndWeightController({required this.isKg});

  num quantity = 1;
  double get weight => quantity.toDouble();
  late double min;
  late double max;
  final sliderEnabled = true.obs;

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