# 🚌 Suivi Bus - Application Flutter

Application mobile ultra simple pour suivre les bus en temps réel.

## ✨ Fonctionnalités

### 🏠 Écran d'accueil
- Détection automatique de votre position
- Interface beige et marron très simple
- Bouton unique : "Trouver les arrêts proches"

### 📍 Arrêts proches
- Liste des 5 arrêts les plus proches
- Distance affichée en mètres/kilomètres
- Bouton "Voir les bus à cet arrêt"

### 🚌 Arrivée des bus (Écran principal)
- Liste des bus qui passent à l'arrêt
- **Temps estimé d'arrivée** en minutes
- Couleurs :
  - 🔴 Rouge : arrive dans ≤ 2 min
  - 🟠 Orange : arrive dans ≤ 5 min
  - 🟢 Vert : arrive dans > 5 min
- Rafraîchissement automatique toutes les 30 secondes

### 📱 Détail d'un bus
- Position actuelle sur carte Google Maps
- Coordonnées GPS
- Numéro et ligne du bus

### 🔔 Notifications
- Notification locale quand le bus arrive dans 2 minutes
- Message : "🚌 Bus X arrive dans 2 minutes"
- Pas de SMS, juste notification dans l'app

## 🎨 Design

- **Fond** : Beige (#F5E6D3)
- **Boutons** : Marron (#8B4513)
- **Icônes** : Grandes et simples
- **Texte** : Minimal et clair

## 🏗️ Architecture

```
lib/
├── core/
│   ├── constants/
│   │   ├── api_constants.dart (URL API)
│   │   └── app_theme.dart (Couleurs beige/marron)
│   ├── network/
│   │   └── api_client.dart (Dio HTTP)
│   └── utils/
│       ├── location_service.dart (GPS)
│       └── notification_service.dart (Notifications)
├── features/
│   ├── home/
│   │   └── presentation/pages/
│   │       └── home_page.dart (Écran d'accueil)
│   ├── stops/
│   │   ├── domain/entities/stop.dart
│   │   ├── data/models/stop_model.dart
│   │   └── presentation/
│   │       ├── pages/nearby_stops_page.dart
│   │       └── widgets/nearby_stop_card.dart
│   └── buses/
│       ├── domain/entities/
│       │   ├── bus.dart
│       │   └── bus_location.dart
│       ├── data/models/
│       │   ├── bus_model.dart
│       │   └── bus_location_model.dart
│       └── presentation/
│           ├── pages/bus_arrival_page.dart
│           └── widgets/
│               ├── bus_arrival_card.dart
│               └── bus_detail_page.dart
└── main.dart
```

## 🚀 Installation

### 1. Installer les dépendances

```bash
flutter pub get
```

### 2. Configuration de l'API

Modifier `lib/core/constants/api_constants.dart` :

```dart
// Pour émulateur Android
static const String baseUrl = 'http://10.0.2.2:8000/api';

// Pour appareil physique (remplacer par votre IP)
static const String baseUrl = 'http://192.168.1.X:8000/api';
```

### 3. Permissions Android

Le fichier `android/app/src/main/AndroidManifest.xml` doit contenir :

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
<uses-permission android:name="android.permission.POST_NOTIFICATIONS"/>
```

### 4. Google Maps API Key

Ajouter votre clé API dans `android/app/src/main/AndroidManifest.xml` :

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="VOTRE_CLE_API"/>
```

### 5. Lancer l'application

```bash
flutter run
```

## 📱 Flow utilisateur

1. **Ouvrir l'app** → Écran d'accueil beige
2. **Cliquer** "Trouver les arrêts proches" → Détection GPS
3. **Voir** les 5 arrêts les plus proches avec distance
4. **Cliquer** sur un arrêt → Liste des bus
5. **Voir** les temps d'arrivée en temps réel
6. **Cliquer** sur un bus → Carte avec position
7. **Recevoir** notification si bus arrive dans 2 min

## 🔧 Communication Backend ↔ Frontend

### API Endpoints utilisés

```
GET /api/stops
→ Récupère tous les arrêts

GET /api/stops/{id}/buses
→ Récupère les bus d'un arrêt avec position actuelle

GET /api/buses/{id}
→ Détails d'un bus

GET /api/buses/{id}/location
→ Position GPS en temps réel
```

### Format des réponses

```json
// GET /api/stops
{
  "data": [
    {
      "id": 1,
      "name": "Gare Centrale",
      "latitude": "48.85660000",
      "longitude": "2.35220000"
    }
  ]
}

// GET /api/stops/1/buses
{
  "data": [
    {
      "id": 1,
      "number": "42",
      "line_name": "Ligne A",
      "current_location": {
        "latitude": "48.86000000",
        "longitude": "2.35500000",
        "updated_at": "2024-03-01T10:30:00.000000Z"
      }
    }
  ]
}
```

## 📦 Dépendances principales

```yaml
flutter_bloc: ^8.1.3          # Gestion d'état
dio: ^5.4.0                   # HTTP client
get_it: ^7.6.4                # Dependency injection
geolocator: ^10.1.0           # GPS
google_maps_flutter: ^2.5.0   # Cartes
flutter_local_notifications: ^16.3.0  # Notifications
equatable: ^2.0.5             # Comparaison objets
```

## 🎯 Bonnes pratiques

✅ Clean Architecture (Domain, Data, Presentation)  
✅ BLoC Pattern pour la gestion d'état  
✅ Dependency Injection avec GetIt  
✅ Repository Pattern  
✅ Géolocalisation automatique  
✅ Notifications locales  
✅ Rafraîchissement automatique  
✅ Interface ultra simple  
✅ Design beige/marron apaisant  

## 📝 Prochaines étapes

- [ ] Calcul réel du temps d'arrivée basé sur la distance
- [ ] WebSockets pour mise à jour en temps réel
- [ ] Historique des passages
- [ ] Favoris d'arrêts
- [ ] Mode sombre

## 🛠️ Commandes utiles

```bash
# Lancer l'app
flutter run

# Build APK
flutter build apk

# Analyser le code
flutter analyze

# Formater le code
flutter format .
```

## 📄 License

MIT License
