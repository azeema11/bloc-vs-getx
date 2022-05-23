import 'package:get/get.dart';

import '../modules/choose_location/bindings/choose_location_binding.dart';
import '../modules/choose_location/views/choose_location_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loading/bindings/loading_binding.dart';
import '../modules/loading/views/loading_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOADING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOADING,
      page: () => LoadingView(),
      binding: LoadingBinding(),
    ),
    GetPage(
      name: _Paths.CHOOSE_LOCATION,
      page: () => ChooseLocationView(),
      binding: ChooseLocationBinding(),
    ),
  ];
}
