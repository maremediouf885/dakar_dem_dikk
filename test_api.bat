@echo off
echo ========================================
echo Test de l'API Dakar Dem Dikk
echo ========================================
echo.

echo 1. Test de l'endpoint /api/stops
echo.
curl -s http://localhost:8000/api/stops | findstr "data"
echo.
echo.

echo 2. Test de l'endpoint /api/buses
echo.
curl -s http://localhost:8000/api/buses | findstr "data"
echo.
echo.

echo 3. Verification de la base de donnees
echo.
cd backend_ddd
php artisan tinker --execute="echo 'Stops: ' . App\Models\Stop::count() . PHP_EOL; echo 'Buses: ' . App\Models\Bus::count() . PHP_EOL; echo 'Positions: ' . App\Models\BusLocation::count() . PHP_EOL;"
cd ..
echo.

echo ========================================
echo Tests termines !
echo ========================================
echo.
echo Si vous voyez des donnees ci-dessus, l'API fonctionne correctement.
echo.
echo Pour lancer l'app Flutter :
echo   cd front_ddd
echo   flutter run
echo.
pause
