import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pets_world/components/loading_widget.dart';
import 'package:pets_world/features/user/pages/dashboard_page.dart';
import 'package:pets_world/features/user/pages/user_home.dart';
import 'package:pets_world/utils/base_url.dart';
import 'package:pets_world/utils/custom_snackbar.dart';

class SignInController extends GetxController {
  late TextEditingController emailController, passwordController;

  final token = GetStorage();

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signIn() {
    Get.showOverlay(
        asyncFunction: () => login(), loadingWidget: const Loading());
  }

  Future login() async {
    try {
      var url = Uri.parse('${baseUrl}login');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'email': emailController.text,
              'password': passwordController.text
            },
          ));
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        token.write('token', res['token']);
        Get.offAllNamed(DashboardPage.routeName);
      } else {
        customSnackbar('Error', res['msg'], CustomSnackbarType.error);
      }
    } catch (e) {
      print(e);
    }
  }
}
