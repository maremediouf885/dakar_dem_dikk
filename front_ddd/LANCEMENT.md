# 🚀 Guide de lancement rapide

## Backend Laravel

```bash
cd d:\backend_ddd

# Créer la base de données (première fois seulement)
mysql -u root -p
CREATE DATABASE bus_tracking_db;
exit;

# Lancer les migrations avec données de Dakar (première fois)
php artisan migrate:fresh --seed

# Démarrer le serveur Laravel
php artisan serve
```

Le backend sera disponible sur : http://localhost:8000

---

## Frontend Flutter

### 1. Lancer l'émulateur Android

```bash
# Ouvrir un nouveau terminal
"%LOCALAPPDATA%\Android\sdk\emulator\emulator" -avd Pixel_7_Pro
```

OU utiliser Android Studio :
- Ouvrir Android Studio
- Tools > Device Manager
- Cliquer sur ▶️ à côté de "Pixel_7_Pro"

### 2. Vérifier que l'émulateur est détecté

```bash
cd d:\front_ddd
flutter devices
```

Vous devriez voir :
```
Pixel 7 Pro (mobile) • emulator-5554 • android • Android 13 (API 36)
```

### 3. Lancer l'application Flutter

```bash
cd d:\front_ddd
flutter run
```

OU spécifier l'émulateur :
```bash
flutter run -d emulator-5554
```

---

## 🎯 Commandes en une ligne

### Terminal 1 - Backend
```bash
cd d:\backend_ddd && php artisan serve
```

### Terminal 2 - Émulateur
```bash
"%LOCALAPPDATA%\Android\sdk\emulator\emulator" -avd Pixel_7_Pro
```

### Terminal 3 - Frontend
```bash
cd d:\front_ddd && flutter run
```

---

## 🔧 Dépannage

### Si l'émulateur ne démarre pas :
```bash
# Lister les émulateurs disponibles
"%LOCALAPPDATA%\Android\sdk\emulator\emulator" -list-avds

# Essayer l'autre émulateur
"%LOCALAPPDATA%\Android\sdk\emulator\emulator" -avd Medium_Phone_API_36
```

### Si Flutter ne trouve pas l'émulateur :
```bash
# Attendre 30 secondes que l'émulateur démarre complètement
# Puis vérifier
flutter devices
```

### Pour tester sur Chrome (alternative) :
```bash
cd d:\front_ddd
flutter run -d chrome
```

---

## 📱 Tester l'application

1. L'émulateur va s'ouvrir
2. L'app "Suivi Bus Dakar" va s'installer automatiquement
3. Vous verrez l'écran d'accueil beige avec le bouton marron
4. Cliquer sur "Trouver les arrêts proches"
5. L'émulateur simulera une position GPS à Dakar

---

## ⚡ Raccourcis Flutter

Pendant que l'app tourne :
- `r` : Hot reload (recharger les changements)
- `R` : Hot restart (redémarrer l'app)
- `q` : Quitter
- `h` : Aide

---

## 🌐 Tester l'API Backend

Ouvrir dans le navigateur :
- http://localhost:8000/api/stops
- http://localhost:8000/api/stops/1/buses
- http://localhost:8000/api/buses/1
- http://localhost:8000/api/buses/1/location
