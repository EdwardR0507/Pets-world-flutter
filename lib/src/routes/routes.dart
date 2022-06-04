import 'package:flutter/material.dart';
import 'package:pets_world/src/screens/home.dart';
import 'package:pets_world/src/screens/landing.dart';
import 'package:pets_world/src/screens/login.dart';
import 'package:pets_world/src/screens/shelter.dart';
import 'package:pets_world/src/screens/sign_up.dart';
import 'package:pets_world/src/screens/sign_up_app.dart';


const initialRoute= "/landing";

final Map<String, WidgetBuilder> routes = {
  '/landing': (context) => const Landing(),
  '/sign-up': (context) => const SignUp(),
  '/sign-up-app': (context) => const SignUpApp(),
  '/login': (context) => const Login(),
  '/': (context) => const Home(),
  '/shelter': (context) => const Shelter()
};
