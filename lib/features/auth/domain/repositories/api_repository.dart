abstract class IApiRepository {
  Future<void> login(String email, String password);
  Future<void> signUp(String name, String fatherLastname, String motherLastname,
      String dni, String address, String phone);
  Future<void> signUpApp(
      dynamic previousData, String email, String nickname, String password);
  Future<void> logout(String token);
}
