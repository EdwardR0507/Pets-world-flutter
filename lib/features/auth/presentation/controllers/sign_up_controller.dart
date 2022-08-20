import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/repositories/auth_repository.dart';

class SignUpController extends GetxController {
  final IAuthRepository apiRepository;

  SignUpController({required this.apiRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  Map<String, Map<String, String>> get data => {
        "previousData": {
          'name': nameController.text,
          'fatherLastname': paternalSurnameController.text,
          'motherLastname': maternalSurnameController.text,
          'dni': dniController.text,
          'address': addressController.text,
          'phone': phoneController.text,
        }
      };
}
