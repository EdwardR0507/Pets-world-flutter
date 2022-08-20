import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../../../app/routes/route_names.dart';

import '../../../../app/components/custom_card.dart';
import '../../../../app/components/custom_loader.dart';
import '../controllers/pet_reported_controller.dart';

class PetsReportedPage extends GetView<PetReportedController> {
  const PetsReportedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SingleChildScrollView(
            controller: ScrollController(),
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
                                        onTap: () => Get.toNamed(
                                                RouteNames.checkPet,
                                                arguments: {
                                                  'id': pet.id,
                                                  'pet_owner': pet.ownerName,
                                                  'pet_name': pet.name,
                                                  'pet_breed': pet.breed,
                                                  'pet_date': pet.registeredAt,
                                                }));
                                  }),
                                ],
                              )
                            : SizedBox(
                                height: Get.height * 0.8,
                                child: const Center(
                                  child: Text(
                                    "No tienes mascotas reportadas",
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
