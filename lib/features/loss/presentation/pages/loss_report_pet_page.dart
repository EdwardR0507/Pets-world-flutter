import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/space.dart';
import '../../../../components/text_input.dart';
import '../../../../mixin/validation_mixins.dart';
import '../controllers/loss_controller.dart';

class LossReportPage extends GetView<LossController> with ValidationMixins {
  LossReportPage({Key? key}) : super(key: key);

  FilePickerResult? result;
  final String imageName = '';
  final bool isLoadingImage = false;
  final TextEditingController _imageController = TextEditingController();

  // void pickFile() async {
  //   try {
  //     setState(() {
  //       isLoadingImage = true;
  //     });

  //     result = await FilePicker.platform
  //         .pickFiles(type: FileType.image, allowMultiple: false);

  //     if (result != null) {
  //       imageName = result!.files.first.name;
  //     }

  //     setState(() {
  //       isLoadingImage = false;
  //     });
  //   } catch (e) {
  //     print(e);
  //   }
  // }

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
        body: SingleChildScrollView(
      child: Column(
        children: [
          addVerticalSpace(60),
          Image.asset("assets/images/logo.png"),
          addVerticalSpace(35),
          const Text("Reportar Mascota",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 40),
              textAlign: TextAlign.center),
          addVerticalSpace(32),
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
                      //FIXME: CREATE VALIDATOR
                      validator: validateName,
                    ),
                    addVerticalSpace(64),
                    TextInput(
                      hintText: "Dirección de avistamiento",
                      //FIXME: CREATE VALIDATOR
                      validator: validateAddress,
                    ),
                    addVerticalSpace(64),
                    TextInput(
                      hintText: "Detalles de avistamiento",
                      //FIXME: CREATE VALIDATOR
                      validator: validateDeatils,
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
                    _submitButton()
                  ])))
        ],
      ),
    ));
  }
}
