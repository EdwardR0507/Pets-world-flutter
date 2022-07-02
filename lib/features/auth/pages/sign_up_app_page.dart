import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/components/space.dart';
import 'package:pets_world/components/submit_button.dart';
import 'package:pets_world/components/text_input.dart';
import 'package:pets_world/features/auth/controllers/sign_up_app_controller.dart';
import 'package:pets_world/mixin/validation_mixins.dart';

class SignUpAppPage extends GetView<SignUpAppController> with ValidationMixins {
  static const String routeName = '/sign-up-app';
  final previousData = Get.arguments['previousData'];

  SignUpAppPage({Key? key}) : super(key: key);
  void _onSignUpAppPage(context) {
    controller.SignUp(previousData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(children: [
      addVerticalSpace(60),
      Image.asset("assets/images/logo.png"),
      addVerticalSpace(30),
      const Text("Regístrate",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),
          textAlign: TextAlign.center),
      addVerticalSpace(30),
      const Text(
        "¡Genial!, ahora cuéntanos cómo te llamarás en PetsWorld.",
        style: TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
      ),
      addVerticalSpace(30),
      Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
              child: Column(children: [
            TextInput(
              controller: controller.userNameController,
              hintText: "Nombre de Usuario",
              validator: validateUser,
            ),
            addVerticalSpace(30),
            TextInput(
              controller: controller.emailController,
              hintText: "Correo Electrónico",
              validator: validateEmail,
            ),
            addVerticalSpace(30),
            TextInput(
              controller: controller.passwordController,
              hintText: "Contraseña",
              validator: validatePassword,
              obscureText: true,
            ),
            addVerticalSpace(30),
            CustomSubmitButton(
                onPressed: () {
                  _onSignUpAppPage(context);
                },
                text: "REGISTRARME")
          ])))
    ])));
  }
}
