import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../utils/base_url.dart';
import '../../domain/exceptions/auth_exceptions.dart';
import '../../domain/repositories/auth_repository.dart';
import '../../domain/request/login_request.dart';
import '../../domain/request/sign_up_request.dart';
import '../../domain/response/login_response.dart';
import '../../domain/response/sign_up_response.dart';
import 'local_storage_repository_impl.dart';

class AuthRepositoryImpl extends IAuthRepository {
  @override
  Future<LoginResponse> login(LoginRequest req) async {
    try {
      var url = Uri.parse('${baseUrl}login');
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{'email': req.email, 'password': req.password},
        ),
      );
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = LoginResponse.fromMap(res);
        return data;
      } else {
        throw Exception(res['msg']);
      }
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  @override
  Future<void> logout(String token) {
    return LocalStorageRepositoryImpl().removeToken();
  }

  @override
  Future<SignUpResponse> signUp(SignUpRequest req) async {
    try {
      var url = Uri.parse('${baseUrl}register');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'name': req.previousData['name']!,
              'father_lastname': req.previousData['fatherLastname']!,
              'mother_lastname': req.previousData['motherLastname']!,
              'dni': req.previousData['dni']!,
              'address': req.previousData['address']!,
              'phone_number': req.previousData['phone']!,
              'email': req.email,
              'nickname': req.nickname,
              'password': req.password
            },
          ));
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        final data = SignUpResponse.fromMap(res);
        return data;
      } else {
        throw AuthException(res['msg']);
      }
    } catch (e) {
      throw AuthException(e.toString());
    }
  }
}
