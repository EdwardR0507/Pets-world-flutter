import 'package:get/get.dart';
import 'package:pets_world/features/loss/controllers/loss_controller.dart';

class LossBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LossController>(() => LossController());
  }
}
