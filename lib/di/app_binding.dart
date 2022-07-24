import 'package:get/get.dart';
import 'package:pets_world/features/user/data/repository/pet_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PetRepository(), fenix: true);
  }
}
