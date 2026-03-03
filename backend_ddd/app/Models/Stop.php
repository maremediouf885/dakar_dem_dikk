<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Stop extends Model
{
    protected $fillable = ['name', 'latitude', 'longitude'];

    public function buses(): BelongsToMany
    {
        return $this->belongsToMany(Bus::class, 'stop_bus');
    }
}
