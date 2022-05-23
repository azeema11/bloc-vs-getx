import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/constants/config.dart';
import 'app/routes/app_pages.dart';
import 'app/services/world_time_service.dart';

void main() {
  Get.put<WorldTimeService>(
    WorldTimeService(),
  );
  runApp(
    GetMaterialApp(
      title: Config.appName,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
