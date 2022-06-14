import 'package:app_hortifruti_pratico/app/modules/store/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:app_hortifruti_pratico/app/widgets/store_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

class StorePage extends GetView<StoreController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() {
        if (controller.showCartButton) {
          return FloatingActionButton(
            child: Icon(Icons.shopping_cart),
            onPressed: () => Get.toNamed(Routes.cart),
            tooltip: 'Ver carrinho',
          );
        }

        return Container();
      }),
      body: controller.obx(
        (state) => CustomScrollView(
          slivers: [
            const SliverAppBar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  top: 8.0,
                  right: 16.0,
                  bottom: 16.0
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 96.0,
                      height: 96.0,
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
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                ((context, index) {
                  var category = state.categories[index];

                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.grey[200],
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              child: Text(
                                category.name,
                                style: Get.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          )
                        ],
                      ),
                      for (var product in category.products)
                        ListTile(
                          title: Text(product.name),
                          subtitle: Text(NumberFormat.simpleCurrency().format(product.price) + (product.isKg ? '/kg' : '')),
                          leading: product.image.isNotEmpty
                              ? SizedBox(
                                  width: 56.0,
                                  height: 56.0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: FadeInImage.memoryNetwork(
                                      placeholder: kTransparentImage,
                                      image: product.image,
                                    ),
                                  ),
                                )
                              : null,
                          onTap: () => Get.toNamed(
                            Routes.product,
                            arguments: {
                              'product': product,
                              'store': state,
                            }
                          ),
                        )
                    ],
                  );
                }),
                childCount: state.categories.length
              ),
            )
          ],
        )
      )
    );
  }
}