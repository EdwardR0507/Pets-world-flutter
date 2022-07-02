import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets_world/features/auth/pages/sign_in_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_app_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_page.dart';
import 'package:pets_world/features/home/home_page.dart';
import 'package:pets_world/features/loss/pages/loss_report_pet_page.dart';
import 'package:pets_world/features/user/pages/dashboard_page.dart';
import 'package:pets_world/features/user/pages/pets/pet_details_page.dart';
import 'package:pets_world/features/user/pages/pets/pet_register_page.dart';
import 'package:pets_world/features/user/pages/pets/pets_page.dart';
import 'package:pets_world/features/user/pages/user_home.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final token = GetStorage();
    bool isAuth = token.read('token') != null;

    if (route != UserHomePage.routeName &&
        route != DashboardPage.routeName &&
        route != PetDetailsPage.routeName &&
        route != PetRegisterPage.routeName &&
        route != PetDetailsPage.routeName &&
        route != LossReportPage.routeName &&
        route != PetsPage.routeName &&
        isAuth) {
      return const RouteSettings(name: DashboardPage.routeName);
    }

    if (!isAuth &&
        route != HomePage.routeName &&
        route != SignInPage.routeName &&
        route != SignUpAppPage.routeName &&
        route != UserHomePage.routeName &&
        route != SignUpPage.routeName) {
      return const RouteSettings(name: HomePage.routeName);
    }

    return null;
  }
}
