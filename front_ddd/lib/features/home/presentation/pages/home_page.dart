import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../../stops/presentation/pages/nearby_stops_page.dart';
import '../../../../core/constants/app_theme.dart';
import '../../../../core/constants/dakar_constants.dart';
import '../../../../core/utils/location_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LocationService _locationService = LocationService();
  bool _isLoading = false;

  Future<void> _detectLocation() async {
    setState(() => _isLoading = true);
    final position = await _locationService.getCurrentLocation();
    setState(() => _isLoading = false);

    if (position != null) {
      if (!DakarConstants.isInDakar(position.latitude, position.longitude)) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Cette application est disponible uniquement à Dakar'),
              backgroundColor: AppTheme.green,
              duration: const Duration(seconds: 4),
            ),
          );
        }
        return;
      }

      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NearbyStopsPage(
              userLatitude: position.latitude,
              userLongitude: position.longitude,
            ),
          ),
        );
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Impossible de détecter votre position'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Image.network(
                      'https://tse4.mm.bing.net/th/id/OIP.4_2XirooykHNVO5rOk1WdwHaD5?rs=1&pid=ImgDetMain',
                      height: 200,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.directions_bus,
                          size: 120,
                          color: AppTheme.green,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Suivi Bus Dakar',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.darkGray,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppTheme.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppTheme.yellow,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: AppTheme.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Dakar Dem Dikk',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.darkGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  _isLoading
                      ? CircularProgressIndicator(color: AppTheme.green)
                      : ElevatedButton.icon(
                          onPressed: _detectLocation,
                          icon: const Icon(Icons.location_on, size: 28),
                          label: const Text('Trouver les arrêts proches'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
