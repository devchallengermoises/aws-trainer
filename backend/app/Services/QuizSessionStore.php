<?php

namespace App\Services;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redis;
use App\Models\Question;
use App\Models\Answer;

class QuizSessionStore
{
    private const SESSION_PREFIX = 'quiz_session:';

    protected function key(): string
    {
        return self::SESSION_PREFIX . Auth::id();
    }

    public function start(array $questionIds, array $answerOrders, array $correctAnswers): void
    {
        $this->save([
            'question_ids' => $questionIds,
            'answer_order' => $answerOrders,
            'correct_answers' => $correctAnswers,
            'answers' => [],
            'start_time' => now()->timestamp,
            'current_index' => 0,
        ]);
    }

    public function get(): array
    {
        return json_decode(Redis::get($this->key()), true) ?? [];
    }

    public function save(array $data): void
    {
        Redis::set($this->key(), json_encode($data));
    }

    public function exists(): bool
    {
        return Redis::exists($this->key()) > 0;
    }

    public function getCurrentIndex(): int
    {
        return $this->get()['current_index'] ?? 0;
    }

    public function setCurrentIndex(int $index): void
    {
        $data = $this->get();
        $data['current_index'] = $index;
        $this->save($data);
    }

    public function getQuestionIdByIndex(int $index): ?int
    {
        $data = $this->get();
        return $data['question_ids'][$index] ?? null;
    }

    public function getAnswerOrder(int $questionId): array
    {
        $data = $this->get();
        return $data['answer_order'][$questionId] ?? [];
    }

    public function getCorrectAnswers(int $questionId): array
    {
        $data = $this->get();
        return $data['correct_answers'][$questionId] ?? [];
    }

    public function submitAnswer(int $questionId, array $answerIds, bool $correct): void
    {
        $data = $this->get();
        $data['answers'][$questionId] = [
            'selected' => $answerIds,
            'correct' => $correct,
        ];
        $this->save($data);
    }

    public function getUserAnswers($questionId): array
    {
        $data = $this->get();
        return $data['answers'][$questionId]['selected'] ?? [];
    }

    public function total(): int
    {
        return count($this->get()['question_ids'] ?? []);
    }

    public function clear(): void
    {
        Redis::del($this->key());
    }
}
