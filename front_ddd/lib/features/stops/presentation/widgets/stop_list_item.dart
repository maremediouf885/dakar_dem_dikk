import 'package:flutter/material.dart';
import '../../domain/entities/stop.dart';
import '../../../buses/presentation/pages/buses_page.dart';

class StopListItem extends StatelessWidget {
  final Stop stop;

  const StopListItem({super.key, required this.stop});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.location_on, color: Colors.white),
        ),
        title: Text(
          stop.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Lat: ${stop.latitude.toStringAsFixed(4)}, Lng: ${stop.longitude.toStringAsFixed(4)}',
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BusesPage(stopId: stop.id, stopName: stop.name),
            ),
          );
        },
      ),
    );
  }
}
