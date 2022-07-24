import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/features/auth/controllers/sign_up_controller.dart';
import 'package:pets_world/components/space.dart';
import 'package:pets_world/components/text_input.dart';
import 'package:pets_world/mixin/validation_mixins.dart';

class SignUpPage extends GetView<SignUpController> with ValidationMixins {
  SignUpPage({Key? key}) : super(key: key);

  Widget _submitButton(context) {
    return ElevatedButton(
      onPressed: () {
        if (controller.formKey.currentState!.validate()) {
          controller.formKey.currentState?.save();
          controller.checkSignUp();
        }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("SIGUIENTE"),
    );
  }

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
                _submitButton(context)
              ])))
    ]))));
  }
}
