import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/features/auth/domain/exceptions/auth_exceptions.dart';
import 'package:pets_world/features/auth/domain/request/sign_up_request.dart';
import 'package:pets_world/utils/enums.dart';

import '../../domain/repositories/auth_repository.dart';

class SignUpAppController extends GetxController {
  final IAuthRepository apiRepository;

  SignUpAppController({required this.apiRepository});

  final signUpState = Rx(LoadingState.initial);
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

  Future<bool> signUp(previousData) async {
    try {
      signUpState.value = LoadingState.loading;
      await apiRepository.signUp(SignUpRequest(
          previousData: previousData,
          email: emailController.text,
          nickname: userNameController.text,
          password: passwordController.text));
      return true;
    } on AuthException catch (_) {
      signUpState.value = LoadingState.initial;
      return false;
    }
  }
}
