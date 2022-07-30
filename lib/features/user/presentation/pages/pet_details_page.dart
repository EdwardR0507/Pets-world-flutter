import "package:flutter/material.dart";
import 'package:get/get.dart';
import '../../../../components/custom_loader.dart';
import '../../../../components/space.dart';
import '../../../../routes/route_names.dart';
import '../controllers/pet_details_controller.dart';

class PetDetailsPage extends GetView<PetDetailsController> {
  PetDetailsPage({Key? key}) : super(key: key) {
    controller.id = Get.arguments['id'];
  }

  static const TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            Stack(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          AssetImage("assets/images/dog.png"),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 20.0,
                                  bottom: 0.0,
                                  child: FloatingActionButton(
                                    backgroundColor: const Color(0xff03dac6),
                                    foregroundColor: Colors.black,
                                    onPressed: () {
                                      Get.toNamed(RouteNames.reportPet,
                                          arguments: {
                                            'id': controller.id,
                                          });
                                    },
                                    child: const Icon(Icons.campaign),
                                  ),
                                ),
                              ],
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
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(20, 20, 0, 0),
                                    child: Text(controller.pet!.breed,
                                        style: textStyle)),
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
                                      'Fecha de nacimiento ${_getDate(controller.pet!.birthdate)}',
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
