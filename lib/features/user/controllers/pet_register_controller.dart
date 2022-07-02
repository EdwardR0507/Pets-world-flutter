import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PetRegisterController extends GetxController {
  late TextEditingController dateInputController;

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
