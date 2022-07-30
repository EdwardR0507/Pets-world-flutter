import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../../../components/custom_card.dart';
import '../controllers/user_controller.dart';

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
