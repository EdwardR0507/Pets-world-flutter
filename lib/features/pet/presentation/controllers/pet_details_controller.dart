import 'package:get/get.dart';

import '../../domain/entities/pet.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';

class PetDetailsController extends GetxController {
  final IPetRepository petRepository;
  String id = '';
  RxBool loading = false.obs;
  Pet? pet;

  PetDetailsController({required this.petRepository});

  void getPet() async {
    try {
      loading.value = true;
      pet = await petRepository.getPet(id);
      loading.value = false;
    } on PetException catch (_) {
      loading.value = false;
    }
  }

  Future<bool> deletePet() async {
    try {
      loading.value = true;
      final msg = await petRepository.deletePet(id);
      return true;
    } on PetException catch (_) {
      loading.value = false;
      return false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPet();
  }
}
