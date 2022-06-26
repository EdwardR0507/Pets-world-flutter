import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:pets_world/components/bottom_navigation.dart';
import 'package:pets_world/components/custom_card.dart';
import 'package:pets_world/components/space.dart';
import 'package:pets_world/components/text_input.dart';

import 'package:pets_world/src/mixins/validation_mixins.dart';

//Nuevos: Rafa
import 'package:pets_world/components/date_input.dart';
import 'package:pets_world/components/text_input_icon.dart';
import 'package:pets_world/components/dropdown_input.dart';
import 'package:pets_world/components/text_area_input.dart';
import 'package:pets_world/components/image_input_icon.dart';

import 'package:image_picker/image_picker.dart';

class PetRegisterPage extends StatefulWidget {
  static const String routeName = '/register-pet';

  const PetRegisterPage({Key? key}) : super(key: key);
  @override
  _PetRegisterPageState createState() => _PetRegisterPageState();
}

class _PetRegisterPageState extends State<PetRegisterPage>
    with ValidationMixins {
  int _selectedIndex = 0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List<DropdownMenuItem<String>>? listaSexo = [
    DropdownMenuItem(
      child: Text("Hembra"),
      value: "Hembra",
    ),
    DropdownMenuItem(
      child: Text("Macho"),
      value: "Macho",
    ),
  ];

  final List<DropdownMenuItem<String>>? listaEspecie = [
    DropdownMenuItem(
      child: Text("Perro"),
      value: "Perro",
    ),
    DropdownMenuItem(
      child: Text("Gato"),
      value: "Gato",
    ),
    DropdownMenuItem(
      child: Text("Loro"),
      value: "Loro",
    ),
  ];

  final List<DropdownMenuItem<String>>? listaRazaPerro = [
    DropdownMenuItem(
      child: Text("Beagle"),
      value: "Beagle",
    ),
    DropdownMenuItem(
      child: Text("Labrador retriever"),
      value: "Labrador retriever",
    ),
    DropdownMenuItem(
      child: Text("Bulldog"),
      value: "Bulldog",
    ),
  ];

  final List<DropdownMenuItem<String>>? listaTamano = [
    DropdownMenuItem(
      child: Text("Pequeño"),
      value: "Pequeño",
    ),
    DropdownMenuItem(
      child: Text("Mediano"),
      value: "Mediano",
    ),
    DropdownMenuItem(
      child: Text("Grande"),
      value: "Grande",
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
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print("Ninguna imagen fue seleccionada");
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? myImage = await _picker.pickImage(source: ImageSource.gallery);
      if (myImage != null) {
        var f = await myImage.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print("Ninguna imagen fue seleccionada");
      }
    } else {
      print('Algo salió mal');
    }
  }

  //Para toda la screen
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Drawer getDrawer(BuildContext context) {
    DrawerHeader header = const DrawerHeader(child: Text("Settings"));

    AboutListTile about = const AboutListTile(
        applicationIcon: Icon(Icons.favorite),
        icon: Icon(Icons.info),
        child: Text("Acerca de PetsWorld"));

    ListTile getItem(Icon icon, String descripcion, String route) {
      return ListTile(
        leading: icon,
        title: Text(descripcion),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      );
    }

    ListView getList() {
      return ListView(
        children: [header, getItem(const Icon(Icons.home), "Home", "/"), about],
      );
    }

    return Drawer(child: getList());
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

          Navigator.pushNamed(context, "/sign-up-app");
        }
      },
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFF6200EE),
          fixedSize: const Size(350, 36),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
      child: const Text("SIGUIENTE"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Registrar Mascota",
            style: TextStyle(color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              // openSearchPage(context);
            },
          ),
        ],
      ),
      drawer: getDrawer(context),
      body: SingleChildScrollView(
          child: Form(
              child: Column(children: [
        addVerticalSpace(25),
        Padding(
            padding: const EdgeInsets.all(15),
            child: const Text(
                "Registra una mascota para que se pueda activar su búsqueda por la comunidad.",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
        addVerticalSpace(15),
        Padding(
            padding: const EdgeInsets.all(15),
            child: const Text(
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
                    listaItems: listaSexo,
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
                    listaItems: listaEspecie,
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
                    listaItems: listaRazaPerro,
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
                    listaItems: listaTamano,
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
