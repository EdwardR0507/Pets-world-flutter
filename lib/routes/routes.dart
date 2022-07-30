import 'package:get/get.dart';
import '../features/loss/presentation/pages/loss_report_pet_page.dart';
import '../features/user/presentation/pages/dashboard_page.dart';
import '../features/user/presentation/pages/pet_details_page.dart';
import '../features/user/presentation/pages/pet_register_page.dart';
import '../features/user/presentation/pages/pets_page.dart';
import '../features/user/presentation/pages/user_home.dart';
import '../features/auth/bindings/auth_binding.dart';
import '../features/auth/presentation/pages/sign_in_page.dart';
import '../features/auth/presentation/pages/sign_up_app_page.dart';
import '../features/auth/presentation/pages/sign_up_page.dart';
import '../features/home/bindings/home_binding.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/loss/bindings/loss_binding.dart';
import '../features/user/bindings/user_binding.dart';
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
