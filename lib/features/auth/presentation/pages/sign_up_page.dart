import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/routes/route_names.dart';
import '../../../../components/submit_button.dart';
import '../../../../components/space.dart';
import '../../../../components/text_input.dart';
import '../controllers/sign_up_controller.dart';
import '../../../../mixin/validation_mixins.dart';

class SignUpPage extends GetView<SignUpController> with ValidationMixins {
  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      addVerticalSpace(60),
      Image.asset("assets/images/logo.png"),
      addVerticalSpace(30),
      const Text("Regístrate",
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40)),
      addVerticalSpace(30),
      const Text("Comencemos sabiendo quién eres.",
          style: TextStyle(fontSize: 16)),
      addVerticalSpace(30),
      Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: controller.formKey,
              child: Column(children: [
                TextInput(
                  controller: controller.nameController,
                  hintText: "Nombres",
                  validator: validateName,
                ),
                addVerticalSpace(30),
                TextInput(
                  controller: controller.paternalSurnameController,
                  hintText: "Apellido Paterno",
                  validator: validateLastName,
                ),
                addVerticalSpace(30),
                TextInput(
                  controller: controller.maternalSurnameController,
                  hintText: "Apellido Materno",
                  validator: validateLastName,
                ),
                addVerticalSpace(30),
                TextInput(
                  controller: controller.dniController,
                  hintText: "DNI",
                  validator: validateDNI,
                  keyboardType: TextInputType.number,
                ),
                addVerticalSpace(30),
                TextInput(
                  controller: controller.addressController,
                  hintText: "Dirección",
                  validator: validateAddress,
                ),
                addVerticalSpace(30),
                TextInput(
                  controller: controller.phoneController,
                  hintText: "Teléfono",
                  validator: validatePhone,
                  keyboardType: TextInputType.number,
                ),
                addVerticalSpace(30),
                CustomSubmitButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.formKey.currentState?.save();
                        Get.toNamed(RouteNames.signUpApp,
                            arguments: controller.data);
                      }
                    },
                    text: 'SIGUIENTE'),
              ])))
    ]))));
  }
}
