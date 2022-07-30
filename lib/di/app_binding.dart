import 'package:get/get.dart';

import '../features/auth/data/repositories/api_repository_impl.dart';
import '../features/auth/data/repositories/local_storage_impl.dart';
import '../features/auth/domain/repositories/api_repository.dart';
import '../features/auth/domain/repositories/local_storage_repository.dart';
import '../features/user/data/repository/pet_repository_impl.dart';
import '../features/user/domain/repositories/pet_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocalStorage>(() => LocalStorageImpl(), fenix: true);
    Get.lazyPut<IApiRepository>(() => ApiRepositoryImpl(), fenix: true);
    Get.lazyPut<IPetRepository>(() => PetRepositoryImpl(), fenix: true);
  }
}
