# 🚌 Suivi Bus Dakar - Application Mobile

Application de suivi en temps réel des bus **Dakar Dem Dikk** à Dakar, Sénégal 🇸🇳

## 📍 Zone de couverture

L'application couvre **tout Dakar** :
- Plateau
- Médina
- Grand Yoff
- Parcelles Assainies
- Guédiawaye
- Pikine
- Thiaroye
- Rufisque
- Liberté 6
- Point E
- Mermoz
- Sacré-Coeur
- Ouakam
- Ngor
- Yoff
- HLM

## 🚌 Lignes de bus disponibles

### Dakar Dem Dikk
- **Ligne 4** : Liberté 6 - Petersen
- **Ligne 7** : Parcelles - Plateau
- **Ligne 8** : Pikine - Sandaga
- **Ligne 15** : Guédiawaye - Centre-ville
- **Ligne 16** : Thiaroye - Pompiers
- **Ligne 23** : Grand Yoff - Plateau
- **Ligne 24** : Ouakam - Sandaga
- **Ligne 29** : Rufisque - Dakar
- **Ligne 32** : Yoff - Centre-ville
- **Ligne 47** : HLM - Plateau

## 📍 Arrêts principaux

1. **Gare Routière Pompiers** (14.6937, -17.4441)
2. **Place de l'Indépendance** (14.6728, -17.4275)
3. **Marché Sandaga** (14.6760, -17.4347)
4. **Université Cheikh Anta Diop** (14.6937, -17.4441)
5. **Plateau - Avenue Pompidou** (14.6728, -17.4347)
6. **Médina - Rue 10** (14.6850, -17.4500)
7. **Grand Yoff** (14.7500, -17.4700)
8. **Parcelles Assainies** (14.7600, -17.4200)
9. **Guédiawaye** (14.7700, -17.4100)
10. **Pikine** (14.7547, -17.3906)
11. **Thiaroye** (14.7800, -17.3500)
12. **Rufisque** (14.7167, -17.2667)
13. **Liberté 6** (14.7100, -17.4600)
14. **Point E** (14.7050, -17.4500)
15. **Mermoz** (14.7200, -17.4700)
16. **Sacré-Coeur** (14.7150, -17.4650)
17. **Ouakam** (14.7300, -17.4900)
18. **Ngor** (14.7500, -17.5100)
19. **Yoff** (14.7450, -17.4850)
20. **HLM Grand Yoff** (14.7400, -17.4600)

## 🗺️ Limites géographiques

```dart
Latitude : 14.65° à 14.80°
Longitude : -17.55° à -17.25°
Rayon de recherche : 5 km
```

## ✨ Fonctionnalités

### 🏠 Écran d'accueil
- Détection automatique de votre position
- Vérification que vous êtes à Dakar
- Message si hors zone : "Cette application est disponible uniquement à Dakar"

### 📍 Arrêts proches
- Affiche les 5 arrêts les plus proches de vous
- Distance en mètres/kilomètres
- Tri automatique par proximité

### 🚌 Temps d'arrivée
- Liste des bus Dakar Dem Dikk
- Temps estimé en minutes
- Couleurs :
  - 🔴 Rouge : ≤ 2 min
  - 🟠 Orange : ≤ 5 min
  - 🟢 Vert : > 5 min

### 📱 Détails du bus
- Position GPS en temps réel
- Carte Google Maps
- Numéro et ligne

### 🔔 Notifications
- Alerte locale quand le bus arrive dans 2 minutes
- "🚌 Bus X arrive dans 2 minutes"

## 🎨 Design

- **Couleurs** : Beige (#F5E6D3) et Marron (#8B4513)
- **Style** : Simple, épuré, facile à utiliser
- **Icônes** : Grandes et claires
- **Texte** : Minimal

## 🚀 Installation Backend (Laravel)

```bash
cd d:\backend_ddd

# Créer la base de données
mysql -u root -p
CREATE DATABASE bus_tracking_db;
exit;

# Lancer les migrations
php artisan migrate

# Insérer les données de Dakar
php artisan db:seed

# Démarrer le serveur
php artisan serve
```

## 📱 Installation Frontend (Flutter)

```bash
cd d:\front_ddd

# Installer les dépendances
flutter pub get

# Configurer l'URL API dans lib/core/constants/api_constants.dart
# Pour émulateur : http://10.0.2.2:8000/api
# Pour téléphone : http://[VOTRE_IP]:8000/api

# Lancer l'application
flutter run
```

## 🔧 Configuration Google Maps

1. Obtenir une clé API Google Maps
2. Ajouter dans `android/app/src/main/AndroidManifest.xml` :

```xml
<meta-data
    android:name="com.google.android.geo.API_KEY"
    android:value="VOTRE_CLE_API"/>
```

## 📊 Base de données

### Tables
- `stops` : 20 arrêts principaux de Dakar
- `buses` : 10 lignes Dakar Dem Dikk
- `bus_locations` : Positions GPS en temps réel
- `stop_bus` : Relations arrêts ↔ bus

## 🌍 Coordonnées GPS de référence

**Centre de Dakar** : 14.6937, -17.4441 (Place de l'Indépendance)

## 📝 Notes importantes

- ✅ Application limitée géographiquement à Dakar
- ✅ Vérification automatique de la position
- ✅ Message d'erreur si hors zone
- ✅ Données réelles des lignes Dakar Dem Dikk
- ✅ Arrêts principaux de toute la région de Dakar

## 🎯 Public cible

- Habitants de Dakar
- Étudiants (UCAD, etc.)
- Travailleurs
- Touristes à Dakar

## 📄 License

MIT License

---

**Développé pour Dakar, Sénégal 🇸🇳**
