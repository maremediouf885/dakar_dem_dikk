import 'package:equatable/equatable.dart';

class Stop extends Equatable {
  final int id;
  final String name;
  final double latitude;
  final double longitude;
  final double? distance;

  const Stop({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    this.distance,
  });

  Stop copyWith({double? distance}) {
    return Stop(
      id: id,
      name: name,
      latitude: latitude,
      longitude: longitude,
      distance: distance ?? this.distance,
    );
  }

  @override
  List<Object?> get props => [id, name, latitude, longitude, distance];
}
