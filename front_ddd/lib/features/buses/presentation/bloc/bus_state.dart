part of 'bus_bloc.dart';

abstract class BusState extends Equatable {
  @override
  List<Object?> get props => [];
}

class BusInitial extends BusState {}

class BusLoading extends BusState {}

class BusLoaded extends BusState {
  final List<Bus> buses;

  BusLoaded({required this.buses});

  @override
  List<Object?> get props => [buses];
}

class BusLocationLoading extends BusState {}

class BusLocationLoaded extends BusState {
  final BusLocation location;

  BusLocationLoaded({required this.location});

  @override
  List<Object?> get props => [location];
}

class BusError extends BusState {
  final String message;

  BusError({required this.message});

  @override
  List<Object?> get props => [message];
}
