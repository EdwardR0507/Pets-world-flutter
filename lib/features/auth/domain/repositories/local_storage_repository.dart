abstract class ILocalStorageRepository {
  String? getToken();
  Future<void> setToken(String token);
  Future<void> removeToken();
}
