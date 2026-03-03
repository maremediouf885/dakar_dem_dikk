import '../entities/bus.dart';
import '../repositories/bus_repository.dart';

class GetBusesByStop {
  final BusRepository repository;

  GetBusesByStop(this.repository);

  Future<List<Bus>> call(int stopId) async {
    return await repository.getBusesByStop(stopId);
  }
}
