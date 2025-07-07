<?php

namespace Database\Seeders\SAA_C03;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question2Seeder extends Seeder
{
    public function run(): void
    {
        // Get the SAA-C03 exam type
        $examType = ExamType::where('code', 'SAA-C03')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A company is running a web application on a fleet of Amazon EC2 instances behind an Application Load Balancer (ALB). The instances are part of an Auto Scaling group across multiple Availability Zones. The application stores data in Amazon RDS.

The company wants to ensure that it can perform maintenance without any downtime to the application.

Which actions should a solutions architect take to meet this requirement? (Choose TWO.)',
            'exam_type_id' => $examType->id
        ]);

        // Insert possible answers
        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Use an RDS Multi-AZ deployment to ensure high availability of the database during maintenance.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Deploy the application in a single Availability Zone and use an Elastic IP for high availability.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use the ALB to drain connections from instances before terminating them during maintenance.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Replace the ALB with a Network Load Balancer (NLB) for better maintenance support.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use an RDS read replica in another Availability Zone and fail over manually during maintenance.',
                'is_correct' => false,
            ],
        ]);
    }
}