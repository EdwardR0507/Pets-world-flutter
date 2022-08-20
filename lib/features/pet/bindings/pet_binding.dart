import 'package:get/get.dart';
import '../presentation/controllers/check_pet_controller.dart';
import '../presentation/controllers/check_image_controller.dart';
import '../presentation/controllers/pet_reported_controller.dart';

import '../presentation/controllers/dashboard_controller.dart';
import '../presentation/controllers/my_pets_controller.dart';
import '../presentation/controllers/pet_details_controller.dart';
import '../presentation/controllers/pet_register_controller.dart';
import '../presentation/controllers/pet_report_controller.dart';
import '../presentation/controllers/pets_controller.dart';

class PetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController(
          localStorageRepository: Get.find(),
        ));
    Get.lazyPut<MyPetsController>(() => MyPetsController(
          localStorageRepository: Get.find(),
          petRepository: Get.find(),
        ));
    Get.lazyPut<PetsController>(() => PetsController(
          localStorageRepository: Get.find(),
          petRepository: Get.find(),
        ));
    Get.lazyPut<PetRegisterController>(() => PetRegisterController(
          localStorageRepository: Get.find(),
          petRepository: Get.find(),
        ));
    Get.lazyPut<PetDetailsController>(() => PetDetailsController(
          petRepository: Get.find(),
        ));
    Get.lazyPut<CheckImageController>(() => CheckImageController(
          petRepository: Get.find(),
        ));
    Get.lazyPut<PetReportController>(() => PetReportController(
          localStorageRepository: Get.find(),
          petRepository: Get.find(),
        ));
    Get.lazyPut<PetReportedController>(() => PetReportedController(
          localStorageRepository: Get.find(),
          petRepository: Get.find(),
        ));
    Get.lazyPut<CheckPetController>(
      () => CheckPetController(petRepository: Get.find()),
    );
  }
}
