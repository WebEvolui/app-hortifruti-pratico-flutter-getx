import 'package:app_hortifruti_pratico/app/modules/store/controller.dart';
import 'package:app_hortifruti_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: controller.obx(
        (state) => ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                children: [
                  Container(
                    width: 96.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: state!.image,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.name,
                          style: Get.textTheme.headline5,
                        ),
                        const SizedBox(height: 8.0,),
                        StoreStatus(isOnline: state.isOnline)
                      ]
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      )
    );
  }
}