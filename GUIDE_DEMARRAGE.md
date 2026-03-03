# Dakar Dem Dikk - Guide de Démarrage Rapide

## Architecture du Projet

```
dakar_dem_dikk/
├── backend_ddd/     # API Laravel (Backend)
├── front_ddd/       # App Flutter Passagers
└── driver_ddd/      # App Flutter Chauffeurs ✨ NOUVEAU
```

## 🚀 Démarrage Rapide

### 1. Backend (Laravel)

```bash
cd backend_ddd
composer install
php artisan migrate
php artisan serve
```

Le backend sera accessible sur : `http://localhost:8000`

### 2. Application Chauffeur (Flutter)

```bash
cd driver_ddd
flutter pub get
flutter run
```

**Configuration importante** :
- **Émulateur Android** : L'URL est déjà configurée (`http://10.0.2.2:8000/api`)
- **Appareil physique** : Modifiez l'URL dans `lib/main.dart` ligne 38 avec votre IP locale

### 3. Application Passagers (Flutter)

```bash
cd front_ddd
flutter pub get
flutter run
```

## 📱 Utilisation de l'App Chauffeur

1. **Lancer l'application**
2. **Cliquer sur "DÉMARRER SERVICE"**
3. **Entrer le numéro de bus** (ex: 101, 102, 201)
4. **Confirmer** - La position GPS sera envoyée automatiquement toutes les 10 secondes

### Fonctionnalités

✅ Suivi GPS en temps réel
✅ Envoi automatique de position au serveur
✅ Interface simple et intuitive
✅ Gestion du statut (En service / Hors service)
✅ Affichage de la position actuelle

## 🔧 Résolution des Problèmes

### Page blanche sur l'app chauffeur
```bash
cd driver_ddd
flutter clean
flutter pub get
flutter run
```

### Erreur de connexion au backend
1. Vérifiez que Laravel est démarré : `php artisan serve`
2. Pour appareil physique, utilisez votre IP locale (pas localhost)
3. Vérifiez que votre firewall autorise la connexion

### Permissions GPS
- Acceptez les permissions de localisation quand demandé
- Activez le GPS sur votre appareil

## 📊 Base de Données

Les tables principales :
- `buses` - Informations des bus
- `bus_locations` - Positions GPS en temps réel
- `stops` - Arrêts de bus
- `drivers` - Informations des chauffeurs
- `driver_sessions` - Sessions de travail

## 🌐 API Endpoints

### Pour les chauffeurs
- `POST /api/driver/location` - Envoyer la position GPS
- `POST /api/driver/start-session` - Démarrer une session
- `POST /api/driver/end-session` - Terminer une session

### Pour les passagers
- `GET /api/buses` - Liste des bus
- `GET /api/buses/{id}/location` - Position d'un bus
- `GET /api/stops` - Liste des arrêts
- `GET /api/stops/{id}/buses` - Bus à un arrêt

## 📝 Notes Importantes

- L'app chauffeur envoie la position toutes les **10 secondes** quand en service
- Les permissions de localisation sont **obligatoires**
- Pour tester sur appareil physique, assurez-vous d'être sur le **même réseau WiFi**

## 🎯 Prochaines Étapes

1. Tester l'envoi de position depuis l'app chauffeur
2. Vérifier la réception dans la base de données
3. Afficher les bus en temps réel dans l'app passagers
4. Ajouter l'authentification des chauffeurs
5. Implémenter les notifications
