import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/repositories/api_repository.dart';
import '../../../../components/loading_widget.dart';

class SignUpController extends GetxController {
  final IApiRepository apiRepository;

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

  void checkSignUp() {
    Get.showOverlay(
        asyncFunction: () => apiRepository.signUp(
            nameController.text,
            paternalSurnameController.text,
            maternalSurnameController.text,
            dniController.text,
            addressController.text,
            phoneController.text),
        loadingWidget: const Loading());
  }
}
