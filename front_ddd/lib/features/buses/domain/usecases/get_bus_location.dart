import '../entities/bus_location.dart';
import '../repositories/bus_repository.dart';

class GetBusLocation {
  final BusRepository repository;

  GetBusLocation(this.repository);

  Future<BusLocation> call(int busId) async {
    return await repository.getBusLocation(busId);
  }
}
