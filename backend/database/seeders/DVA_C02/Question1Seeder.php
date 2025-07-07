<?php

namespace Database\Seeders\DVA_C02;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question1Seeder extends Seeder
{
    public function run(): void
    {
        // Get the DVA-C02 exam type
        $examType = ExamType::where('code', 'DVA-C02')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A developer is building a serverless application that processes user-submitted images. The images are uploaded to an Amazon S3 bucket. The application must generate thumbnails for each image and store them in another S3 bucket. The solution must be highly available and cost-effective.

Which solution meets these requirements with the LEAST operational overhead?',
            'exam_type_id' => $examType->id
        ]);

        // Insert possible answers
        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Launch an Amazon EC2 instance that runs a script to monitor the S3 bucket and process new images.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Configure an S3 event notification to invoke an AWS Lambda function when a new image is uploaded. The function generates the thumbnail and stores it in the target S3 bucket.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use AWS Step Functions to run a polling service that checks the S3 bucket every minute and triggers an AWS Lambda function.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Create a scheduled Amazon CloudWatch Events rule to run an AWS Batch job every 5 minutes to check for new images.',
                'is_correct' => false,
            ],
        ]);
    }
}