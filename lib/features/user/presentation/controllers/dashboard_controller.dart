import 'package:get/get.dart';
import '../../../auth/domain/repositories/local_storage_repository.dart';
import '../../../../routes/route_names.dart';

class DashboardController extends GetxController {
  final ILocalStorageRepository localStorage;
  final _selectedIndex = RxInt(0);

  DashboardController({required this.localStorage});

  void logout() {
    localStorage.removeToken();
    Get.offAllNamed(RouteNames.signIn);
  }

  RxInt get selectedIndex => _selectedIndex;
  void setSelectedIndex(int index) {
    _selectedIndex.value = index;
  }
}
