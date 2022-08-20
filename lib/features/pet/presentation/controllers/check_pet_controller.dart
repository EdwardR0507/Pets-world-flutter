import 'package:get/get.dart';

import '../../domain/entities/report.dart';
import '../../domain/exceptions/pet_exception.dart';
import '../../domain/repositories/pet_repository.dart';

class CheckPetController extends GetxController {
  final IPetRepository petRepository;
  String id = '';
  RxBool loading = false.obs;
  Report? report;

  CheckPetController({required this.petRepository});

  void getReport() async {
    try {
      loading.value = true;
      report = await petRepository.getReport(id);
      loading.value = false;
    } on PetException catch (_) {
      loading.value = false;
    }
  }

  Future<bool> deleteReport(String idReport) async {
    try {
      loading.value = true;
      final msg = await petRepository.deleteReportedPet(idReport);
      return true;
    } on PetException catch (_) {
      loading.value = false;
      return false;
    }
  }

  @override
  void onReady() {
    super.onReady();
    getReport();
  }
}
