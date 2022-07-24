import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets_world/routes/route_names.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = GetStorage();
    bool isAuth = token.read('token') != null;

    if (route != RouteNames.userHome &&
        route != RouteNames.dashboard &&
        route != RouteNames.registerPet &&
        route != RouteNames.pet &&
        route != RouteNames.reportPet &&
        route != RouteNames.pets &&
        isAuth) {
      return const RouteSettings(name: RouteNames.dashboard);
    }

    if (!isAuth &&
        route != RouteNames.landing &&
        route != RouteNames.signIn &&
        route != RouteNames.signUpApp &&
        route != RouteNames.userHome &&
        route != RouteNames.signUp) {
      return const RouteSettings(name: RouteNames.landing);
    }

    return null;
  }
}
