<?php

namespace Database\Seeders\SAA_C03;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question1Seeder extends Seeder
{
    public function run(): void
    {
        // Get the SAA-C03 exam type
        $examType = ExamType::where('code', 'SAA-C03')->first();

        // Create the question
        $question = Question::create([
            'question' => 'A solutions architect needs to design a solution that stores financial reports in Amazon S3. The reports must be immediately available for download for 15 days. After 15 days, the reports must be archived in a way that allows access within minutes if needed.

Which solution will meet these requirements MOST cost-effectively?',
            'exam_type_id' => $examType->id
        ]);

        // Insert possible answers
        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Store the reports in S3 Standard and configure a lifecycle rule to transition them to S3 Glacier Flexible Retrieval after 15 days.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Store the reports in S3 Standard-Infrequent Access (S3 Standard-IA) and configure a lifecycle rule to transition them to S3 Glacier Deep Archive after 15 days.',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Store the reports in S3 Standard and configure a lifecycle rule to transition them to S3 Intelligent-Tiering with the Archive Instant Access tier after 15 days.',
                'is_correct' => true,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Store the reports in S3 One Zone-IA and configure a lifecycle rule to transition them to S3 Glacier after 15 days.',
                'is_correct' => false,
            ],
        ]);
    }
}