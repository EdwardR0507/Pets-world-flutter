import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/components/custom_card.dart';
import 'package:pets_world/features/user/controllers/pets_controller.dart';
import 'package:pets_world/features/user/pages/pets/pet_register_page.dart';

class PetsPage extends StatelessWidget {
  static const String routeName = '/pets';
  const PetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PetsController>(builder: (controller) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: "pets",
          backgroundColor: const Color(0xff03dac6),
          foregroundColor: Colors.black,
          onPressed: () {
            Get.toNamed(PetRegisterPage.routeName);
          },
          child: const Icon(Icons.add),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              child: Wrap(
            children: const [
              CustomCard(
                  imagePath: "assets/images/dog.png",
                  title: "Boby",
                  description: "Registrado",
                  route: "/"),
              CustomCard(
                  imagePath: "assets/images/dog.png",
                  title: "Rush",
                  description: "Registrado",
                  route: "/"),
              CustomCard(
                  imagePath: "assets/images/dog.png",
                  title: "Tribilín",
                  description: "Registrado",
                  route: "/"),
            ],
          )),
        ),
      );
    });
  }
}
