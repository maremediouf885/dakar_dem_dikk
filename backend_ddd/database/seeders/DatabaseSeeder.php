<?php

namespace Database\Seeders;

use App\Models\Stop;
use App\Models\Bus;
use App\Models\BusLocation;
use App\Models\Driver;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    public function run(): void
    {
        // Arrêts principaux de Dakar
        $stops = [
            ['name' => 'Gare Routière Pompiers', 'latitude' => 14.6937, 'longitude' => -17.4441],
            ['name' => 'Place de l\'Indépendance', 'latitude' => 14.6728, 'longitude' => -17.4275],
            ['name' => 'Marché Sandaga', 'latitude' => 14.6760, 'longitude' => -17.4347],
            ['name' => 'Université Cheikh Anta Diop', 'latitude' => 14.6937, 'longitude' => -17.4441],
            ['name' => 'Plateau - Avenue Pompidou', 'latitude' => 14.6728, 'longitude' => -17.4347],
            ['name' => 'Médina - Rue 10', 'latitude' => 14.6850, 'longitude' => -17.4500],
            ['name' => 'Grand Yoff', 'latitude' => 14.7500, 'longitude' => -17.4700],
            ['name' => 'Parcelles Assainies', 'latitude' => 14.7600, 'longitude' => -17.4200],
            ['name' => 'Guédiawaye', 'latitude' => 14.7700, 'longitude' => -17.4100],
            ['name' => 'Pikine', 'latitude' => 14.7547, 'longitude' => -17.3906],
            ['name' => 'Thiaroye', 'latitude' => 14.7800, 'longitude' => -17.3500],
            ['name' => 'Rufisque', 'latitude' => 14.7167, 'longitude' => -17.2667],
            ['name' => 'Liberté 6', 'latitude' => 14.7100, 'longitude' => -17.4600],
            ['name' => 'Point E', 'latitude' => 14.7050, 'longitude' => -17.4500],
            ['name' => 'Mermoz', 'latitude' => 14.7200, 'longitude' => -17.4700],
            ['name' => 'Sacré-Coeur', 'latitude' => 14.7150, 'longitude' => -17.4650],
            ['name' => 'Ouakam', 'latitude' => 14.7300, 'longitude' => -17.4900],
            ['name' => 'Ngor', 'latitude' => 14.7500, 'longitude' => -17.5100],
            ['name' => 'Yoff', 'latitude' => 14.7450, 'longitude' => -17.4850],
            ['name' => 'HLM Grand Yoff', 'latitude' => 14.7400, 'longitude' => -17.4600],
        ];

        foreach ($stops as $stopData) {
            Stop::create($stopData);
        }

        // Lignes de bus Dakar Dem Dikk
        $buses = [
            ['number' => '4', 'line_name' => 'Liberté 6 - Petersen'],
            ['number' => '7', 'line_name' => 'Parcelles - Plateau'],
            ['number' => '8', 'line_name' => 'Pikine - Sandaga'],
            ['number' => '15', 'line_name' => 'Guédiawaye - Centre-ville'],
            ['number' => '16', 'line_name' => 'Thiaroye - Pompiers'],
            ['number' => '23', 'line_name' => 'Grand Yoff - Plateau'],
            ['number' => '24', 'line_name' => 'Ouakam - Sandaga'],
            ['number' => '29', 'line_name' => 'Rufisque - Dakar'],
            ['number' => '32', 'line_name' => 'Yoff - Centre-ville'],
            ['number' => '47', 'line_name' => 'HLM - Plateau'],
        ];

        foreach ($buses as $busData) {
            $bus = Bus::create($busData);
            
            $randomStops = Stop::inRandomOrder()->take(rand(5, 8))->pluck('id');
            $bus->stops()->attach($randomStops);
            
            BusLocation::create([
                'bus_id' => $bus->id,
                'latitude' => 14.6937 + (rand(-100, 100) / 1000),
                'longitude' => -17.4441 + (rand(-100, 100) / 1000),
            ]);
        }

        // Chauffeurs de test
        $drivers = [
            ['name' => 'Mamadou Diop', 'driver_code' => 'DDD001', 'phone' => '+221771234567', 'password' => Hash::make('password')],
            ['name' => 'Fatou Sall', 'driver_code' => 'DDD002', 'phone' => '+221762345678', 'password' => Hash::make('password')],
            ['name' => 'Ibrahima Ndiaye', 'driver_code' => 'DDD003', 'phone' => '+221773456789', 'password' => Hash::make('password')],
            ['name' => 'Aissatou Ba', 'driver_code' => 'DDD004', 'phone' => '+221764567890', 'password' => Hash::make('password')],
            ['name' => 'Ousmane Fall', 'driver_code' => 'DDD005', 'phone' => '+221775678901', 'password' => Hash::make('password')],
        ];

        foreach ($drivers as $driverData) {
            Driver::create($driverData);
        }
    }
}
