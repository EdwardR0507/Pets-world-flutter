import 'package:get/get.dart';

import '../presentation/controllers/sign_in_controller.dart';
import '../presentation/controllers/sign_up_app_controller.dart';
import '../presentation/controllers/sign_up_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController(
          apiRepository: Get.find(),
        ));
    Get.lazyPut<SignUpAppController>(() => SignUpAppController(
          apiRepository: Get.find(),
        ));
    Get.lazyPut<SignInController>(() => SignInController(
          apiRepository: Get.find(),
        ));
  }
}
