import 'package:get/get.dart';
import 'package:pets_world/features/auth/bindings/auth_binding.dart';
import 'package:pets_world/features/auth/pages/sign_in_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_app_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_page.dart';
import 'package:pets_world/features/home/bindings/home_binding.dart';
import 'package:pets_world/features/home/home_page.dart';
import 'package:pets_world/features/loss/pages/loss_report_pet_page.dart';
import 'package:pets_world/features/user/bindings/user_binding.dart';
import 'package:pets_world/features/user/pages/dashboard_page.dart';
import 'package:pets_world/features/user/pages/pets/pet_details_page.dart';
import 'package:pets_world/features/user/pages/pets/pet_register_page.dart';
import 'package:pets_world/features/user/pages/pets/pets_page.dart';
import 'package:pets_world/features/user/pages/user_home.dart';
import 'package:pets_world/mixin/auth_middleware.dart';

const initialRoute = HomePage.routeName;

List<GetPage> pages = [
  GetPage(
    name: SignUpPage.routeName,
    page: () => SignUpPage(),
    binding: AuthBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: SignUpAppPage.routeName,
    page: () => SignUpAppPage(),
    binding: AuthBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: SignInPage.routeName,
    page: () => SignInPage(),
    binding: AuthBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => HomePage(),
    binding: HomeBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: DashboardPage.routeName,
    page: () => DashboardPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: UserHomePage.routeName,
    page: () => UserHomePage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: PetDetailsPage.routeName,
    page: () => PetDetailsPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: PetRegisterPage.routeName,
    page: () => PetRegisterPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: PetsPage.routeName,
    page: () => PetsPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: LossReportPage.routeName,
    page: () => LossReportPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
];
