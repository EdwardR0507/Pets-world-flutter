import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:pets_world/app/components/custom_card.dart';
import 'package:pets_world/app/components/custom_loader.dart';
import 'package:pets_world/app/routes/route_names.dart';

import '../controllers/my_pets_controller.dart';

class MyPetsPage extends GetView<MyPetsController> {
  const MyPetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
            child: controller.loading.value == true
                ? const CustomLoader()
                : SizedBox(
                    child: controller.pets == null
                        ? Container()
                        : controller.pets!.isNotEmpty
                            ? Wrap(
                                children: [
                                  ...controller.pets!.map((pet) {
                                    return CustomCard(
                                        image: pet.imgUrl,
                                        title: pet.name,
                                        description: pet.characteristics,
                                        onTap: () => Get.toNamed(RouteNames.pet,
                                                arguments: {
                                                  'id': pet.id,
                                                  'ownerId': controller.userId,
                                                }));
                                  }),
                                ],
                              )
                            : SizedBox(
                                height: Get.height * 0.8,
                                child: const Center(
                                  child: Text(
                                    "No tienes mascotas registradas",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )),
          )),
    );
  }
}
