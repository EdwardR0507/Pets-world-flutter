import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/components/loading_widget.dart';

class SignUpController extends GetxController {
  late TextEditingController nameController,
      paternalSurnameController,
      maternalSurnameController,
      dniController,
      addressController,
      phoneController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    paternalSurnameController = TextEditingController();
    maternalSurnameController = TextEditingController();
    dniController = TextEditingController();
    addressController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    paternalSurnameController.dispose();
    maternalSurnameController.dispose();
    dniController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.onClose();
  }

  void checkSignUp() {
    Get.showOverlay(
        asyncFunction: () => goToPart2(), loadingWidget: const Loading());
  }

  Future goToPart2() async {
    Get.toNamed('/sign-up-app', arguments: {
      'previousData': {
        'name': nameController.text,
        'father_lastname': paternalSurnameController.text,
        'mother_lastname': maternalSurnameController.text,
        'dni': dniController.text,
        'address': addressController.text,
        'phone': phoneController.text
      }
    });
  }
}
