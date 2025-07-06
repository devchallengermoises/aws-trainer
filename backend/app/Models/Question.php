<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Question extends Model
{
    use HasFactory;

    protected $fillable = [
        'question',
        'exam_type_id'
    ];
    
    protected $hidden = ['created_at', 'updated_at'];

    /**
     * Get the exam type that owns the question.
     */
    public function examType(): BelongsTo
    {
        return $this->belongsTo(ExamType::class);
    }

    /**
     * Get the answers for the question.
     */
    public function answers(): HasMany
    {
        return $this->hasMany(Answer::class)->inRandomOrder();
    }

    /**
     * Indica si la pregunta es de selección múltiple.
     */
    public function getIsMultipleChoiceAttribute(): bool
    {
        return $this->answers()->where('is_correct', true)->count() > 1;
    }

    /**
     * Devuelve la cantidad máxima de respuestas seleccionables (respuestas correctas).
     */
    public function getMaxSelectableAttribute(): int
    {
        return $this->answers()->where('is_correct', true)->count();
    }
}
