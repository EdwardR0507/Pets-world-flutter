import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/repositories/pet_repository.dart';

class CheckImageController extends GetxController {
  final IPetRepository petRepository;
  CheckImageController({required this.petRepository});

  String breed = '';
  final analizing = Rx<bool>(false);
  final match = Rx<bool>(true);
  final selectedImagePath = Rx<String>('');

  Future<bool> pickImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
    }
    return true;
  }

  Future<void> checkImage() async {
    if (selectedImagePath.value == '') {
      return;
    }
    analizing.value = true;
    analizing.refresh();
    final result = await petRepository.checkPet(selectedImagePath.value);
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
