import 'package:pets_world/features/auth/domain/request/login_request.dart';
import 'package:pets_world/features/auth/domain/request/sign_up_request.dart';
import 'package:pets_world/features/auth/domain/response/login_response.dart';
import 'package:pets_world/features/auth/domain/response/sign_up_response.dart';

abstract class IAuthRepository {
  Future<LoginResponse> login(LoginRequest req);
  Future<SignUpResponse> signUp(SignUpRequest req);
  Future<void> logout(String token);
}
