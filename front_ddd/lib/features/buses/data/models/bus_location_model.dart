import '../../domain/entities/bus_location.dart';

class BusLocationModel extends BusLocation {
  const BusLocationModel({
    required super.id,
    required super.busId,
    required super.latitude,
    required super.longitude,
    required super.updatedAt,
  });

  factory BusLocationModel.fromJson(Map<String, dynamic> json) {
    return BusLocationModel(
      id: json['id'],
      busId: json['bus_id'],
      latitude: double.parse(json['latitude'].toString()),
      longitude: double.parse(json['longitude'].toString()),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bus_id': busId,
      'latitude': latitude,
      'longitude': longitude,
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
