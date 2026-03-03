import 'package:flutter/material.dart';
import '../../domain/entities/bus.dart';

class BusListItem extends StatelessWidget {
  final Bus bus;

  const BusListItem({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.green,
          child: Text(
            bus.number,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(
          bus.lineName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: bus.currentLocation != null
            ? Text(
                'Position: ${bus.currentLocation!.latitude.toStringAsFixed(4)}, ${bus.currentLocation!.longitude.toStringAsFixed(4)}',
              )
            : const Text('Position non disponible'),
        trailing: bus.currentLocation != null
            ? const Icon(Icons.location_on, color: Colors.green)
            : const Icon(Icons.location_off, color: Colors.grey),
      ),
    );
  }
}
