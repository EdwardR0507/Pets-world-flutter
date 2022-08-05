import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/utils/enums.dart';
import '../../../auth/domain/repositories/local_storage_repository.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';
import '../../domain/request/register_pet_request.dart';

class PetRegisterController extends GetxController {
  final IPetRepository petRepository;
  final ILocalStorageRepository localStorageRepository;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController dateInputController;
  late TextEditingController nameInputController;
  late TextEditingController descriptionInputController;
  late TextEditingController colorInputController;

  PetRegisterController(
      {required this.localStorageRepository, required this.petRepository});

  final String imagePath = 'assets/images/pet-profile-def.png';

  List<int>? selectedFile;
  final bytesData = Rx<Uint8List?>(null);
  final register = Rx(LoadingState.initial);

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

  Future<void> pickImage() async {
    html.FileUploadInputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final files = uploadInput.files;
      final file = files![0];
      final reader = html.FileReader();

      reader.onLoadEnd.listen((event) {
        bytesData.value = const Base64Decoder()
            .convert(reader.result.toString().split(",").last);
        selectedFile = bytesData.value;
        bytesData.refresh();
      });
      reader.readAsDataUrl(file);
    });
  }

  Future<bool> registerPet() async {
    try {
      register.value = LoadingState.loading;
      final userId = localStorageRepository.getUserId();
      await petRepository.registerPet(RegisterPetRequest(
          name: nameInputController.text,
          gender: selectOptions['sexOptions']!,
          breed: selectOptions['raceOptions']!,
          color: colorInputController.text,
          size: selectOptions['sizeOptions']!,
          userId: userId,
          birthdate: dateInputController.text,
          characteristics: descriptionInputController.text,
          img: selectedFile!));
      return true;
    } on PetException catch (_) {
      register.value = LoadingState.initial;
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    dateInputController = TextEditingController();
    nameInputController = TextEditingController();
    colorInputController = TextEditingController();
    descriptionInputController = TextEditingController();
  }

  @override
  void onClose() {
    dateInputController.dispose();
    nameInputController.dispose();
    colorInputController.dispose();
    descriptionInputController.dispose();
    super.onClose();
  }
}
