import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:pets_world/components/loading_widget.dart';
import 'package:pets_world/routes/route_names.dart';
import 'package:pets_world/utils/base_url.dart';
import 'package:pets_world/utils/custom_snackbar.dart';

class PetRegisterController extends GetxController {
  final token = GetStorage().read('token');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateInputController;

  final String imagePath = 'assets/images/pet-profile-def.png';

  File? pickedImage; // Para movil
  Uint8List webImage = Uint8List(8); //Para web

  List<String> sexOptions = ['Macho', 'Hembra'];
  List<String> raceOptions = ['Beagle', 'Labrador retriever', 'Bulldog'];
  List<String> sizeOptions = ['Pequeño', 'Mediano', 'Grande'];

  RxMap<String, String?> selectOptions = RxMap(<String, String?>{
    'sexOptions': null,
    'speciesOptions': null,
    'raceOptions': null,
    'sizeOptions': null,
  });

  void onChangeSelectOptions(String option, String? value) {
    selectOptions.update(option, (_) => value);
  }

  Future<void> pickImage2() async {
    //Si es movil
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? myImage = await picker.pickImage(source: ImageSource.gallery);
      if (myImage != null) {
        var selected = File(myImage.path);
        pickedImage = selected;
        // setState(() {
        //   _pickedImage = selected;
        // });
      } else {
        print("Ninguna imagen fue seleccionada");
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? myImage = await picker.pickImage(source: ImageSource.gallery);
      if (myImage != null) {
        var f = await myImage.readAsBytes();
        webImage = f;
        pickedImage = File(myImage.path);
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

  void signIn() {
    Get.showOverlay(
        asyncFunction: () => _registerPet(), loadingWidget: const Loading());
  }

  Future _registerPet() async {
    try {
      var url = Uri.parse('${baseUrl}pet/register');
      var response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(
            <String, String>{
              "name": "Fido",
              "gender": "Macho",
              "color": "Marrón",
              "breed": "Pequines",
              "characteristics": "marrón pequeño",
              "size": "Pequeño",
              "owner_id": "62b7b8c227f461a009d66523",
              "birthdate": "25-06-2020"
            },
          ));
      var res = json.decode(response.body);
      if (response.statusCode == 200) {
        Get.offAllNamed(RouteNames.dashboard);
        customSnackbar(
            'Registro exitoso',
            'Se ha registrado el perro correctamente',
            CustomSnackbarType.success);
      } else {
        customSnackbar('Error', res['msg'], CustomSnackbarType.error);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();
    dateInputController = TextEditingController();
  }

  @override
  void onClose() {
    dateInputController.dispose();
    super.onClose();
  }
}
