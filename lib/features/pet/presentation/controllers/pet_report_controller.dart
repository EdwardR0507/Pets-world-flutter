import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../app/utils/enums.dart';
import '../../../auth/domain/repositories/local_storage_repository.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';
import '../../domain/request/report_pet_request.dart';

class PetReportController extends GetxController {
  final ILocalStorageRepository localStorageRepository;
  final IPetRepository petRepository;

  PetReportController(
      {required this.localStorageRepository, required this.petRepository});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController addressController, detailsController;
  final loading = Rx(LoadingState.initial);
  String petId = '';
  Uint8List reportedImg = Uint8List(0);

  Future<bool> reportPet() async {
    try {
      loading.value = LoadingState.loading;
      final userId = localStorageRepository.getUserId();
      final res = await petRepository.reportPet(ReportPetRequest(
          reporterId: userId,
          petId: petId,
          address: addressController.text,
          details: detailsController.text,
          reportedImg: reportedImg));
      print(res);
      return true;
    } on PetException catch (_) {
      loading.value = LoadingState.initial;
      return false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    addressController = TextEditingController();
    detailsController = TextEditingController();
  }

  @override
  void onClose() {
    addressController.dispose();
    detailsController.dispose();
    super.onClose();
  }
}
