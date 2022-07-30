import 'dart:convert';

import 'package:get/get.dart';
import 'local_storage_impl.dart';
import '../../domain/repositories/api_repository.dart';
import '../../../../routes/route_names.dart';
import '../../../../utils/base_url.dart';
import 'package:http/http.dart' as http;
import '../../../../utils/custom_snackbar.dart';

class ApiRepositoryImpl extends IApiRepository {
  @override
  Future<void> login(String email, String password) async {
    try {
      var url = Uri.parse('${baseUrl}login');
      var respone = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{'email': email, 'password': password},
        ),
      );
      var res = jsonDecode(respone.body);
      if (respone.statusCode == 200) {
        LocalStorageImpl().setToken(res['token']);
        Get.offAllNamed(RouteNames.dashboard);
      } else {
        customSnackbar('Error', res['msg'], CustomSnackbarType.error);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> logout(String token) {
    return LocalStorageImpl().removeToken();
  }

  @override
  Future<void> signUp(String name, String fatherLastname, String motherLastname,
      String dni, String address, String phone) async {
    Get.toNamed(RouteNames.signUpApp, arguments: {
      'previousData': {
        'name': name,
        'fatherLastname': fatherLastname,
        'motherLastname': motherLastname,
        'dni': dni,
        'address': address,
        'phone': phone,
      }
    });
  }

  @override
  Future<void> signUpApp(dynamic previousData, String email, String nickname,
      String password) async {
    try {
      var url = Uri.parse('${baseUrl}register');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'name': previousData['name']!,
              'father_lastname': previousData['fatherLastname']!,
              'mother_lastname': previousData['motherLastname']!,
              'dni': previousData['dni']!,
              'address': previousData['address']!,
              'phone_number': previousData['phone']!,
              'email': email,
              'nickname': nickname,
              'password': password
            },
          ));
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        customSnackbar('Éxito', res['msg'], CustomSnackbarType.success);
        Get.toNamed(RouteNames.signIn);
      } else {
        customSnackbar('Error', res['msg'], CustomSnackbarType.error);
        throw Exception('Failed to register');
      }
    } catch (e) {
      print(e);
    }
  }
}
