import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:get/get.dart';

import '../../domain/repositories/pet_repository.dart';

class CheckImageController extends GetxController {
  final IPetRepository petRepository;
  CheckImageController({required this.petRepository});

  String breed = '';
  final bytesData = Rx<Uint8List?>(null);
  final analizing = Rx<bool>(false);
  final match = Rx<bool>(true);

  Future<bool> pickImage() async {
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
        bytesData.refresh();
      });
      reader.readAsDataUrl(file);
    });

    bytesData.listen((p0) {
      analizing.value = true;
      analizing.refresh();
      checkImage().then((value) {
        analizing.value = false;
        analizing.refresh();
      });
    });
    return true;
  }

  Future<void> checkImage() async {
    if (bytesData.value == null) {
      return;
    }
    analizing.value = true;
    analizing.refresh();
    final result = await petRepository.checkPet(bytesData.value);
    analizing.value = false;
    analizing.refresh();
    if (result == breed.toLowerCase()) {
      match.value = true;
      match.refresh();
    } else {
      match.value = false;
      match.refresh();
    }
  }
}
