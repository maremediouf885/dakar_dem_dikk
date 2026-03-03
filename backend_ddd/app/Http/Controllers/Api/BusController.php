<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\BusResource;
use App\Http\Resources\BusLocationResource;
use App\Models\Bus;

class BusController extends Controller
{
    public function show(Bus $bus)
    {
        $bus->load('stops', 'currentLocation');
        return new BusResource($bus);
    }

    public function location(Bus $bus)
    {
        $location = $bus->currentLocation;
        return new BusLocationResource($location);
    }
}
