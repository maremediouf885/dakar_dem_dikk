import '../entities/bus.dart';
import '../entities/bus_location.dart';

abstract class BusRepository {
  Future<List<Bus>> getBusesByStop(int stopId);
  Future<Bus> getBusDetails(int busId);
  Future<BusLocation> getBusLocation(int busId);
}
