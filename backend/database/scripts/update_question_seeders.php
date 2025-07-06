<?php

$seedersDir = __DIR__ . '/../seeders';
$files = glob($seedersDir . '/Question*.php');

foreach ($files as $file) {
    $content = file_get_contents($file);
    
    // Add ExamType import if not exists
    if (!str_contains($content, 'use App\Models\ExamType;')) {
        $content = str_replace(
            'use App\Models\Answer;',
            "use App\Models\Answer;\nuse App\Models\ExamType;",
            $content
        );
    }
    
    // Add exam type retrieval if not exists
    if (!str_contains($content, 'ExamType::where')) {
        $content = str_replace(
            'public function run(): void',
            "public function run(): void\n    {\n        // Get the SysOps exam type\n        \$examType = ExamType::where('code', 'SOA-C02')->first();\n\n        // Create the question",
            $content
        );
    }
    
    // Add exam_type_id to question creation if not exists
    if (!str_contains($content, 'exam_type_id')) {
        $content = preg_replace(
            '/Question::create\(\[(.*?)\'question\' => (.*?)\'(.*?)\'(.*?)\]/s',
            "Question::create([\n            'question' => $2'$3',\n            'exam_type_id' => \$examType->id$4]",
            $content
        );
    }
    
    file_put_contents($file, $content);
    echo "Updated $file\n";
} 