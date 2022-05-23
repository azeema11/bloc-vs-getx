import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../constants/config.dart';
import '../constants/errors.dart';
import '../constants/strings.dart';
import '../models/world_time.dart';
import '../utils/utils.dart';

class WorldTimeService extends GetxService {
  Rx<WorldTime> _worldTimeInstance =
      Rx<WorldTime>(Utils.generateTimeZones()[2]);
  Rx<WorldTime> get getWorldTimeInstance => _worldTimeInstance;
  set setWorldTimeInstance(WorldTime value) => _worldTimeInstance.value = value;

  Future<void> getTime() async {
    try {
      // make the request
      Response response = await get(
        Uri.parse(
          Config.apiURL(getWorldTimeInstance.value.url),
        ),
      );
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data[Strings.datetime];
      String offset = data[Strings.utc_offset].substring(0, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time property
      getWorldTimeInstance.value.isDaytime =
          now.hour > 6 && now.hour < 20 ? true : false;
      getWorldTimeInstance.value.time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      getWorldTimeInstance.value.time = Errors.TIME_FETCH_FAILED_ERROR;
    }
  }
}
