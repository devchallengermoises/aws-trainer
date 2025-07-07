<?php

namespace Database\Seeders\SOA_C02;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question2Seeder extends Seeder
{
    public function run(): void
    {
        // Get the SysOps exam type
        $examType = ExamType::where('code', 'SOA-C02')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A company is monitoring an Amazon EC2 instance that runs a critical application. The SysOps administrator must ensure that the team is alerted immediately if the instance becomes unreachable or if its CPU usage exceeds 90% for 5 consecutive minutes. Which actions will meet these requirements? (Select TWO.)',
            'exam_type_id' => $examType->id
        ]);

        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Create an Amazon CloudWatch alarm for the EC2 instance with the metric "StatusCheckFailed" set to ALARM when greater than 0 for 1 consecutive period. Attach an SNS topic for notifications.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Create a CloudWatch alarm using the "CPUUtilization" metric. Set the threshold to 90%, period to 60 seconds, and evaluation period to 5. Attach an SNS topic to send an alert.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Enable AWS Config to record all EC2 instance changes and configure a rule to detect high CPU usage and notify the team.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Use AWS CloudTrail to detect abnormal behavior in EC2 usage and trigger an alarm using Amazon EventBridge.',
                'is_correct' => false,
            ],
        ]);
    }
}