import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/world_time_service.dart';

class LoadingController extends GetxController {

  final WorldTimeService _worldTimeService = Get.find<WorldTimeService>();
  
  void setupWorldTime() async {
    await _worldTimeService.getTime();
    Get.offNamed(
      Routes.HOME,
    );
  }

  @override
  void onInit() async {
    super.onInit();
    setupWorldTime();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
