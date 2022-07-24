import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pets_world/components/custom_card.dart';
import 'package:pets_world/components/custom_loader.dart';
import 'package:pets_world/features/user/controllers/pets_controller.dart';
import 'package:pets_world/routes/route_names.dart';

class PetsPage extends GetView<PetsController> {
  const PetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
            child: controller.loading.value == true
                ? const CustomLoader()
                : SizedBox(
                    child: controller.pets == null
                        ? Container()
                        : Wrap(
                            children: [
                              ...controller.pets!.map((pet) {
                                return CustomCard(
                                    imagePath: "assets/images/dog.png",
                                    title: pet.name,
                                    description: pet.characteristics,
                                    onTap: () {
                                      Get.toNamed(RouteNames.pet, arguments: {
                                        'id': pet.id,
                                      });
                                    });
                              }),
                            ],
                          )),
          )),
    );
  }
}
