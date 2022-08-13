import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../../../app/components/custom_loader.dart';
import '../../../../app/components/space.dart';
import '../../../../app/routes/route_names.dart';
import '../../../../app/utils/custom_snackbar.dart';
import '../controllers/pet_details_controller.dart';

class PetDetailsPage extends GetView<PetDetailsController> {
  PetDetailsPage({Key? key}) : super(key: key) {
    controller.id = Get.arguments['id'];
  }
  void _deletePet() async {
    final result = await controller.deletePet();
    if (result) {
      Get.offAllNamed(RouteNames.dashboard);
    } else {
      customSnackbar(
          'Error', 'No se pudo eliminar la mascota', CustomSnackbarType.error);
    }
  }

  static const TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () => Get.offAllNamed(RouteNames.dashboard))),
      backgroundColor: const Color(0xFFF5F5F5),
      body: Obx(
        () => SingleChildScrollView(
          child: controller.loading.value == true
              ? const CustomLoader()
              : SizedBox(
                  child: controller.pet == null
                      ? Container()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 240,
                              child: Stack(
                                children: [
                                  Container(
                                    height: 220,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            controller.pet!.imgUrl),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: Get.arguments['ownerId'] !=
                                        controller.pet!.ownerId,
                                    child: Positioned(
                                      right: 20.0,
                                      bottom: 0.0,
                                      child: FloatingActionButton(
                                        backgroundColor:
                                            const Color(0xff03dac6),
                                        foregroundColor: Colors.black,
                                        onPressed: () {
                                          Get.toNamed(RouteNames.checkImage,
                                              arguments: {
                                                'petId': controller.id,
                                                'imgUrl':
                                                    controller.pet!.imgUrl,
                                              });
                                        },
                                        child: const Icon(Icons.campaign),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: Get.arguments['ownerId'] ==
                                        controller.pet!.ownerId,
                                    child: Positioned(
                                      right: 20.0,
                                      bottom: 0.0,
                                      child: FloatingActionButton(
                                        backgroundColor: Colors.red,
                                        foregroundColor: Colors.black,
                                        onPressed: () => _deletePet(),
                                        child: const Icon(Icons.delete),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            addVerticalSpace(15),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                child: Text(controller.pet!.name,
                                    style: const TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold))),
                            addVerticalSpace(10),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                                    child: Icon(
                                      Icons.person,
                                      size: 35.0,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 25, 0, 0),
                                    child: Text(controller.pet!.ownerName,
                                        style: textStyle)),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                                    child: Icon(
                                      Icons.transgender,
                                      size: 35.0,
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 15, 0, 0),
                                        child: Text(controller.pet!.breed,
                                            style: textStyle)),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 0, 0),
                                      child: Text(
                                          'Reportado el ${_getDate(controller.pet!.registeredAt)}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Divider(
                                height: 20,
                                thickness: 0.1,
                                indent: 20,
                                endIndent: 0,
                                color: Colors.black,
                              ),
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                                    child: Icon(
                                      Icons.calendar_month,
                                      size: 35.0,
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                  child: Text(
                                      'Fecha de nacimiento: ${_getDate(controller.pet!.birthdate)}',
                                      style: textStyle),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                                    child: Icon(
                                      Icons.palette,
                                      size: 35.0,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                    child: Text(controller.pet!.color,
                                        style: textStyle)),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                                    child: Icon(
                                      Icons.square_foot,
                                      size: 35.0,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                    child: Text(controller.pet!.size,
                                        style: textStyle)),
                              ],
                            ),
                            const Divider(
                              height: 20,
                              thickness: 0.1,
                              indent: 20,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                                child: Text('Características',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Text(controller.pet!.characteristics,
                                    style: textStyle)),
                            addVerticalSpace(20)
                          ],
                        ),
                ),
        ),
      ),
    );
  }
}

String _getDate(String date) {
  var d = date.split(',');
  var dateSplitted = d[1].split(' ');
  var dateFormated = '${dateSplitted[1]} ${dateSplitted[2]} ${dateSplitted[3]}';
  return dateFormated;
}
