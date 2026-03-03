import 'package:equatable/equatable.dart';
import 'bus_location.dart';

class Bus extends Equatable {
  final int id;
  final String number;
  final String lineName;
  final BusLocation? currentLocation;

  const Bus({
    required this.id,
    required this.number,
    required this.lineName,
    this.currentLocation,
  });

  @override
  List<Object?> get props => [id, number, lineName, currentLocation];
}
