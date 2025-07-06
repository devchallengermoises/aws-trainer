<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class ExamType extends Model
{
    protected $fillable = [
        'name',
        'code',
        'description',
    ];

    /**
     * Get the questions for the exam type.
     */
    public function questions(): HasMany
    {
        return $this->hasMany(Question::class);
    }
} 