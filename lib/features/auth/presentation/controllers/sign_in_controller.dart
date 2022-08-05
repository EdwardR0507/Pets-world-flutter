import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/utils/enums.dart';
import '../../domain/exceptions/auth_exceptions.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/repositories/local_storage_repository.dart';
import '../../domain/request/login_request.dart';

class SignInController extends GetxController {
  final IAuthRepository apiRepository;
  final ILocalStorageRepository localStorageRepository;

  SignInController(
      {required this.apiRepository, required this.localStorageRepository});

  final loginState = Rx(LoadingState.initial);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController emailController, passwordController;

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

  Future<bool> signIn() async {
    try {
      loginState.value = LoadingState.loading;
      final loginResponse = await apiRepository.login(LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      ));
      await localStorageRepository.setUserId(loginResponse.user.id);
      await localStorageRepository.setToken(loginResponse.token);
      return true;
    } on AuthException catch (_) {
      loginState.value = LoadingState.initial;
      return false;
    }
  }
}
