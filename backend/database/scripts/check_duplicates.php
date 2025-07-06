<?php

require __DIR__ . '/../../vendor/autoload.php';

$app = require_once __DIR__ . '/../../bootstrap/app.php';
$app->make(\Illuminate\Contracts\Console\Kernel::class)->bootstrap();

use App\Models\Question;
use App\Models\ExamType;

// Get all exam types
$examTypes = ExamType::all();

foreach ($examTypes as $examType) {
    echo "\nChecking duplicates for exam type: {$examType->name} ({$examType->code})\n";
    
    // Get all questions for this exam type
    $questions = Question::where('exam_type_id', $examType->id)->get();
    
    // Create an array to store question texts
    $questionTexts = [];
    $duplicates = [];
    
    foreach ($questions as $question) {
        // Normalize the question text (remove extra spaces, newlines, etc.)
        $normalizedText = trim(preg_replace('/\s+/', ' ', $question->question));
        
        if (isset($questionTexts[$normalizedText])) {
            $duplicates[] = [
                'id' => $question->id,
                'text' => $normalizedText,
                'duplicate_of' => $questionTexts[$normalizedText]
            ];
        } else {
            $questionTexts[$normalizedText] = $question->id;
        }
    }
    
    if (empty($duplicates)) {
        echo "No duplicates found.\n";
    } else {
        echo "Found " . count($duplicates) . " duplicate questions:\n";
        foreach ($duplicates as $duplicate) {
            echo "Question ID {$duplicate['id']} is a duplicate of Question ID {$duplicate['duplicate_of']}\n";
            echo "Text: {$duplicate['text']}\n\n";
        }
    }
} 