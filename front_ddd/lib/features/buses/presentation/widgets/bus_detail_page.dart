import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../domain/entities/bus.dart';
import '../../../../core/constants/app_theme.dart';

class BusDetailPage extends StatelessWidget {
  final Bus bus;

  const BusDetailPage({super.key, required this.bus});

  @override
  Widget build(BuildContext context) {
    final hasLocation = bus.currentLocation != null;
    final LatLng? busPosition = hasLocation
        ? LatLng(
            bus.currentLocation!.latitude,
            bus.currentLocation!.longitude,
          )
        : null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Bus ${bus.number} - ${bus.lineName}'),
        actions: [
          if (hasLocation)
            IconButton(
              icon: const Icon(Icons.my_location),
              onPressed: () {
                // Recentrer sur le bus
              },
            ),
        ],
      ),
      body: hasLocation
          ? Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppTheme.lightGray,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: AppTheme.white,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppTheme.green, width: 2),
                          ),
                          child: Center(
                            child: Text(
                              bus.number,
                              style: TextStyle(
                                color: AppTheme.green,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
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
                            Row(
                              children: [
                                Icon(Icons.location_on, size: 16, color: AppTheme.green),
                                const SizedBox(width: 4),
                                Text(
                                  'Position en temps réel',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppTheme.green,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: busPosition!,
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('bus_${bus.id}'),
                        position: busPosition,
                        icon: BitmapDescriptor.defaultMarkerWithHue(
                          BitmapDescriptor.hueGreen,
                        ),
                        infoWindow: InfoWindow(
                          title: 'Bus ${bus.number}',
                          snippet: bus.lineName,
                        ),
                      ),
                    },
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: true,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  color: AppTheme.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(Icons.speed, color: AppTheme.green, size: 32),
                              const SizedBox(height: 4),
                              Text(
                                'En service',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.darkGray,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.access_time, color: AppTheme.yellow, size: 32),
                              const SizedBox(height: 4),
                              Text(
                                '3 min',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.darkGray,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Icon(Icons.route, color: AppTheme.red, size: 32),
                              const SizedBox(height: 4),
                              Text(
                                'Itinéraire',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.darkGray,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Lat: ${bus.currentLocation!.latitude.toStringAsFixed(6)} | Lng: ${bus.currentLocation!.longitude.toStringAsFixed(6)}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppTheme.green,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_off,
                    size: 80,
                    color: AppTheme.green,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Position non disponible',
                    style: TextStyle(
                      fontSize: 18,
                      color: AppTheme.green,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Le bus ${bus.number} n\'est pas en service actuellement',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppTheme.darkGray,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
