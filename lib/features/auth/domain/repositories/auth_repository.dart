import '../request/login_request.dart';
import '../request/sign_up_request.dart';
import '../response/login_response.dart';
import '../response/sign_up_response.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(LoginRequest req);
  Future<SignUpResponse> signUp(SignUpRequest req);
  Future<void> logout(String token);
}
