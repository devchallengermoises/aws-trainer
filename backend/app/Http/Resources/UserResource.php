<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Support\Facades\Auth;

class UserResource extends JsonResource
{
    public function toArray($request): array
    {
        return [
            'name' => $this->resource->name,
            'email' => $this->resource->email,
        ];
    }
}
