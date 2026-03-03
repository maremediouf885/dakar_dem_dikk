# dakar_dem_dikk

Système de suivi de bus Dakar Dem Dikk en temps réel

## 🚀 Structure du projet

```
dakar_dem_dikk/
├── backend_ddd/     # API Laravel (Backend)
├── front_ddd/       # App Flutter Passagers
└── driver_ddd/      # App Flutter Chauffeurs
```

## ⚡ Démarrage Rapide

### 1. Backend Laravel

```bash
cd backend_ddd
composer install
php artisan migrate
php artisan db:seed
php artisan serve
```

### 2. Application Passagers

```bash
cd front_ddd
flutter pub get
flutter run
```

**Important** : L'URL API est configurée pour émulateur Android (`http://10.0.2.2:8000/api`)

### 3. Application Chauffeur

```bash
cd driver_ddd
flutter pub get
flutter run
```

## 🔧 Configuration

### Pour émulateur Android
✅ Déjà configuré ! Utilisez `http://10.0.2.2:8000/api`

### Pour appareil physique
Modifiez l'URL dans :
- **App Passagers** : `front_ddd/lib/core/constants/api_constants.dart`
- **App Chauffeur** : `driver_ddd/lib/main.dart` (ligne 38)

Remplacez par votre IP locale (ex: `http://192.168.1.10:8000/api`)

## 📱 Fonctionnalités

### Application Passagers
- ✅ Voir tous les arrêts de bus
- ✅ Voir les bus en temps réel
- ✅ Suivre la position des bus
- ✅ Arrêts à proximité
- ✅ Temps d'arrivée estimé

### Application Chauffeur
- ✅ Démarrer/Terminer le service
- ✅ Envoi automatique de position GPS (toutes les 10s)
- ✅ Gestion du numéro de bus
- ✅ Affichage de la position actuelle
- ✅ Statut en service / hors service

## 🗄️ Base de Données

- **40 arrêts** de bus à Dakar
- **20 bus** avec positions GPS
- **Lignes** : 4, 7, 8, 15, 16, 23, 24, 29, 32, 47

## 🧪 Test de l'API

```bash
# Windows
test_api.bat

# Ou manuellement
curl http://localhost:8000/api/stops
curl http://localhost:8000/api/buses
```

## 📚 Documentation

- [Guide de démarrage complet](GUIDE_DEMARRAGE.md)
- [Configuration app passagers](front_ddd/CONFIGURATION.md)
- [Documentation API](backend_ddd/API_DOCUMENTATION.md)
- [Guide app chauffeur](driver_ddd/README.md)

## 🐛 Dépannage

### Erreur 500 sur l'app passagers
✅ **Résolu** : URL changée de `localhost` à `10.0.2.2`

### Page blanche sur l'app chauffeur
✅ **Résolu** : Application complète implémentée

### Erreur de connexion
1. Vérifiez que le backend est démarré
2. Vérifiez l'URL dans les fichiers de configuration
3. Pour appareil physique : même réseau WiFi

## 🎯 API Endpoints

### Passagers
- `GET /api/stops` - Liste des arrêts
- `GET /api/buses` - Liste des bus
- `GET /api/buses/{id}/location` - Position d'un bus
- `GET /api/stops/{id}/buses` - Bus à un arrêt

### Chauffeurs
- `POST /api/driver/location` - Envoyer position GPS
- `POST /api/driver/start-session` - Démarrer session
- `POST /api/driver/end-session` - Terminer session

## 🚀 Technologies

- **Backend** : Laravel 11, MySQL
- **Frontend** : Flutter 3.9, Dart
- **GPS** : Geolocator
- **HTTP** : Dio, HTTP package

## 📄 Licence

MIT
