<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BusResource;
use App\Http\Resources\BusLocationResource;
use App\Models\Bus;

class BusController extends Controller
{
    public function index()
    {
        $buses = Bus::with('currentLocation')->get();
        return BusResource::collection($buses);
    }

    public function show($id)
    {
        $bus = Bus::with('stops', 'currentLocation')->findOrFail($id);
        return new BusResource($bus);
    }

    public function getLocation($id)
    {
        $bus = Bus::with('currentLocation')->findOrFail($id);
        $location = $bus->currentLocation;
        
        if (!$location) {
            return response()->json(['message' => 'Aucune position disponible'], 404);
        }
        
        return new BusLocationResource($location);
    }
}
