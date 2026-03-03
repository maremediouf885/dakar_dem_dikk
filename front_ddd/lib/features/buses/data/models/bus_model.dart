import '../../domain/entities/bus.dart';
import 'bus_location_model.dart';

class BusModel extends Bus {
  const BusModel({
    required super.id,
    required super.number,
    required super.lineName,
    super.currentLocation,
  });

  factory BusModel.fromJson(Map<String, dynamic> json) {
    return BusModel(
      id: json['id'],
      number: json['number'],
      lineName: json['line_name'],
      currentLocation: json['current_location'] != null
          ? BusLocationModel.fromJson(json['current_location'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number': number,
      'line_name': lineName,
      'current_location': currentLocation != null
          ? (currentLocation as BusLocationModel).toJson()
          : null,
    };
  }
}
