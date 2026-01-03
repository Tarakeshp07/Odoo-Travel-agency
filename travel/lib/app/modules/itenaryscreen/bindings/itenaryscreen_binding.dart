import 'package:get/get.dart';

import '../controllers/itenaryscreen_controller.dart';

class ItenaryscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItenaryscreenController>(
      () => ItenaryscreenController(),
    );
  }
}
