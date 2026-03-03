import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/bus.dart';
import '../../domain/entities/bus_location.dart';
import '../../domain/usecases/get_buses_by_stop.dart';
import '../../domain/usecases/get_bus_location.dart';

part 'bus_event.dart';
part 'bus_state.dart';

class BusBloc extends Bloc<BusEvent, BusState> {
  final GetBusesByStop getBusesByStop;
  final GetBusLocation getBusLocation;

  BusBloc({
    required this.getBusesByStop,
    required this.getBusLocation,
  }) : super(BusInitial()) {
    on<LoadBusesByStop>(_onLoadBusesByStop);
    on<LoadBusLocation>(_onLoadBusLocation);
  }

  Future<void> _onLoadBusesByStop(
      LoadBusesByStop event, Emitter<BusState> emit) async {
    emit(BusLoading());
    try {
      final buses = await getBusesByStop(event.stopId);
      emit(BusLoaded(buses: buses));
    } catch (e) {
      emit(BusError(message: e.toString()));
    }
  }

  Future<void> _onLoadBusLocation(
      LoadBusLocation event, Emitter<BusState> emit) async {
    emit(BusLocationLoading());
    try {
      final location = await getBusLocation(event.busId);
      emit(BusLocationLoaded(location: location));
    } catch (e) {
      emit(BusError(message: e.toString()));
    }
  }
}
