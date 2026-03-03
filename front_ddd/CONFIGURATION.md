# Configuration de l'Application Passagers

## Problème résolu : Erreur 500

### Cause
L'URL `localhost` ne fonctionne pas sur un émulateur Android.

### Solution
L'URL a été changée en `http://10.0.2.2:8000/api` dans le fichier :
`lib/core/constants/api_constants.dart`

## Configuration selon votre environnement

### 1. Émulateur Android (par défaut)
```dart
static const String baseUrl = 'http://10.0.2.2:8000/api';
```
✅ Déjà configuré !

### 2. Appareil physique Android/iOS
Modifiez dans `lib/core/constants/api_constants.dart` :
```dart
static const String baseUrl = 'http://VOTRE_IP:8000/api';
```

Pour trouver votre IP :
- Windows : `ipconfig` (cherchez IPv4)
- Mac/Linux : `ifconfig` ou `ip addr`
- Exemple : `http://192.168.1.10:8000/api`

### 3. iOS Simulator
```dart
static const String baseUrl = 'http://localhost:8000/api';
```

## Vérification

1. **Backend démarré** :
```bash
cd backend_ddd
php artisan serve
```

2. **Tester l'API** :
```bash
curl http://localhost:8000/api/stops
curl http://localhost:8000/api/buses
```

3. **Relancer l'app Flutter** :
```bash
cd front_ddd
flutter run
```

## Données de test

Le backend contient :
- ✅ 40 arrêts de bus
- ✅ 20 bus avec positions GPS
- ✅ Lignes de bus configurées

## Dépannage

### Erreur "Connection refused"
- Vérifiez que le backend est démarré
- Vérifiez l'URL dans `api_constants.dart`
- Pour appareil physique : même réseau WiFi

### Erreur 500
- Vérifiez les logs Laravel : `backend_ddd/storage/logs/laravel.log`
- Vérifiez la base de données : `php artisan tinker`

### Pas de données affichées
- Vérifiez qu'il y a des données : `php artisan tinker --execute="echo App\Models\Stop::count()"`
- Redémarrez l'app Flutter
