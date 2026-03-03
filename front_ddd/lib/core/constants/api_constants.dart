class ApiConstants {
  // Pour émulateur Android, utilisez 10.0.2.2
  // Pour appareil physique, utilisez votre IP locale (ex: 192.168.1.10)
  static const String baseUrl = 'http://10.0.2.2:8000/api';
  
  static const String stops = '/stops';
  static const String buses = '/buses';
  
  static String stopBuses(int stopId) => '/stops/$stopId/buses';
  static String busDetails(int busId) => '/buses/$busId';
  static String busLocation(int busId) => '/buses/$busId/location';
}
