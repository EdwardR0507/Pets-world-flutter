import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/auth/data/repositories/local_storage_repository_impl.dart';
import '../routes/route_names.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    bool isAuth = LocalStorageRepositoryImpl().getToken() != null;

    if (route != RouteNames.myPets &&
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
        route != RouteNames.signUp) {
      return const RouteSettings(name: RouteNames.landing);
    }

    return null;
  }
}
