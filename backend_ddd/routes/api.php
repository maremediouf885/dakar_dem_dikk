<?php

use App\Http\Controllers\Api\StopController;
use App\Http\Controllers\Api\BusController;
use Illuminate\Support\Facades\Route;

Route::get('/stops', [StopController::class, 'index']);
Route::get('/stops/{stop}/buses', [StopController::class, 'buses']);
Route::get('/buses/{bus}', [BusController::class, 'show']);
Route::get('/buses/{bus}/location', [BusController::class, 'location']);
