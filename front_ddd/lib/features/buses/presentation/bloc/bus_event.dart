part of 'bus_bloc.dart';

abstract class BusEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadBusesByStop extends BusEvent {
  final int stopId;

  LoadBusesByStop({required this.stopId});

  @override
  List<Object?> get props => [stopId];
}

class LoadBusLocation extends BusEvent {
  final int busId;

  LoadBusLocation({required this.busId});

  @override
  List<Object?> get props => [busId];
}
