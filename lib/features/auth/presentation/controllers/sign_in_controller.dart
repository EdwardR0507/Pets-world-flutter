import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import '../../domain/repositories/api_repository.dart';
import '../../../../components/loading_widget.dart';

class SignInController extends GetxController {
  final IApiRepository apiRepository;

  SignInController({required this.apiRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

  final token = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() {
    Get.showOverlay(
        asyncFunction: () =>
            apiRepository.login(emailController.text, passwordController.text),
        loadingWidget: const Loading());
  }
}
