import 'package:get/get.dart';
import '../../../auth/domain/repositories/local_storage_repository.dart';

import '../../domain/entities/pet.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';

class PetsController extends GetxController {
  final IPetRepository petRepository;
  final ILocalStorageRepository localStorageRepository;
  RxBool loading = false.obs;
  List<Pet>? pets;
  String userId = '';

  PetsController(
      {required this.localStorageRepository, required this.petRepository});

  void getPets() async {
    try {
      loading.value = true;
      pets = await petRepository.getPets();
      userId = localStorageRepository.getUserId();
      loading.value = false;
    } on PetException catch (_) {
      loading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getPets();
  }
}
