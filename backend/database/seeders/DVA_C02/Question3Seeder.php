<?php

namespace Database\Seeders\DVA_C02;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question3Seeder extends Seeder
{
    public function run(): void
    {
        // Get the DVA-C02 exam type
        $examType = ExamType::where('code', 'DVA-C02')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A developer is designing a RESTful API using Amazon API Gateway and AWS Lambda. The API must be secure, scalable, and easy to manage. The API will be used by third-party developers and must provide controlled access.

Which of the following should the developer implement to meet these requirements? (Choose THREE.)',
            'exam_type_id' => $examType->id
        ]);

        // Insert possible answers
        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Use Amazon Cognito user pools to authenticate users and generate JWT tokens.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use API Gateway usage plans and API keys to manage and throttle access for each third-party developer.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Store API credentials in plaintext in Lambda environment variables for quick access.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Enable AWS WAF on the API Gateway stage to protect against common web exploits.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use an Amazon EC2 instance behind a Network Load Balancer to host the API.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Disable throttling and rate limiting to ensure better performance for all users.',
                'is_correct' => false,
            ],
        ]);
    }
}