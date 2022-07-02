import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:pets_world/components/space.dart';
import 'package:pets_world/features/loss/controllers/loss_controller.dart';
import 'package:pets_world/components/text_input.dart';
import 'package:pets_world/mixin/validation_mixins.dart';

class LossReportPage extends GetView<LossController> with ValidationMixins {
  static const String routeName = '/report-pet';
  LossReportPage({Key? key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();
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
                  key: _formKey,
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
