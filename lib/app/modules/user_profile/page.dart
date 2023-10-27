import 'package:app_hortifruti_pratico/app/modules/user_profile/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfilePage extends GetView<UserProfileController> {
  const UserProfilePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Perfil')),
      body: Obx(() {
        if (controller.loading.isTrue) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (!controller.isLogged) {
          return Center(
            child: ElevatedButton(
              onPressed: () => Get.toNamed(Routes.login),
              child: const Text('Entrar com a minha conta'),
            )
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.toNamed(Routes.userAddressList),
                      child: const Text('Meus endereços')
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0,),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Preencha o seu nome';
                        }
              
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Preencha o seu email';
                        }
              
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.phoneController,
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                      ),
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return 'Preencha o seu telefone para contato';
                        }
              
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: controller.passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Senha',
                      ),
                      obscureText: true,
                      validator: (String? value) {
                        if (value != null && value.isNotEmpty && value.length < 8) {
                          return 'Informe uma senha válida maior que 8 caracteres';
                        }
              
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: controller.submit,
                              child: const Text('Atualizar')
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: controller.logout,
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.red,
                            ),
                            child: const Text('Sair da minha conta'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}