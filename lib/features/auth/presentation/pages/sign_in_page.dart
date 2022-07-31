import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/utils/enums.dart';

import '../../../../components/space.dart';
import '../../../../components/submit_button.dart';
import '../../../../components/text_input.dart';
import '../../../../mixin/validation_mixins.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/custom_snackbar.dart';
import '../controllers/sign_in_controller.dart';

class SignInPage extends GetView<SignInController> with ValidationMixins {
  void _login() async {
    final result = await controller.signIn();
    if (result) {
      Get.offAllNamed(RouteNames.dashboard);
    } else {
      customSnackbar('Error', 'Login incorrecto', CustomSnackbarType.error);
    }
  }

  SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(
        children: [
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
              child: Column(
                children: [
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
                          _login();
                        }
                      },
                      text: 'INICIAR SESIÓN'),
                ],
              ),
            ),
          ),
        ],
      ),
      Positioned.fill(
        child: Obx(() => controller.loginState.value == LoadingState.loading
            ? Container(
                color: Colors.black26,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : const SizedBox.shrink()),
      )
    ]));
  }
}
