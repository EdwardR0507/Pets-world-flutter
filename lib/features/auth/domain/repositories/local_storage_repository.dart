abstract class ILocalStorageRepository {
  String? getToken();
  String getUserId();
  Future<void> setUserId(String userId);
  Future<void> setToken(String token);
  Future<void> removeToken();
}
