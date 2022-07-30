import 'package:get/get.dart';

import '../presentation/controllers/loss_controller.dart';

class LossBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LossController>(() => LossController());
  }
}
