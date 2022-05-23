import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/images.dart';
import '../../../models/world_time.dart';
import '../../../routes/app_pages.dart';
import '../../../services/world_time_service.dart';

class HomeController extends GetxController {
  late WorldTime data;
  late RxString bgImage;
  late Rx<Color?> bgColor;
  late RxString time;
  final WorldTimeService _worldTimeService = Get.find<WorldTimeService>();

  @override
  void onInit() {
    super.onInit();
    data = _worldTimeService.getWorldTimeInstance.value;

    // set background image
    bgImage = RxString(
      data.isDaytime ? Images.dayImage : Images.nightImage,
    );
    bgColor = Rx<Color?>(
      data.isDaytime ? Colors.blue : Colors.indigo[700],
    );
    time = RxString(data.time);
  }

  void onTapEditLocation() async {
    await Get.toNamed(Routes.CHOOSE_LOCATION);
    if (data != _worldTimeService.getWorldTimeInstance.value) {
      data = _worldTimeService.getWorldTimeInstance.value;
      bgImage.value = data.isDaytime ? Images.dayImage : Images.nightImage;
      bgColor.value = data.isDaytime ? Colors.blue : Colors.indigo[700];
      time.value = data.time;
    }
  }

  @override
  void onReady() {}

  @override
  void onClose() {}
}
