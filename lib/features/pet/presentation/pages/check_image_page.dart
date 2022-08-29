import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../app/components/space.dart';
import '../../../../app/components/submit_button.dart';
import '../../../../app/routes/route_names.dart';
import '../controllers/check_image_controller.dart';

class CheckImagePage extends GetView<CheckImageController> {
  CheckImagePage({Key? key}) : super(key: key) {
    controller.breed = Get.arguments['breed'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Seleccionar imagen', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () async {
              final result = await controller.pickImage(ImageSource.camera);
              if (result) {
                controller.checkImage();
              }
            },
          )
        ],
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: Get.height * 0.6,
              child: GestureDetector(
                onTap: () async {
                  final result = await controller.pickImage(ImageSource.gallery);
                  if (result) {
                    controller.checkImage();
                  }
                },
                child: Card(
                  child: SizedBox(
                    child: Center(
                      child: Obx(
                        () => controller.selectedImagePath.value == ''
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  const Icon(
                                    Icons.image,
                                    size: 100,
                                  ),
                                  addVerticalSpace(10),
                                  const Text(
                                    'Selecciona la foto\n de la mascota que encontraste pulsando aquí',
                                    style: TextStyle(fontSize: 20),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              )
                            : Stack(
                                children: <Widget>[
                                  Image.file(
                                    File(controller.selectedImagePath.value),
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black.withOpacity(0.5),
                                            blurRadius: 10,
                                            spreadRadius: 5,
                                          ),
                                        ],
                                      ),
                                      constraints: const BoxConstraints(maxWidth: 100, maxHeight: 100),
                                      child: Card(
                                        child: Image.network(
                                          Get.arguments['imgUrl'],
                                          color: Colors.white.withOpacity(0.8),
                                          colorBlendMode: BlendMode.modulate,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          addVerticalSpace(20),
          SizedBox(
            child: Obx(
              () => controller.selectedImagePath.value != ''
                  ? controller.analizing.value
                      ? Column(
                          children: <Widget>[
                            const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Color(0xFF6200EE)),
                            ),
                            addVerticalSpace(10),
                            const Text(
                              'Analizando...',
                              style: TextStyle(fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                      : showResults()
                  : Container(),
            ),
          )
        ],
      ),
    );
  }

  Widget showResults() => Obx(
        () => Column(
          children: [
            Text(controller.match.value ? '¡La mascota es de la misma raza!' : 'Las mascotas no son de la misma raza.',
                style: const TextStyle(fontSize: 20)),
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: controller.match.value
                  ? Column(
                      children: [
                        const Icon(
                          Icons.check,
                          color: Colors.greenAccent,
                          size: 50,
                        ),
                        addVerticalSpace(10),
                        SizedBox(
                          width: 200,
                          child: CustomSubmitButton(
                              onPressed: () {
                                Get.toNamed(RouteNames.reportPet, arguments: {
                                  'petId': Get.arguments['petId'],
                                  'reportedImg': controller.selectedImagePath.value,
                                });
                              },
                              text: 'CONTINUAR'),
                        )
                      ],
                    )
                  : const Icon(
                      Icons.close,
                      color: Colors.redAccent,
                      size: 50,
                    ),
            ),
          ],
        ),
      );
}
