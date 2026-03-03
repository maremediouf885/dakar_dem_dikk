import 'package:get_it/get_it.dart';
import '../core/network/api_client.dart';
import '../core/utils/location_service.dart';
import '../core/utils/notification_service.dart';
import '../features/stops/data/datasources/stop_remote_data_source.dart';
import '../features/stops/data/repositories/stop_repository_impl.dart';
import '../features/stops/domain/repositories/stop_repository.dart';
import '../features/stops/domain/usecases/get_all_stops.dart';
import '../features/stops/presentation/bloc/stop_bloc.dart';
import '../features/buses/data/datasources/bus_remote_data_source.dart';
import '../features/buses/data/repositories/bus_repository_impl.dart';
import '../features/buses/domain/repositories/bus_repository.dart';
import '../features/buses/domain/usecases/get_buses_by_stop.dart';
import '../features/buses/domain/usecases/get_bus_location.dart';
import '../features/buses/presentation/bloc/bus_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // BLoC
  sl.registerFactory(() => StopBloc(getAllStops: sl()));
  sl.registerFactory(() => BusBloc(
        getBusesByStop: sl(),
        getBusLocation: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetAllStops(sl()));
  sl.registerLazySingleton(() => GetBusesByStop(sl()));
  sl.registerLazySingleton(() => GetBusLocation(sl()));

  // Repository
  sl.registerLazySingleton<StopRepository>(
    () => StopRepositoryImpl(remoteDataSource: sl()),
  );
  sl.registerLazySingleton<BusRepository>(
    () => BusRepositoryImpl(remoteDataSource: sl()),
  );

  // Data sources
  sl.registerLazySingleton(() => StopRemoteDataSource(apiClient: sl()));
  sl.registerLazySingleton(() => BusRemoteDataSource(apiClient: sl()));

  // Core
  sl.registerLazySingleton(() => ApiClient());
  sl.registerLazySingleton(() => LocationService());
  sl.registerLazySingleton(() => NotificationService());
}
