import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/repositories/pet_repository.dart';

class PetRegisterController extends GetxController {
  final IPetRepository petRepository;

  final token = GetStorage().read('token');
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateInputController;

  PetRegisterController({required this.petRepository});

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

  // void registerPet() {
  //   Get.showOverlay(
  //       asyncFunction: () => petRepository.registerPet(),
  //       loadingWidget: const Loading());
  // }

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
