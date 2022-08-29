import 'package:get/get.dart';
import '../../domain/entities/pet.dart';
import '../../domain/repositories/pet_repository.dart';

import '../../../auth/domain/repositories/local_storage_repository.dart';

class DashboardController extends GetxController {
  final ILocalStorageRepository localStorageRepository;
  final IPetRepository petRepository;
  final _selectedIndex = RxInt(0);
  List<Pet> pets = [];
  List<Pet> myPets = [];
  List<Pet> myReportedPets = [];
  final title = RxString('Mascotas Perdidas');

  DashboardController(
      {required this.localStorageRepository, required this.petRepository});

  bool logout() {
    try {
      localStorageRepository.removeToken();
      return true;
    } catch (_) {
      return false;
    }
  }

  RxInt get selectedIndex => _selectedIndex;
  void setSelectedIndex(int index) async {
    _selectedIndex.value = index;
    switch (index) {
      case 0:
        title.value = 'Mascotas Perdidas';
        if (pets.isEmpty) {
          pets = await petRepository.getPets();
        }
        break;
      case 1:
        title.value = 'Mis mascotas';
        if (myPets.isEmpty) {
          final userId = localStorageRepository.getUserId();
          myPets = await petRepository.getPetsByOwnerId(userId);
        }
        break;
      case 2:
        title.value = 'Mascotas Reportadas';
        if (myReportedPets.isEmpty) {
          final userId = localStorageRepository.getUserId();
          myReportedPets = await petRepository.getReportedPetsByOwnerId(userId);
        }
        break;
    }
  }

  @override
  void onReady() {
    super.onReady();
    setSelectedIndex(0);
  }
}
