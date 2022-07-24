import 'package:get/get.dart';
import 'package:pets_world/features/user/data/models/pet_model.dart';
import 'package:pets_world/features/user/data/repository/pet_repository.dart';

class PetDetailsController extends GetxController {
  String id = '';
  final PetRepository _petRepository = Get.find();
  RxBool loading = false.obs;
  PetModel? pet;

  void getPet() async {
    loading.value = true;
    pet = await _petRepository.getPet(id);
    loading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
    getPet();
  }
}
