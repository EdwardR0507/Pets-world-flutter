import 'package:get/get.dart';

import '../../domain/entities/pet.dart';
import '../../domain/repositories/pet_repository.dart';

class PetsController extends GetxController {
  final IPetRepository petRepository;
  RxBool loading = false.obs;
  List<Pet>? pets;

  PetsController({required this.petRepository});

  void getPets() async {
    loading.value = true;
    pets = await petRepository.getPets();
    loading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
    getPets();
  }
}
