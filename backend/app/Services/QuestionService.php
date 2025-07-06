<?php

namespace App\Services;

use App\Models\Question;
use App\Models\ExamType;
use Illuminate\Database\Eloquent\Collection;

class QuestionService
{
    private const DEFAULT_QUESTIONS_COUNT = 65;

    /**
     * Get random questions for a specific exam type
     *
     * @param string $examTypeCode
     * @param int $count
     * @return Collection
     */
    public function getRandomQuestions(string $examTypeCode, int $count = self::DEFAULT_QUESTIONS_COUNT): Collection
    {
        $examType = $this->getExamTypeByCode($examTypeCode);
        
        return Question::where('exam_type_id', $examType->id)
            ->inRandomOrder()
            ->take($count)
            ->with('answers')
            ->get();
    }

    /**
     * Get exam type by code
     *
     * @param string $code
     * @return ExamType
     * @throws \Illuminate\Database\Eloquent\ModelNotFoundException
     */
    private function getExamTypeByCode(string $code): ExamType
    {
        return ExamType::where('code', $code)->firstOrFail();
    }
} 