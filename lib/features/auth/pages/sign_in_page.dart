import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/features/auth/controllers/sign_in_controller.dart';
import 'package:pets_world/components/space.dart';
import 'package:pets_world/components/text_input.dart';
import 'package:pets_world/mixin/validation_mixins.dart';

class SignInPage extends GetView<SignInController> with ValidationMixins {
  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _submitButton() {
      return ElevatedButton(
        onPressed: () {
          if (controller.formKey.currentState!.validate()) {
            controller.formKey.currentState?.save();
            controller.signIn();
          }
        },
        style: ElevatedButton.styleFrom(
            primary: const Color(0xFF6200EE),
            fixedSize: const Size(350, 36),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: const Text("INICIAR SESIÓN"),
      );
    }

    return Scaffold(
        body: Column(children: [
      addVerticalSpace(60),
      Image.asset("assets/images/logo.png"),
      addVerticalSpace(30),
      const Text("Inicia Sesión",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),
          textAlign: TextAlign.center),
      addVerticalSpace(30),
      const Text("Un gusto volverte a ver por aquí.",
          style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
      addVerticalSpace(30),
      Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: controller.formKey,
              child: Column(children: [
                TextInput(
                  controller: controller.emailController,
                  hintText: "Email",
                  validator: validateName,
                ),
                addVerticalSpace(30),
                TextInput(
                  controller: controller.passwordController,
                  hintText: "Contraseña",
                  validator: validatePassword,
                  obscureText: true,
                ),
                addVerticalSpace(30),
                _submitButton()
              ])))
    ]));
  }
}
