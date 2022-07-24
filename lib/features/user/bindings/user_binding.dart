import 'package:get/get.dart';
import 'package:pets_world/features/user/controllers/dashboard_controller.dart';
import 'package:pets_world/features/user/controllers/pet_details_controller.dart';
import 'package:pets_world/features/user/controllers/pet_register_controller.dart';
import 'package:pets_world/features/user/controllers/pets_controller.dart';
import 'package:pets_world/features/user/controllers/user_controller.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<UserController>(() => UserController());
    Get.lazyPut<PetsController>(() => PetsController());
    Get.lazyPut<PetRegisterController>(() => PetRegisterController());
    Get.lazyPut<PetDetailsController>(() => PetDetailsController());
  }
}
