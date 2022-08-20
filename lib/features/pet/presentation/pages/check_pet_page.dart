import "package:flutter/material.dart";
import 'package:get/get.dart';

import '../../../../app/components/custom_loader.dart';
import '../../../../app/components/space.dart';
import '../../../../app/routes/route_names.dart';
import '../../../../app/utils/custom_snackbar.dart';
import '../controllers/check_pet_controller.dart';

class CheckPetPage extends GetView<CheckPetController> {
  CheckPetPage({Key? key}) : super(key: key) {
    controller.id = Get.arguments['id'];
  }
  void _deletePet() async {
    final result = await controller.deleteReport(controller.report!.id);
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
                  child: controller.report == null
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
                                            controller.report!.reportedImgUrl),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 20.0,
                                    bottom: 0.0,
                                    child: FloatingActionButton(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.black,
                                      onPressed: () => Get.dialog(
                                        AlertDialog(
                                          title: const Text('¿Es tu mascota?'),
                                          content: const Text(
                                              '¿Estás seguro de que la mascota que encontraron se parece a la tuya?'),
                                          actions: [
                                            SizedBox(
                                              width: Get.width * 0.2,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: Colors.black),
                                                child: const Text('No'),
                                                onPressed: () {
                                                  _deletePet();
                                                  Get.back();
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.2,
                                              child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    primary: const Color(
                                                        0xFF6200EE)),
                                                child: const Text('Sí'),
                                                onPressed: () {
                                                  Get.back();
                                                  Get.dialog(
                                                    const AlertDialog(
                                                      title:
                                                          Text('¡Felicidades!'),
                                                      content: Text(
                                                          'Has encontrado a tu mascota'),
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      child: const Icon(
                                        Icons.question_mark,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                child: Text(Get.arguments['pet_name'],
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
                                    child: Text(Get.arguments['pet_owner'],
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
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            20, 15, 0, 0),
                                        child: Text(Get.arguments['pet_breed'],
                                            style: textStyle)),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 5, 0, 0),
                                      child: Text(
                                          'Reportado el ${_getDate(Get.arguments['pet_date'])}',
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.grey)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Divider(
                              height: 20,
                              thickness: 0.1,
                              indent: 20,
                              endIndent: 0,
                              color: Colors.black,
                            ),
                            Row(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                                    child: Icon(
                                      Icons.map,
                                      size: 35.0,
                                    )),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 25, 0, 0),
                                    child: Text(controller.report!.address,
                                        style: textStyle)),
                              ],
                            ),
                            const Padding(
                                padding: EdgeInsets.fromLTRB(30, 15, 0, 0),
                                child: Text('Detalles del avistamiento',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold))),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 20, 0, 0),
                                child: Text(controller.report!.description,
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
