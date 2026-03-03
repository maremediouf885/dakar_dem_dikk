import 'package:equatable/equatable.dart';

class BusLocation extends Equatable {
  final int id;
  final int busId;
  final double latitude;
  final double longitude;
  final DateTime updatedAt;

  const BusLocation({
    required this.id,
    required this.busId,
    required this.latitude,
    required this.longitude,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, busId, latitude, longitude, updatedAt];
}
