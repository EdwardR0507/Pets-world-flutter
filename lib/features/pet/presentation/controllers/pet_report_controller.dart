import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app/utils/enums.dart';

class PetReportController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameController,
      addressController,
      detailsController;
  List<int>? selectedFile;
  final bytesData = Rx<Uint8List?>(null);
  final loading = Rx(LoadingState.initial);

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

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    addressController = TextEditingController();
    detailsController = TextEditingController();
  }

  @override
  void onClose() {
    nameController.dispose();
    addressController.dispose();
    detailsController.dispose();
    super.onClose();
  }
}
