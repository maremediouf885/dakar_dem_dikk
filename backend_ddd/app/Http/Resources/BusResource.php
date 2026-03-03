<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class BusResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'number' => $this->number,
            'line_name' => $this->line_name,
            'current_location' => new BusLocationResource($this->whenLoaded('currentLocation')),
            'stops' => StopResource::collection($this->whenLoaded('stops')),
        ];
    }
}
