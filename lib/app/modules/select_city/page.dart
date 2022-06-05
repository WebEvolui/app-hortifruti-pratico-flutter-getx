import 'package:app_hortifruti_pratico/app/modules/select_city/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectCityPage extends GetView<SelectCityController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Selecione uma cidade')),
      body: controller.obx(
        (state) => SingleChildScrollView(
          child: Column(
            children: [
              for (var city in state!)
                ListTile(
                  title: Text(
                    '${city.name} / ${city.uf}',
                    textAlign: TextAlign.center,
                  ),
                )
            ],
          )
        )
      ),
    );
  }
}