<?php

namespace Database\Seeders\DVA_C02;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question2Seeder extends Seeder
{
    public function run(): void
    {
        // Get the DVA-C02 exam type
        $examType = ExamType::where('code', 'DVA-C02')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A developer is creating an AWS Lambda function that processes messages from an Amazon SQS queue. During testing, the developer notices that some messages are being processed more than once.

What should the developer do to ensure that duplicate message processing does not result in unintended side effects? (Choose TWO.)',
            'exam_type_id' => $examType->id
        ]);

        // Insert possible answers
        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Ensure that the Lambda function is idempotent by checking whether the message has already been processed before performing actions.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Enable content-based deduplication on the SQS queue to prevent the same message body from being sent multiple times.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Increase the batch size in the event source mapping configuration to reduce the number of individual invocations.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use Amazon EventBridge instead of SQS to avoid message duplication.',
                'is_correct' => false,
            ],
        ]);
    }
}