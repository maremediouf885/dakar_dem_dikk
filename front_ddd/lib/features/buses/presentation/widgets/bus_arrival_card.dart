import 'package:flutter/material.dart';
import 'dart:math';
import '../../domain/entities/bus.dart';
import 'bus_detail_page.dart';
import '../../../../core/constants/app_theme.dart';

class BusArrivalCard extends StatelessWidget {
  final Bus bus;
  final Function(String, int) onNotify;

  const BusArrivalCard({
    super.key,
    required this.bus,
    required this.onNotify,
  });

  int _calculateEstimatedTime() {
    return Random().nextInt(15) + 1;
  }

  Color _getTimeColor(int minutes) {
    if (minutes <= 2) return Colors.red;
    if (minutes <= 5) return Colors.orange;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final estimatedTime = _calculateEstimatedTime();
    final timeColor = _getTimeColor(estimatedTime);

    if (estimatedTime <= 2) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onNotify(bus.number, estimatedTime);
      });
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BusDetailPage(bus: bus),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: AppTheme.white,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppTheme.green, width: 3),
                      ),
                      child: Center(
                        child: Text(
                          bus.number,
                          style: TextStyle(
                            color: AppTheme.green,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bus.lineName,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.darkGray,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Bus ${bus.number}',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.green,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '$estimatedTime min',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: timeColor,
                        ),
                      ),
                      Text(
                        'Arrive dans',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BusDetailPage(bus: bus),
                          ),
                        );
                      },
                      icon: const Icon(Icons.location_on, size: 20),
                      label: const Text('Localiser sur la carte'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
