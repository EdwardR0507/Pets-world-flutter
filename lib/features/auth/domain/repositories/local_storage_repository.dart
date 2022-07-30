abstract class ILocalStorage {
  String? getToken();
  Future<void> setToken(String token);
  Future<void> removeToken();
}
