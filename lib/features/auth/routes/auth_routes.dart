import 'package:flutter/cupertino.dart';
import 'package:pets_world/features/auth/pages/sign_in_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_page.dart';
import 'package:pets_world/features/auth/pages/sign_up_app_page.dart';

class AuthRoutes {
  static Map<String, WidgetBuilder> get routes => {
        SignInPage.routeName: (_) => const SignInPage(),
        SignUpPage.routeName: (_) => const SignUpPage(),
        SignUpAppPage.routeName: (_) => const SignUpAppPage()
      };
}
