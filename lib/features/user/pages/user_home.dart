import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pets_world/features/auth/pages/sign_in_page.dart';
import 'package:pets_world/features/loss/pages/loss_report_pet_page.dart';
import 'package:pets_world/features/user/controllers/user_controller.dart';
import 'package:pets_world/src/search/search_delegate.dart';
import 'package:pets_world/components/custom_card.dart';

class UserHomePage extends StatelessWidget {
  static const String routeName = "/home";

  const UserHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "home",
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            Get.toNamed(LossReportPage.routeName);
          },
          child: const Icon(Icons.add),
        ),
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
