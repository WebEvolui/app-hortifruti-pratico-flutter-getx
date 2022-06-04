import 'package:app_hortifruti_pratico/app/modules/user_address_list/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressListPage extends GetView<UserAddressListController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UserAddressListPage')),
      body: SingleChildScrollView(
        child: controller.obx(
          (state) => Column(
            children: [
              for (var address in state!)
                ListTile(
                  title: Text('${address.street}, n° ${address.number}'),
                  subtitle: Text('${address.neighborhood}, ${address.city!.name}'),
                  trailing: PopupMenuButton(
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Editar')
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('Excluir')
                      ),
                    ],
                    onSelected: (value) {
                      switch (value) {
                        case 'delete':
                          break;
                        case 'edit':
                          break;
                      }
                    },
                  ),
                )
            ],
          ),
        ),
      )
    );
  }
}