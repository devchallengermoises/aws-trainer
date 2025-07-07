<?php

namespace Database\Seeders\SAA_C03;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question3Seeder extends Seeder
{
    public function run(): void
    {
        // Get the SAA-C03 exam type
        $examType = ExamType::where('code', 'SAA-C03')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A company is planning to deploy a static website globally for marketing purposes. The website will have images and videos, and must load quickly for users around the world while minimizing cost.

Which combination of actions should a solutions architect take to meet these requirements? (Choose THREE.)',
            'exam_type_id' => $examType->id
        ]);

        // Insert possible answers
        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Store the website content in an Amazon S3 bucket configured for static website hosting.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use Amazon CloudFront to cache the content at edge locations globally.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Deploy the website to multiple EC2 instances in different AWS Regions.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Enable S3 Transfer Acceleration on the bucket to improve upload speed.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Configure the S3 bucket to block public access and use an OAI (Origin Access Identity) with CloudFront.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Store the content in Amazon EBS volumes attached to EC2 instances.',
                'is_correct' => false,
            ],
        ]);
    }
}