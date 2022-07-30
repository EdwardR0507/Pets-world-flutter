import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/loading_widget.dart';
import '../../domain/repositories/api_repository.dart';

class SignUpAppController extends GetxController {
  final IApiRepository apiRepository;

  SignUpAppController({
    required this.apiRepository,
  });

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController userNameController,
      emailController,
      passwordController;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signUp(previousData) {
    Get.showOverlay(
        asyncFunction: () => apiRepository.signUpApp(
            previousData,
            emailController.text,
            userNameController.text,
            passwordController.text),
        loadingWidget: const Loading());
  }
}
