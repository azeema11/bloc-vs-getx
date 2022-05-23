import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

import '../constants/config.dart';
import '../constants/errors.dart';
import '../constants/strings.dart';
import '../models/world_time.dart';
import '../utils/utils.dart';

class WorldTimeService {
  WorldTime _timeData = Utils.generateTimeZones()[2];
  WorldTime get getTimeData => _timeData;
  set setTimeData(WorldTime value) => _timeData = value;

  Future<void> getTime() async {
    try {
      // make the request
      Response response = await get(
        Uri.parse(
          Config.apiURL(getTimeData.url),
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
      getTimeData.isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      getTimeData.time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      getTimeData.time = Errors.TIME_FETCH_FAILED_ERROR;
    }
  }
}
