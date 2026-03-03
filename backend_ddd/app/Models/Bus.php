<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\HasOne;

class Bus extends Model
{
    protected $fillable = ['number', 'line_name'];

    public function stops(): BelongsToMany
    {
        return $this->belongsToMany(Stop::class, 'stop_bus');
    }

    public function locations(): HasMany
    {
        return $this->hasMany(BusLocation::class);
    }

    public function currentLocation(): HasOne
    {
        return $this->hasOne(BusLocation::class)->latestOfMany();
    }
}
