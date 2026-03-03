<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\StopResource;
use App\Http\Resources\BusResource;
use App\Models\Stop;

class StopController extends Controller
{
    public function index()
    {
        $stops = Stop::all();
        return StopResource::collection($stops);
    }

    public function buses(Stop $stop)
    {
        $stop->load('buses.currentLocation');
        return BusResource::collection($stop->buses);
    }
}
