import '../../domain/entities/stop.dart';
import '../../domain/repositories/stop_repository.dart';
import '../datasources/stop_remote_data_source.dart';

class StopRepositoryImpl implements StopRepository {
  final StopRemoteDataSource remoteDataSource;

  StopRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Stop>> getAllStops() async {
    return await remoteDataSource.getAllStops();
  }
}
