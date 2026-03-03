import '../../domain/entities/bus.dart';
import '../../domain/entities/bus_location.dart';
import '../../domain/repositories/bus_repository.dart';
import '../datasources/bus_remote_data_source.dart';

class BusRepositoryImpl implements BusRepository {
  final BusRemoteDataSource remoteDataSource;

  BusRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Bus>> getBusesByStop(int stopId) async {
    return await remoteDataSource.getBusesByStop(stopId);
  }

  @override
  Future<Bus> getBusDetails(int busId) async {
    return await remoteDataSource.getBusDetails(busId);
  }

  @override
  Future<BusLocation> getBusLocation(int busId) async {
    return await remoteDataSource.getBusLocation(busId);
  }
}
