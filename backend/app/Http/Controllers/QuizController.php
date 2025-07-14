<?php

namespace App\Http\Controllers;

use App\Models\{Answer, Question, ExamType};
use App\Services\QuizSessionStore;
use Illuminate\Http\{Request, JsonResponse};
use Illuminate\Support\Facades\Validator;

class QuizController extends Controller
{
    protected QuizSessionStore $store;

    public function __construct(QuizSessionStore $store)
    {
        $this->store = $store;
    }

    public function startQuiz(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'exam_type_code' => 'required|string',
            'reset' => 'boolean'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $examTypeCode = $request->input('exam_type_code');
        $reset = $request->boolean('reset');

        \Log::info('Quiz start request', [
            'exam_type_code' => $examTypeCode,
            'reset' => $reset,
            'session_exists' => $this->store->exists()
        ]);

        $examType = ExamType::where('code', $examTypeCode)->firstOrFail();

        if ($reset || !$this->store->exists()) {
            \Log::info('Initializing new quiz session');
            $this->initializeQuiz($examType);
        } else {
            \Log::info('Using existing quiz session');
        }

        $response = [
            'question_count' => $this->store->total(),
            'current_index' => $this->store->getCurrentIndex(),
        ];

        \Log::info('Quiz start response', $response);

        return response()->json($response);
    }

    public function fetchQuestion(int $index): JsonResponse
    {
        $questionId = $this->store->getQuestionIdByIndex($index);

        if (!$questionId) {
            return response()->json(['error' => 'Question not found.'], 404);
        }

        $question = Question::findOrFail($questionId);
        $answerOrder = $this->store->getAnswerOrder($questionId);

        $answers = $this->formatAnswers($answerOrder);

        return response()->json([
            'question' => [
                'id' => $question->id,
                'question' => $question->question,
                'is_multiple_choice' => $question->is_multiple_choice,
                'max_selectable' => $question->max_selectable,
                'answers' => $answers,
            ],
            'index' => $index,
            'question_count' => $this->store->total(),
        ]);
    }

    public function submitAnswer(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'question_id' => 'required|integer',
            'answer_ids' => 'required|array',
            'answer_ids.*' => 'integer'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $questionId = $request->input('question_id');
        $answerIds = $request->input('answer_ids');

        $isCorrect = $this->validateAnswer($questionId, $answerIds);
        $this->store->submitAnswer($questionId, $answerIds, $isCorrect);

        $correctAnswerIds = $this->store->getCorrectAnswers($questionId);

        return response()->json([
            'isCorrect' => $isCorrect,
            'correct_answer_ids' => $correctAnswerIds,
        ]);
    }

    public function finish(): JsonResponse
    {
        $score = $this->calculateScore();

        return response()->json([
            'correct_answers' => $score['correct'],
            'total_questions' => $score['total'],
            'score_percent' => $score['percent'],
        ]);
    }

    public function updateCurrentIndex(Request $request): JsonResponse
    {
        $validator = Validator::make($request->all(), [
            'index' => 'required|integer|min:0'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        $index = $request->input('index');
        $this->store->setCurrentIndex($index);
        return response()->json(['success' => true]);
    }

    private function initializeQuiz(ExamType $examType): void
    {
        $questions = Question::where('exam_type_id', $examType->id)
            ->with('answers')
            ->inRandomOrder()
            ->take(65)
            ->get();

        $questionIds = $questions->pluck('id')->all();
        $answerOrders = [];
        $correctAnswers = [];

        foreach ($questions as $q) {
            $answers = $q->answers->pluck('id')->shuffle()->values()->all();
            $answerOrders[$q->id] = $answers;
            $correctAnswers[$q->id] = $q->answers->where('is_correct', true)->pluck('id')->all();
        }

        $this->store->start($questionIds, $answerOrders, $correctAnswers);
    }

    private function formatAnswers(array $answerOrder): array
    {
        return Answer::whereIn('id', $answerOrder)
            ->get()
            ->sortBy(fn($a) => array_search($a->id, $answerOrder))
            ->values()
            ->map(fn($a) => [
                'id' => $a->id,
                'answer_text' => $a->answer_text,
            ])
            ->toArray();
    }

    private function validateAnswer(int $questionId, array $answerIds): bool
    {
        $correctAnswers = $this->store->getCorrectAnswers($questionId);
        return empty(array_diff($correctAnswers, $answerIds)) && 
               empty(array_diff($answerIds, $correctAnswers));
    }

    private function calculateScore(): array
    {
        $totalQuestions = $this->store->total();
        $correctAnswers = 0;

        for ($i = 0; $i < $totalQuestions; $i++) {
            $questionId = $this->store->getQuestionIdByIndex($i);
            $correctAnswerIds = $this->store->getCorrectAnswers($questionId);
            $userAnswerIds = $this->store->getUserAnswers($questionId);
            
            if (empty(array_diff($correctAnswerIds, $userAnswerIds)) && 
                empty(array_diff($userAnswerIds, $correctAnswerIds))) {
                $correctAnswers++;
            }
        }

        return [
            'correct' => $correctAnswers,
            'total' => $totalQuestions,
            'percent' => round(($correctAnswers / $totalQuestions) * 100, 2),
        ];
    }
}
