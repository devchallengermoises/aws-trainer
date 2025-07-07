<?php

namespace Database\Seeders\SOA_C02;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question1Seeder extends Seeder
{
    public function run(): void
    {
        // Get the SysOps exam type
        $examType = ExamType::where('code', 'SOA-C02')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A company is running a web application on Amazon EC2 instances behind an Application Load Balancer (ALB). The application stores data in an Amazon RDS database. The SysOps administrator needs to ensure that the database is automatically backed up daily and that old backups are retained for only 7 days to reduce costs. Which solution meets these requirements with the LEAST operational overhead?',
            'exam_type_id' => $examType->id
        ]);

        // Insert possible answers
        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Create a custom AWS Lambda function that creates daily database snapshots and deletes snapshots older than 7 days.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Enable automated backups in the RDS instance settings and set the backup retention period to 7 days.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Manually take snapshots every day and delete old snapshots using the AWS Management Console.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use AWS Backup to take daily snapshots and configure a lifecycle rule to delete backups after 30 days.',
                'is_correct' => false,
            ],
        ]);
    }
}