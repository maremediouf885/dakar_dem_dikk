# 🚌 Bus Tracking API - Laravel

API REST pour le suivi en temps réel des bus avec Laravel et architecture DDD.

## 📋 Fonctionnalités

- 📍 Localisation GPS des bus en temps réel
- ⏱ Temps estimé d'arrivée
- 🚌 Gestion des lignes et arrêts
- 📊 Historique des passages
- 🔔 Système de notifications (à venir)

## 🗄️ Base de données

### Tables
- `users` - Utilisateurs
- `stops` - Arrêts de bus
- `buses` - Bus et lignes
- `bus_locations` - Positions GPS en temps réel
- `stop_bus` - Relation arrêts/bus

## 🚀 Installation

### 1. Configuration de la base de données

Créez la base de données MySQL :
```sql
CREATE DATABASE bus_tracking_db;
```

### 2. Configuration .env

Le fichier `.env` est déjà configuré avec :
```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=bus_tracking_db
DB_USERNAME=root
DB_PASSWORD=
```

### 3. Installation des dépendances

```bash
composer install
```

### 4. Migrations et données de test

```bash
php artisan migrate
php artisan db:seed
```

### 5. Lancer le serveur

```bash
php artisan serve
```

L'API sera disponible sur : `http://localhost:8000`

## 📡 Endpoints API

### 1. Liste tous les arrêts
```
GET /api/stops
```

**Réponse :**
```json
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
```

### 2. Bus passant par un arrêt
```
GET /api/stops/{id}/buses
```

**Exemple :** `GET /api/stops/1/buses`

**Réponse :**
```json
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

### 3. Détails d'un bus
```
GET /api/buses/{id}
```

**Exemple :** `GET /api/buses/1`

**Réponse :**
```json
{
  "data": {
    "id": 1,
    "number": "42",
    "line_name": "Ligne A",
    "current_location": {
      "latitude": "48.86000000",
      "longitude": "2.35500000",
      "updated_at": "2024-03-01T10:30:00.000000Z"
    },
    "stops": [
      {
        "id": 1,
        "name": "Gare Centrale",
        "latitude": "48.85660000",
        "longitude": "2.35220000"
      }
    ]
  }
}
```

### 4. Position en temps réel d'un bus
```
GET /api/buses/{id}/location
```

**Exemple :** `GET /api/buses/1/location`

**Réponse :**
```json
{
  "data": {
    "id": 1,
    "bus_id": 1,
    "latitude": "48.86000000",
    "longitude": "2.35500000",
    "updated_at": "2024-03-01T10:30:00.000000Z"
  }
}
```

## 🏗️ Architecture DDD

```
src/
├── Domain/          # Logique métier pure
├── Application/     # Use Cases et Services
├── Infrastructure/  # Repositories et Persistence
└── Presentation/    # Controllers et Resources

app/
├── Models/          # Eloquent Models
│   ├── Stop.php
│   ├── Bus.php
│   └── BusLocation.php
├── Http/
│   ├── Controllers/Api/
│   │   ├── StopController.php
│   │   └── BusController.php
│   └── Resources/
│       ├── StopResource.php
│       ├── BusResource.php
│       └── BusLocationResource.php
```

## 🔧 Bonnes pratiques implémentées

✅ API Resources pour formater les réponses JSON  
✅ Route Model Binding pour simplifier les controllers  
✅ Relations Eloquent (BelongsTo, HasMany, BelongsToMany)  
✅ Migrations avec clés étrangères et contraintes  
✅ Seeders pour les données de test  
✅ Architecture RESTful  
✅ Séparation des préoccupations (SoC)  

## 📝 Prochaines étapes

- [ ] Authentification API (Sanctum)
- [ ] Calcul du temps estimé d'arrivée
- [ ] Historique des passages
- [ ] Notifications push
- [ ] WebSockets pour le temps réel
- [ ] Tests unitaires et fonctionnels
