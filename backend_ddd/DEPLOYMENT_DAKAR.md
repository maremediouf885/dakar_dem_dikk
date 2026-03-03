# Configuration pour le déploiement à Dakar

## Backend Laravel

### 1. Configuration .env pour production

```env
APP_NAME="Suivi Bus Dakar"
APP_ENV=production
APP_DEBUG=false
APP_URL=https://votre-domaine.sn

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=bus_tracking_db
DB_USERNAME=votre_user
DB_PASSWORD=votre_password_securise

# Timezone Dakar
APP_TIMEZONE=Africa/Dakar
```

### 2. Commandes de déploiement

```bash
# Optimiser l'application
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Migrations et seeders
php artisan migrate --force
php artisan db:seed --force
```

## Frontend Flutter

### 1. Configuration API pour production

Dans `lib/core/constants/api_constants.dart` :

```dart
static const String baseUrl = 'https://api.votre-domaine.sn/api';
```

### 2. Build APK pour Android

```bash
# Build APK de production
flutter build apk --release

# Build App Bundle (pour Google Play)
flutter build appbundle --release
```

### 3. Configuration Android

Dans `android/app/build.gradle` :

```gradle
android {
    defaultConfig {
        applicationId "com.bustracking.dakar"
        minSdkVersion 21
        targetSdkVersion 33
        versionCode 1
        versionName "1.0.0"
    }
}
```

## Serveur recommandé

### Hébergement au Sénégal
- **Sonatel** (Orange Business Services)
- **Arc Informatique**
- **Datatech**

### Spécifications minimales
- CPU : 2 cores
- RAM : 4 GB
- Stockage : 20 GB SSD
- Bande passante : Illimitée

## Base de données

### MySQL Configuration

```sql
-- Créer l'utilisateur
CREATE USER 'bus_tracking'@'localhost' IDENTIFIED BY 'password_securise';

-- Créer la base
CREATE DATABASE bus_tracking_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Donner les permissions
GRANT ALL PRIVILEGES ON bus_tracking_db.* TO 'bus_tracking'@'localhost';
FLUSH PRIVILEGES;
```

## Sécurité

### 1. HTTPS obligatoire
- Certificat SSL (Let's Encrypt gratuit)
- Redirection HTTP → HTTPS

### 2. Firewall
```bash
# Autoriser uniquement les ports nécessaires
ufw allow 80/tcp
ufw allow 443/tcp
ufw allow 22/tcp
ufw enable
```

### 3. Rate Limiting Laravel

Dans `app/Http/Kernel.php` :

```php
'api' => [
    'throttle:60,1', // 60 requêtes par minute
],
```

## Monitoring

### 1. Logs Laravel
```bash
tail -f storage/logs/laravel.log
```

### 2. Monitoring serveur
- **Uptime** : UptimeRobot
- **Performance** : New Relic / Datadog
- **Erreurs** : Sentry

## Backup

### Script de sauvegarde quotidienne

```bash
#!/bin/bash
# backup.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backups"

# Backup base de données
mysqldump -u bus_tracking -p bus_tracking_db > $BACKUP_DIR/db_$DATE.sql

# Backup fichiers
tar -czf $BACKUP_DIR/files_$DATE.tar.gz /var/www/html

# Garder seulement les 7 derniers jours
find $BACKUP_DIR -type f -mtime +7 -delete
```

### Cron job
```bash
# Ajouter dans crontab -e
0 2 * * * /path/to/backup.sh
```

## Mise à jour des positions GPS

### Script de mise à jour automatique

```php
// app/Console/Commands/UpdateBusLocations.php

php artisan make:command UpdateBusLocations

// Dans le handle()
public function handle()
{
    // Logique de mise à jour des positions
    // À connecter avec les GPS des bus réels
}
```

### Scheduler Laravel

```php
// app/Console/Kernel.php

protected function schedule(Schedule $schedule)
{
    $schedule->command('bus:update-locations')
             ->everyMinute();
}
```

## Performance

### 1. Cache Redis
```bash
# Installer Redis
sudo apt install redis-server

# Configuration Laravel
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis
```

### 2. Queue pour les notifications
```bash
# Lancer le worker
php artisan queue:work --daemon
```

## Support

### Contact technique
- Email : support@votre-domaine.sn
- Téléphone : +221 XX XXX XX XX

### Heures de support
- Lundi - Vendredi : 8h - 18h (GMT)
- Samedi : 9h - 13h (GMT)

---

**Prêt pour le déploiement à Dakar ! 🇸🇳**
