import 'package:get/get.dart';
import 'package:pets_world/features/auth/bindings/auth_binding.dart';
import 'package:pets_world/features/auth/pages/sign_in_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_app_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_page.dart';
import 'package:pets_world/features/home/bindings/home_binding.dart';
import 'package:pets_world/features/home/home_page.dart';
import 'package:pets_world/features/loss/bindings/loss_binding.dart';
import 'package:pets_world/features/loss/pages/loss_report_pet_page.dart';
import 'package:pets_world/features/user/bindings/user_binding.dart';
import 'package:pets_world/features/user/pages/dashboard_page.dart';
import 'package:pets_world/features/user/pages/pet_details_page.dart';
import 'package:pets_world/features/user/pages/pet_register_page.dart';
import 'package:pets_world/features/user/pages/user_home.dart';
import 'package:pets_world/features/user/pages/pets_page.dart';
import 'package:pets_world/mixin/auth_middleware.dart';
import 'package:pets_world/routes/route_names.dart';

const initialRoute = RouteNames.landing;

List<GetPage> pages = [
  GetPage(
    name: RouteNames.signUp,
    page: () => SignUpPage(),
    binding: AuthBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.signUpApp,
    page: () => SignUpAppPage(),
    binding: AuthBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.signIn,
    page: () => SignInPage(),
    binding: AuthBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.landing,
    page: () => const HomePage(),
    binding: HomeBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.dashboard,
    page: () => const DashboardPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.userHome,
    page: () => const UserHomePage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.pet,
    page: () => PetDetailsPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.registerPet,
    page: () => PetRegisterPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.pets,
    page: () => const PetsPage(),
    binding: UserBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.reportPet,
    page: () => LossReportPage(),
    binding: LossBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
];
