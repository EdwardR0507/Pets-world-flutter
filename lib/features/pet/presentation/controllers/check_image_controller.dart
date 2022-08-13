import 'dart:convert';
import 'dart:html' as html;
import 'dart:typed_data';

import 'package:get/get.dart';

class CheckImageController extends GetxController {
  final bytesData = Rx<Uint8List?>(null);
  final analizing = Rx<bool>(false);
  final match = Rx<bool>(true);

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
        bytesData.refresh();
      });
      reader.readAsDataUrl(file);
    });
  }
}
