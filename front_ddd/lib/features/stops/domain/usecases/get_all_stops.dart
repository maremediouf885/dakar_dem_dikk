import '../entities/stop.dart';
import '../repositories/stop_repository.dart';

class GetAllStops {
  final StopRepository repository;

  GetAllStops(this.repository);

  Future<List<Stop>> call() async {
    return await repository.getAllStops();
  }
}
