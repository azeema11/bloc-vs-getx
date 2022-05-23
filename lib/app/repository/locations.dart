import '../models/location.dart';

class Locations {
  Locations._();

  static List<Location> locationList = [
    Location(continent: 'Europe', country: 'London', flag: 'uk.png'),
    Location(continent: 'Europe', country: 'Athens', flag: 'greece.png'),
    Location(continent: 'Africa', country: 'Cairo', flag: 'egypt.png'),
    Location(continent: 'Africa', country: 'Nairobi', flag: 'kenya.png'),
    Location(continent: 'America', country: 'Chicago', flag: 'usa.png'),
    Location(continent: 'America', country: 'New_York', flag: 'usa.png'),
    Location(continent: 'Asia', country: 'Seoul', flag: 'south_korea.png'),
    Location(continent: 'Asia', country: 'Jakarta', flag: 'indonesia.png'),
  ];
}
