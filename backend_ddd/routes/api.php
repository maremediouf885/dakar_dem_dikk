<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\BusController;
use App\Http\Controllers\Api\StopController;
use App\Http\Controllers\Api\DriverController;

Route::get('/buses', [BusController::class, 'index']);
Route::get('/buses/{id}', [BusController::class, 'show']);
Route::get('/buses/{id}/location', [BusController::class, 'getLocation']);

Route::get('/stops', [StopController::class, 'index']);
Route::get('/stops/{id}', [StopController::class, 'show']);
Route::get('/stops/{id}/buses', [StopController::class, 'getBuses']);

// Routes pour les chauffeurs
Route::post('/driver/location', [DriverController::class, 'updateLocation']);
Route::post('/driver/start-session', [DriverController::class, 'startSession']);
Route::post('/driver/end-session', [DriverController::class, 'endSession']);
