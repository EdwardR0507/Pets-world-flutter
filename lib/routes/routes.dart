import 'package:get/get.dart';

import '../features/auth/bindings/auth_binding.dart';
import '../features/auth/presentation/pages/sign_in_page.dart';
import '../features/auth/presentation/pages/sign_up_app_page.dart';
import '../features/auth/presentation/pages/sign_up_page.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/pet/bindings/pet_binding.dart';
import '../features/pet/presentation/pages/dashboard_page.dart';
import '../features/pet/presentation/pages/my_pets_page.dart';
import '../features/pet/presentation/pages/pet_details_page.dart';
import '../features/pet/presentation/pages/pet_register_page.dart';
import '../features/pet/presentation/pages/pet_report_page.dart';
import '../features/pet/presentation/pages/pets_page.dart';
import '../mixin/auth_middleware.dart';
import 'route_names.dart';

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
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.dashboard,
    page: () => const DashboardPage(),
    binding: PetBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.myPets,
    page: () => const MyPetsPage(),
    binding: PetBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.pet,
    page: () => PetDetailsPage(),
    binding: PetBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.registerPet,
    page: () => PetRegisterPage(),
    binding: PetBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.pets,
    page: () => const PetsPage(),
    binding: PetBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
  GetPage(
    name: RouteNames.reportPet,
    page: () => PetReportPage(),
    binding: PetBinding(),
    transition: Transition.noTransition,
    middlewares: [
      AuthMiddleware(),
    ],
  ),
];
