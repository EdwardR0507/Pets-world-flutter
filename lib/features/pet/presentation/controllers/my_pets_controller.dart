import 'package:get/get.dart';

import '../../../auth/domain/repositories/local_storage_repository.dart';
import '../../domain/entities/pet.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';

class MyPetsController extends GetxController {
  final ILocalStorageRepository localStorageRepository;
  final IPetRepository petRepository;
  RxBool loading = false.obs;
  List<Pet>? pets;
  String userId = '';

  MyPetsController(
      {required this.localStorageRepository, required this.petRepository});

  void getMyPets() async {
    try {
      loading.value = true;
      userId = localStorageRepository.getUserId();
      pets = await petRepository.getPetsByOwnerId(userId);
      loading.value = false;
    } on PetException catch (_) {
      loading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getMyPets();
  }
}
