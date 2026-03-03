class DakarConstants {
  // Centre de Dakar (Place de l'Indépendance)
  static const double centerLatitude = 14.6937;
  static const double centerLongitude = -17.4441;
  
  // Limites géographiques de Dakar
  static const double minLatitude = 14.65;
  static const double maxLatitude = 14.80;
  static const double minLongitude = -17.55;
  static const double maxLongitude = -17.25;
  
  // Rayon de recherche (en mètres)
  static const double searchRadius = 5000; // 5 km
  
  // Vérifier si une position est dans Dakar
  static bool isInDakar(double latitude, double longitude) {
    return latitude >= minLatitude &&
        latitude <= maxLatitude &&
        longitude >= minLongitude &&
        longitude <= maxLongitude;
  }
}
