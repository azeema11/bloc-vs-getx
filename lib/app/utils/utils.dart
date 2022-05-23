import '../repository/locations.dart';
import '../models/location.dart';
import '../models/world_time.dart';

class Utils {
  Utils._();

  static List<WorldTime> generateTimeZones() {
    List<Location> locationList = Locations.locationList;
    return List<WorldTime>.generate(
      locationList.length,
      (index) => WorldTime(
        location: locationList[index].country,
        flag: locationList[index].flag,
        url: "${locationList[index].continent}/${locationList[index].country}",
      ),
    );
  }
}
