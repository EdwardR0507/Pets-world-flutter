import 'package:get_storage/get_storage.dart';

import '../../domain/repositories/local_storage_repository.dart';

const _token = 'token';
const _userId = 'userId';

class LocalStorageRepositoryImpl extends ILocalStorageRepository {
  @override
  String? getToken() {
    return GetStorage().read(_token);
  }

  @override
  String getUserId() {
    return GetStorage().read(_userId);
  }

  @override
  Future<void> removeToken() async {
    GetStorage().remove(_token);
  }

  @override
  Future<void> setToken(String token) async {
    GetStorage().write(_token, token);
  }

  @override
  Future<void> setUserId(String userId) async {
    GetStorage().write(_userId, userId);
  }
}
