import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/space.dart';
import '../../../../components/submit_button.dart';
import '../../../../components/text_input.dart';
import '../../../../mixin/validation_mixins.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/custom_snackbar.dart';
import '../../../../utils/enums.dart';
import '../controllers/sign_up_app_controller.dart';

class SignUpAppPage extends GetView<SignUpAppController> with ValidationMixins {
  final previousData = Get.arguments['previousData'];

  void _signUp() async {
    final result = await controller.signUp(previousData);
    if (result) {
      customSnackbar('Éxito', 'Registro exitoso', CustomSnackbarType.success);
      Get.toNamed(RouteNames.signIn);
    } else {
      customSnackbar('Error', 'Registro incorrecto', CustomSnackbarType.error);
    }
  }

  SignUpAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      child: Form(
                    key: controller.formKey,
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
                            if (controller.formKey.currentState!.validate()) {
                              controller.formKey.currentState?.save();
                              _signUp();
                            }
                          },
                          text: 'REGISTRARME'),
                    ]),
                  )))
            ]),
          ),
          Positioned.fill(
            child:
                Obx(() => controller.signUpState.value == LoadingState.loading
                    ? Container(
                        color: Colors.black26,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : const SizedBox.shrink()),
          ),
        ],
      ),
    );
  }
}
