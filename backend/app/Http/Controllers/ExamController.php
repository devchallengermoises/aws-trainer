<?php

namespace App\Http\Controllers;

use App\Services\QuestionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ExamController extends Controller
{
    private QuestionService $questionService;

    public function __construct(QuestionService $questionService)
    {
        $this->questionService = $questionService;
    }

    /**
     * Get available exam types
     *
     * @return JsonResponse
     */
    public function getExamTypes(): JsonResponse
    {
        $examTypes = ExamType::all();
        return response()->json($examTypes);
    }

    /**
     * Get random questions for a specific exam type
     *
     * @param Request $request
     * @return JsonResponse
     */
    public function getExamQuestions(Request $request): JsonResponse
    {
        $request->validate([
            'exam_type' => 'required|string',
            'count' => 'integer|min:1|max:100'
        ]);

        try {
            $questions = $this->questionService->getRandomQuestions(
                $request->exam_type,
                $request->count ?? null
            );

            return response()->json([
                'success' => true,
                'data' => $questions
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'success' => false,
                'message' => 'Failed to get exam questions',
                'error' => $e->getMessage()
            ], 500);
        }
    }
} 