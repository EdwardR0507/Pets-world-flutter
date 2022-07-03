import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:pets_world/features/user/controllers/user_controller.dart';
import 'package:pets_world/components/custom_card.dart';

class UserHomePage extends StatelessWidget {
  static const String routeName = "/home";

  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        body: SizedBox(
            child: Wrap(
          children: const [
            CustomCard(
                imagePath: "assets/images/dog.png",
                title: "Boby",
                description: "Desaparecido",
                route: "/")
          ],
        )),
      );
    });
  }
}
