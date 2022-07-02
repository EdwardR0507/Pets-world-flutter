import 'package:get/get.dart';
import 'package:pets_world/features/auth/controllers/sign_in_controller.dart';
import 'package:pets_world/features/auth/controllers/sign_up_app_controller.dart';
import 'package:pets_world/features/auth/controllers/sign_up_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
    Get.lazyPut<SignUpAppController>(() => SignUpAppController());
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
