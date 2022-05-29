import 'package:app_hortifruti_pratico/app/modules/home/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hortifruti Prático')),
      body: Obx(() => ListView(
        children: [
          ListTile(
            title: Text('Horti Verde'),
            leading: FlutterLogo(),
            trailing: Text('Aberto'),
          )
        ],
      ))
    );
  }
}