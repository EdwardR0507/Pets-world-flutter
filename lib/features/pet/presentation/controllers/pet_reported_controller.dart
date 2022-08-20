import 'package:get/get.dart';

import '../../../auth/domain/repositories/local_storage_repository.dart';
import '../../domain/entities/pet.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';

class PetReportedController extends GetxController {
  final ILocalStorageRepository localStorageRepository;
  final IPetRepository petRepository;
  RxBool loading = false.obs;
  List<Pet>? pets;
  String userId = '';

  PetReportedController(
      {required this.localStorageRepository, required this.petRepository});

  void checkPets() async {
    try {
      loading.value = true;
      userId = localStorageRepository.getUserId();
      pets = await petRepository.getReportedPetsByOwnerId(userId);
      loading.value = false;
    } on PetException catch (_) {
      loading.value = false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    checkPets();
  }
}
