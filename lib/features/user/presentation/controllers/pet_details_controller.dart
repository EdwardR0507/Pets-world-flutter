import 'package:get/get.dart';
import '../../data/models/pet_model.dart';
import '../../domain/repositories/pet_repository.dart';

class PetDetailsController extends GetxController {
  String id = '';
  final IPetRepository petRepository;
  RxBool loading = false.obs;
  Pet? pet;

  PetDetailsController({required this.petRepository});

  void getPet() async {
    loading.value = true;
    pet = await petRepository.getPet(id);
    loading.value = false;
  }

  @override
  void onReady() {
    super.onReady();
    getPet();
  }
}
