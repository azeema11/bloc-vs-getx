import 'package:get/get.dart';

import '../controllers/choose_location_controller.dart';

class ChooseLocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseLocationController>(
      () => ChooseLocationController(),
    );
  }
}
