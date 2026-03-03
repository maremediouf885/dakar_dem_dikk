import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

void main() {
  runApp(const DriverApp());
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dakar Dem Dikk - Chauffeur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const DriverHomePage(),
    );
  }
}

class DriverHomePage extends StatefulWidget {
  const DriverHomePage({super.key});

  @override
  State<DriverHomePage> createState() => _DriverHomePageState();
}

class _DriverHomePageState extends State<DriverHomePage> {
  bool _isOnDuty = false;
  Position? _currentPosition;
  Timer? _locationTimer;
  String _busNumber = '';
  final String _apiUrl = 'http://10.0.2.2:8000/api'; // Pour émulateur Android

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      _showMessage('Veuillez activer la localisation');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        _showMessage('Permission de localisation refusée');
        return;
      }
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = position;
      });
    } catch (e) {
      _showMessage('Erreur de localisation: $e');
    }
  }

  Future<void> _sendLocationToServer() async {
    if (_currentPosition == null || _busNumber.isEmpty) return;

    try {
      final response = await http.post(
        Uri.parse('$_apiUrl/driver/location'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'bus_number': _busNumber,
          'latitude': _currentPosition!.latitude,
          'longitude': _currentPosition!.longitude,
        }),
      );

      if (response.statusCode != 200) {
        print('Erreur envoi: ${response.body}');
      }
    } catch (e) {
      print('Erreur réseau: $e');
    }
  }

  void _toggleDuty() {
    if (!_isOnDuty && _busNumber.isEmpty) {
      _showBusNumberDialog();
      return;
    }

    setState(() {
      _isOnDuty = !_isOnDuty;
    });

    if (_isOnDuty) {
      _startLocationUpdates();
    } else {
      _stopLocationUpdates();
    }
  }

  void _startLocationUpdates() {
    _getCurrentLocation();
    _locationTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      _getCurrentLocation();
      _sendLocationToServer();
    });
  }

  void _stopLocationUpdates() {
    _locationTimer?.cancel();
    _locationTimer = null;
  }

  void _showBusNumberDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Numéro de Bus'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Ex: 101, 102, 201...',
            labelText: 'Numéro',
          ),
          keyboardType: TextInputType.number,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  _busNumber = controller.text;
                });
                Navigator.pop(context);
                _toggleDuty();
              }
            },
            child: const Text('Confirmer'),
          ),
        ],
      ),
    );
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _locationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dakar Dem Dikk - Chauffeur'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.directions_bus,
              size: 100,
              color: _isOnDuty ? Colors.green : Colors.grey,
            ),
            const SizedBox(height: 30),
            if (_busNumber.isNotEmpty)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Bus N° $_busNumber',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _isOnDuty ? 'EN SERVICE' : 'HORS SERVICE',
                        style: TextStyle(
                          fontSize: 18,
                          color: _isOnDuty ? Colors.green : Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 30),
            if (_currentPosition != null)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Position actuelle',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text('Lat: ${_currentPosition!.latitude.toStringAsFixed(6)}'),
                      Text('Lng: ${_currentPosition!.longitude.toStringAsFixed(6)}'),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _toggleDuty,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isOnDuty ? Colors.red : Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: Text(_isOnDuty ? 'TERMINER SERVICE' : 'DÉMARRER SERVICE'),
            ),
            if (_busNumber.isNotEmpty) ...[
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  setState(() {
                    _busNumber = '';
                    _isOnDuty = false;
                  });
                  _stopLocationUpdates();
                },
                child: const Text('Changer de bus'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
