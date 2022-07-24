import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:pets_world/components/loading_widget.dart';
import 'package:pets_world/routes/route_names.dart';
import 'package:pets_world/utils/base_url.dart';
import 'package:pets_world/utils/custom_snackbar.dart';

class SignUpAppController extends GetxController {
  late TextEditingController userNameController,
      emailController,
      passwordController;

  @override
  void onInit() {
    super.onInit();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void onClose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void signUp(previousData) {
    Get.showOverlay(
        asyncFunction: () => register(previousData),
        loadingWidget: const Loading());
  }

  Future register(previousData) async {
    try {
      var url = Uri.parse('${baseUrl}register');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              'name': previousData['name'],
              'father_lastname': previousData['father_lastname'],
              'mother_lastname': previousData['mother_lastname'],
              'dni': previousData['dni'],
              'address': previousData['address'],
              'phone_number': previousData['phone'],
              'email': emailController.text,
              'nickname': userNameController.text,
              'password': passwordController.text
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
