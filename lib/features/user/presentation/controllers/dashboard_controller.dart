import 'package:get/get.dart';
import '../../../auth/domain/repositories/local_storage_repository.dart';

class DashboardController extends GetxController {
  final ILocalStorageRepository localStorageRepository;
  final _selectedIndex = RxInt(0);
  final title = RxString('Mascotas Perdidas');

  DashboardController({required this.localStorageRepository});

  bool logout() {
    try {
      localStorageRepository.removeToken();
      return true;
    } catch (_) {
      return false;
    }
  }

  RxInt get selectedIndex => _selectedIndex;
  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
    if (index == 0) {
      title.value = 'Mascotas Perdidas';
    } else if (index == 1) {
      title.value = 'Mis Mascotas';
    }
  }
}
