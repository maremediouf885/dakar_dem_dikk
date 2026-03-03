import '../entities/stop.dart';

abstract class StopRepository {
  Future<List<Stop>> getAllStops();
}
