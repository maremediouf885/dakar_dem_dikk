import 'package:flutter/material.dart';
import '../../domain/entities/stop.dart';
import '../../../buses/presentation/pages/bus_arrival_page.dart';
import '../../../../core/constants/app_theme.dart';

class NearbyStopCard extends StatelessWidget {
  final Stop stop;

  const NearbyStopCard({super.key, required this.stop});

  String _formatDistance(double meters) {
    if (meters < 1000) {
      return '${meters.round()} m';
    }
    return '${(meters / 1000).toStringAsFixed(1)} km';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on, color: AppTheme.green, size: 32),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    stop.name,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkGray,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Distance: ${_formatDistance(stop.distance!)}',
              style: TextStyle(
                fontSize: 16,
                color: AppTheme.green,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BusArrivalPage(
                        stopId: stop.id,
                        stopName: stop.name,
                      ),
                    ),
                  );
                },
                child: const Text('Voir les bus à cet arrêt'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
