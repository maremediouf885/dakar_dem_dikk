class ApiConstants {
  static const String baseUrl = 'http://localhost:8000/api';
  
  static const String stops = '/stops';
  static const String buses = '/buses';
  
  static String stopBuses(int stopId) => '/stops/$stopId/buses';
  static String busDetails(int busId) => '/buses/$busId';
  static String busLocation(int busId) => '/buses/$busId/location';
}
