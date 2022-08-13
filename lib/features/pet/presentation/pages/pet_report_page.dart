import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../app/components/space.dart';
import '../../../../app/components/submit_button.dart';
import '../../../../app/components/text_area_input.dart';
import '../../../../app/components/text_input.dart';
import '../../../../app/mixin/validation_mixins.dart';
import '../../../../app/routes/route_names.dart';
import '../../../../app/utils/custom_snackbar.dart';
import '../controllers/pet_report_controller.dart';

class PetReportPage extends GetView<PetReportController> with ValidationMixins {
  PetReportPage({Key? key}) : super(key: key) {
    controller.petId = Get.arguments['petId'];
    controller.reportedImg = Get.arguments['reportedImg'];
  }

  void _report() async {
    final result = await controller.reportPet();
    if (result) {
      customSnackbar('Éxito', 'Reporte exitoso', CustomSnackbarType.success);
      Get.offAllNamed(RouteNames.dashboard);
    } else {
      customSnackbar('Error', 'Reporte incorrecto', CustomSnackbarType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFFF5F5F5),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () => Get.toNamed(RouteNames.dashboard))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            addVerticalSpace(24),
            SvgPicture.asset("assets/images/logo.svg", height: 120),
            addVerticalSpace(30),
            const Text("Reportar Mascota",
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),
                textAlign: TextAlign.center),
            addVerticalSpace(30),
            const Text("Entrega una luz de esperanza a una familia",
                style: TextStyle(fontSize: 24), textAlign: TextAlign.center),
            addVerticalSpace(40),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    TextInput(
                      controller: controller.addressController,
                      hintText: "Dirección de avistamiento",
                      validator: validateAddress,
                    ),
                    addVerticalSpace(42),
                    TextAreaInput(
                      controller: controller.detailsController,
                      hintText: "Detalles del avistamiento",
                      validator: validateDetails,
                    ),
                    addVerticalSpace(42),
                    CustomSubmitButton(
                        onPressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            controller.formKey.currentState?.save();
                            _report();
                          }
                        },
                        text: "REPORTAR"),
                    addVerticalSpace(16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
