<?php

namespace Database\Seeders\SOA_C02;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question3Seeder extends Seeder
{
    public function run(): void
    {
        // Get the SysOps exam type
        $examType = ExamType::where('code', 'SOA-C02')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A company has two VPC networks named VPC A and VPC B. VPC A uses CIDR block 10.0.0.0/16 and VPC B uses 172.31.0.0/16. A VPC peering connection (pcx-12345) is successfully created between both VPCs. Which entries should be present in the route table of VPC A to ensure proper connectivity? (Select THREE.)',
            'exam_type_id' => $examType->id
        ]);

        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Destination: 10.0.0.0/16, Target: Local',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Destination: 172.31.0.0/16, Target: pcx-12345',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Ensure no overlapping CIDR ranges exist between VPC A and VPC B.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Destination: 172.31.0.0/16, Target: igw-12345678 (Internet Gateway)',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Destination: 10.0.0.0/16, Target: pcx-12345',
                'is_correct' => false,
            ],
        ]);
    }
}