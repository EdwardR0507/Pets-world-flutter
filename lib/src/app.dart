import 'package:flutter/material.dart';
import 'package:pets_world/src/screens/home.dart';
import 'package:pets_world/src/screens/landing.dart';
import 'package:pets_world/src/screens/login.dart';
import 'package:pets_world/src/screens/signup.dart';
import 'package:pets_world/src/screens/signup_app.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/landing',
      routes: {
        '/landing':(context) => const Landing(),
        '/signup': (context) => const SignUp(),
        '/signupapp':(context) => const SignUpApp(),
        '/login': (context) => const Login(),
        '/':(context) => const Home(),
      },
    );
  }
}
