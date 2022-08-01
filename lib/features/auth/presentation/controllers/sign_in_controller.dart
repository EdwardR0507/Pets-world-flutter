import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/features/auth/domain/exceptions/auth_exceptions.dart';
import 'package:pets_world/features/auth/domain/repositories/local_storage_repository.dart';
import 'package:pets_world/features/auth/domain/request/login_request.dart';
import 'package:pets_world/utils/enums.dart';
import '../../domain/repositories/auth_repository.dart';

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
