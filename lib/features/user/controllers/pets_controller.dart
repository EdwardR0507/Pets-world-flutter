import 'package:get/get.dart';
import 'package:pets_world/features/user/data/models/pet_model.dart';
import 'package:pets_world/features/user/data/repository/pet_repository.dart';

class PetsController extends GetxController {
  final PetRepository _petRepository = Get.find();
  RxBool loading = false.obs;
  List<PetModel>? pets;

  void getPets() async {
    loading.value = true;
    pets = await _petRepository.getPets();
    loading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
    getPets();
  }
}
