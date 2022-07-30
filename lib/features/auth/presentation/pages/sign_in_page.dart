import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/submit_button.dart';
import '../../../../components/space.dart';
import '../../../../components/text_input.dart';
import '../controllers/sign_in_controller.dart';
import '../../../../mixin/validation_mixins.dart';

class SignInPage extends GetView<SignInController> with ValidationMixins {
  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                CustomSubmitButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.formKey.currentState?.save();
                        controller.signIn();
                      }
                    },
                    text: 'INICIAR SESIÓN')
              ])))
    ]));
  }
}
