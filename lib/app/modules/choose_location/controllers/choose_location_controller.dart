import 'package:get/get.dart';

import '../../../models/world_time.dart';
import '../../../services/world_time_service.dart';
import '../../../utils/utils.dart';

class ChooseLocationController extends GetxController {
  late List<WorldTime> locations;
  final WorldTimeService _worldTimeService = Get.find<WorldTimeService>();

  void updateTime(index) async {
    _worldTimeService.setWorldTimeInstance = locations[index];
    await _worldTimeService.getTime();
    Get.back();
  }

  @override
  void onInit() {
    super.onInit();
    locations = Utils.generateTimeZones();
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
