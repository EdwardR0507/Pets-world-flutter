import 'package:get/get.dart';

import '../presentation/controllers/dashboard_controller.dart';
import '../presentation/controllers/pet_details_controller.dart';
import '../presentation/controllers/pet_register_controller.dart';
import '../presentation/controllers/pets_controller.dart';
import '../presentation/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController(
          localStorage: Get.find(),
        ));
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<PetsController>(() => PetsController(
          petRepository: Get.find(),
        ));
    Get.lazyPut<PetRegisterController>(() => PetRegisterController(
          petRepository: Get.find(),
        ));
    Get.lazyPut<PetDetailsController>(() => PetDetailsController(
          petRepository: Get.find(),
        ));
  }
}
