import 'package:get/get.dart';

import '../controllers/plan_new_trip_controller.dart';

class PlanNewTripBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanNewTripController>(
      () => PlanNewTripController(),
    );
  }
}
