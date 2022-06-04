import 'package:app_hortifruti_pratico/app/modules/user_address/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddressPage extends GetView<UserAddressController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Novo endereço')),
      body: controller.obx(
        (state) => SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller.streetController,
                decoration: const InputDecoration(
                  labelText: 'Rua',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o nome da rua';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.numberController,
                decoration: const InputDecoration(
                  labelText: 'Número',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o número da casa/apartamento';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.neighborhoodController,
                decoration: const InputDecoration(
                  labelText: 'Bairro',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Preencha o nome do bairro';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.referencePointController,
                decoration: const InputDecoration(
                  labelText: 'Ponto de referência',
                ),
                validator: (String? value) {
                  if (value != null && value.isEmpty) {
                    return 'Informe um ponto de referência para o entregador';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: controller.complementController,
                decoration: const InputDecoration(
                  labelText: 'Complemento',
                ),
              ),
              DropdownButtonFormField(
                value: controller.cityId.value,
                items: state!.map((city) => DropdownMenuItem<int>(
                  value: city.id,
                  child: Text(city.name)
                )).toList(),
                onChanged: controller.changeCity,
                decoration: const InputDecoration(
                  labelText: 'Cidade',
                ),
                validator: (int? value) {
                  if (value == null) {
                    return 'Selecione uma cidade';
                  }

                  return null;
                },
              ),
              const SizedBox(height: 16.0,),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: controller.submit,
                        child: const Text('Adicionar')
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}