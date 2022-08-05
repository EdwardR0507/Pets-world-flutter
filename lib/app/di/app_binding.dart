import 'package:get/get.dart';

import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/data/repositories/local_storage_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/repositories/local_storage_repository.dart';
import '../../features/pet/data/repository/pet_repository_impl.dart';
import '../../features/pet/domain/repositories/pet_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocalStorageRepository>(() => LocalStorageRepositoryImpl(),
        fenix: true);
    Get.lazyPut<IAuthRepository>(() => AuthRepositoryImpl(), fenix: true);
    Get.lazyPut<IPetRepository>(() => PetRepositoryImpl(), fenix: true);
  }
}
