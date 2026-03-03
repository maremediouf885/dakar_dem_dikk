<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bus;
use App\Models\BusLocation;
use Illuminate\Support\Facades\DB;

class DriverController extends Controller
{
    public function updateLocation(Request $request)
    {
        $request->validate([
            'bus_number' => 'required|string',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
        ]);

        // Trouver ou créer le bus
        $bus = Bus::firstOrCreate(
            ['number' => $request->bus_number],
            ['name' => 'Bus ' . $request->bus_number, 'capacity' => 50]
        );

        // Mettre à jour la position
        BusLocation::updateOrCreate(
            ['bus_id' => $bus->id],
            [
                'latitude' => $request->latitude,
                'longitude' => $request->longitude,
                'speed' => 0,
                'heading' => 0,
            ]
        );

        return response()->json([
            'success' => true,
            'message' => 'Position mise à jour',
            'bus' => $bus,
        ]);
    }

    public function startSession(Request $request)
    {
        $request->validate([
            'bus_number' => 'required|string',
        ]);

        $bus = Bus::where('number', $request->bus_number)->first();
        
        if (!$bus) {
            return response()->json(['error' => 'Bus non trouvé'], 404);
        }

        return response()->json([
            'success' => true,
            'message' => 'Session démarrée',
            'bus' => $bus,
        ]);
    }

    public function endSession(Request $request)
    {
        return response()->json([
            'success' => true,
            'message' => 'Session terminée',
        ]);
    }
}
