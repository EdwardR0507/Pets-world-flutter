import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../routes/route_names.dart';

import '../../../../components/space.dart';
import '../../../../components/text_input.dart';
import '../../../../mixin/validation_mixins.dart';
import '../controllers/pet_report_controller.dart';

class PetReportPage extends GetView<PetReportController> with ValidationMixins {
  PetReportPage({Key? key}) : super(key: key);

  final String imageName = '';
  final bool isLoadingImage = false;
  final TextEditingController _imageController = TextEditingController();

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (controller.formKey.currentState!.validate()) {
          controller.formKey.currentState?.save();
          // Navigator.pushNamed(context, "/");
        }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("REPORTAR"),
    );
  }

  @override
  Widget build(BuildContext context) {
    _imageController.text = imageName;
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
                      child: Column(children: [
                        TextInput(
                          hintText: "Tus nombres",
                          validator: validateName,
                        ),
                        addVerticalSpace(64),
                        TextInput(
                          hintText: "Dirección de avistamiento",
                          validator: validateAddress,
                        ),
                        addVerticalSpace(64),
                        TextInput(
                          hintText: "Detalles de avistamiento",
                          validator: validateDetails,
                        ),
                        addVerticalSpace(64),
                        TextFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Subir imagen",
                              prefixIcon: Icon(Icons.image)),
                          readOnly: true,
                          //onTap: pickFile,
                          controller: _imageController,
                        ),
                        addVerticalSpace(46),
                        _submitButton(),
                        addVerticalSpace(23),
                      ])))
            ],
          ),
        ));
  }
}
