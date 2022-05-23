import '../models/world_time.dart';
import '../services/world_time_service.dart';

class WorldTimeRepo {
  const WorldTimeRepo(this._service);
  final WorldTimeService _service;

  void setLocation(WorldTime newZoneTimeData) => _service.setTimeData = newZoneTimeData;
  WorldTime get getLocationTime => _service.getTimeData;
  Future<void> getTime() async => await _service.getTime();
}
