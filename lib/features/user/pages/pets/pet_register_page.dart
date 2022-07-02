import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:pets_world/components/space.dart';

import 'package:pets_world/features/user/pages/pets/pet_details_page.dart';

import 'package:pets_world/mixin/validation_mixins.dart';

import 'package:pets_world/components/date_input.dart';
import 'package:pets_world/components/text_input_icon.dart';
import 'package:pets_world/components/dropdown_input.dart';
import 'package:pets_world/components/text_area_input.dart';
import 'package:pets_world/components/image_input_icon.dart';

import 'package:image_picker/image_picker.dart';

class PetRegisterPage extends StatelessWidget with ValidationMixins {
  PetRegisterPage({Key? key}) : super(key: key);
  static const String routeName = '/register-pet';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<DropdownMenuItem<String>>? sexOptions = [
    const DropdownMenuItem(
      value: "Hembra",
      child: Text("Hembra"),
    ),
    const DropdownMenuItem(
      value: "Macho",
      child: Text("Macho"),
    ),
  ];

  final List<DropdownMenuItem<String>>? speciesOptions = [
    const DropdownMenuItem(
      value: "Perro",
      child: Text("Perro"),
    ),
    const DropdownMenuItem(
      value: "Gato",
      child: Text("Gato"),
    ),
    const DropdownMenuItem(
      value: "Loro",
      child: Text("Loro"),
    ),
  ];

  final List<DropdownMenuItem<String>>? raceOptions = [
    const DropdownMenuItem(
      value: "Beagle",
      child: Text("Beagle"),
    ),
    const DropdownMenuItem(
      value: "Labrador retriever",
      child: Text("Labrador retriever"),
    ),
    const DropdownMenuItem(
      value: "Bulldog",
      child: Text("Bulldog"),
    ),
  ];

  final List<DropdownMenuItem<String>>? sizeOptions = [
    const DropdownMenuItem(
      value: "Pequeño",
      child: Text("Pequeño"),
    ),
    const DropdownMenuItem(
      value: "Mediano",
      child: Text("Mediano"),
    ),
    const DropdownMenuItem(
      value: "Grande",
      child: Text("Grande"),
    ),
  ];

  final String sexoDefecto = 'Seleccione el sexo';
  //Controladores
  TextEditingController dateInput = TextEditingController();
  String? nombreValue = '';
  String? sexoValue = '';
  String? fechaValue = '';
  String? especieValue = '';
  String? razaValue = '';
  String? colorValue = '';

  String? tamanoValue = '';
  String? caracteristicasValue = '';

  final String imagenPath = 'assets/images/pet-profile-def.png';

  //Imagen mascota
  File? _pickedImage; //Para movil
  Uint8List webImage = Uint8List(8); //Para web

  Future<void> pickImage2() async {
    //Si es movil
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? myImage = await _picker.pickImage(source: ImageSource.gallery);
      if (myImage != null) {
        var selected = File(myImage.path);
        _pickedImage = selected;
        // setState(() {
        //   _pickedImage = selected;
        // });
      } else {
        print("Ninguna imagen fue seleccionada");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? myImage = await _picker.pickImage(source: ImageSource.gallery);
      if (myImage != null) {
        var f = await myImage.readAsBytes();
        webImage = f;
        _pickedImage = File(myImage.path);
        // setState(() {
        //   webImage = f;
        //   _pickedImage = File('a');
        // });
      } else {
        print("Ninguna imagen fue seleccionada");
      }
    } else {
      print('Algo salió mal');
    }
  }

  Widget _submitButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();

          print(nombreValue);
          print(sexoValue);
          print(fechaValue);
          print(especieValue);
          print(razaValue);
          print(colorValue);
          print(tamanoValue);
          print(caracteristicasValue);

          //La imagen web se obtiene como bytes
          //print(webImage.toString());
          Get.toNamed(PetDetailsPage.routeName);
        }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("Reportar"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Form(
              child: Column(children: [
        addVerticalSpace(25),
        const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
                "Registra una mascota para que se pueda activar su búsqueda por la comunidad.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        addVerticalSpace(15),
        const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
                "Recuerde que mientras más específica sea su descripción, más eficiente será la búsqueda.",
                style: TextStyle(fontSize: 16))),
        addVerticalSpace(15),
        Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  TextInputIcon(
                    hintText: "Nombre",
                    validator: validateNamePet,
                    onSaved: (value) {
                      nombreValue = value;
                    },
                    nameIcon: Icon(Icons.pets),
                  ),
                  addVerticalSpace(30),
                  DropDownInput(
                    hintText: "Sexo",
                    onSaved: (value) {
                      sexoValue = value;
                    },
                    nameIcon: Icon(Icons.transgender),
                    listaItems: sexOptions,
                    onChanged: (String? value) {
                      sexoValue = value;
                    },
                  ),
                  addVerticalSpace(30),
                  DateInput(
                      controller: dateInput,
                      hintText: "Fecha de nacimiento",
                      validator: validateDate,
                      keyboardType: TextInputType.datetime,
                      onSaved: (value) {
                        fechaValue = value;
                      }),
                  addVerticalSpace(30),
                  DropDownInput(
                    hintText: "Especie",
                    onSaved: (value) {
                      especieValue = value;
                    },
                    nameIcon: Icon(Icons.cookie),
                    listaItems: speciesOptions,
                    onChanged: (String? value) {
                      especieValue = value;
                    },
                  ),
                  addVerticalSpace(30),
                  DropDownInput(
                    hintText: "Raza",
                    onSaved: (value) {
                      razaValue = value;
                    },
                    nameIcon: Icon(Icons.radar),
                    listaItems: raceOptions,
                    onChanged: (String? value) {
                      razaValue = value;
                    },
                  ),
                  addVerticalSpace(30),
                  DropDownInput(
                    hintText: "Tamaño",
                    onSaved: (value) {
                      tamanoValue = value;
                    },
                    nameIcon: Icon(Icons.format_size),
                    listaItems: sizeOptions,
                    onChanged: (String? value) {
                      tamanoValue = value;
                    },
                  ),
                  addVerticalSpace(30),
                  TextAreaInput(
                    hintText: "Descripción",
                    validator: validateLastName,
                    onSaved: (value) {
                      colorValue = value;
                    },
                  ),
                  addVerticalSpace(30),
                  ImageInputIcon(
                    title: "Elegir imagen de la mascota",
                    icon: Icons.image_outlined,
                    onClicked: () => pickImage2(),
                  ),
                  addVerticalSpace(30),
                  _pickedImage == null
                      ? Image(
                          image: AssetImage(imagenPath),
                          width: 160,
                          height: 160,
                          fit: BoxFit.cover,
                        )
                      : kIsWeb
                          ? ClipOval(
                              child: Image.memory(
                                webImage,
                                fit: BoxFit.cover,
                                width: 160,
                                height: 160,
                              ),
                            )
                          : ClipOval(
                              child: Image.file(
                                _pickedImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                  addVerticalSpace(30),
                  _submitButton()
                ])))
      ]))),
    );
  }
}
