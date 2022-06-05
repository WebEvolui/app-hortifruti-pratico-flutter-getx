import 'package:app_hortifruti_pratico/app/modules/register/controller.dart';
import 'package:app_hortifruti_pratico/app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Criar conta')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Form(
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
                  if (value != null && (value.isEmpty || value.length < 8)) {
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
                        child: const Text('Cadastrar')
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}