import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:pets_world/features/user/controllers/user_controller.dart';
import 'package:pets_world/components/custom_card.dart';
import 'package:pets_world/routes/route_names.dart';

class UserHomePage extends GetView<UserController> {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          child: Wrap(children: [
        CustomCard(
          imagePath: "assets/images/dog.png",
          title: "Boby",
          description: "Desaparecido",
          onTap: () {
            Get.toNamed('/');
          },
        ),
      ])),
    );
  }
}
