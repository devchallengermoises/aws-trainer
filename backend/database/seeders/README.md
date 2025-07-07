# AWS Exam Seeders

This directory contains all the seeders necessary to populate the database with practice questions for AWS certification exams.

## Structure

```
seeders/
├── DatabaseSeeder.php          # Main seeder that runs all others
├── ExamTypeSeeder.php          # Creates exam types (SOA-C02, SAA-C03, DVA-C02)
├── AdminUserSeeder.php         # Creates admin user
├── SOA_C02/                    # Questions for AWS SysOps Administrator
│   ├── Question1Seeder.php
│   ├── Question2Seeder.php
│   └── Question3Seeder.php
├── SAA_C03/                    # Questions for AWS Solutions Architect
│   ├── Question1Seeder.php
│   ├── Question2Seeder.php
│   └── Question3Seeder.php
└── DVA_C02/                    # Questions for AWS Developer
    ├── Question1Seeder.php
    ├── Question2Seeder.php
    └── Question3Seeder.php
```

## Exam Types

### SOA-C02 - AWS SysOps Administrator
- **Description**: Certification exam for AWS system administrators
- **Questions**: 3 practice questions
- **Topics**: Monitoring, backup, VPC, CloudWatch, RDS

### SAA-C03 - AWS Solutions Architect
- **Description**: Certification exam for AWS solution architects
- **Questions**: 3 practice questions
- **Topics**: S3, CloudFront, EC2, RDS, high availability

### DVA-C02 - AWS Developer
- **Description**: Certification exam for AWS developers
- **Questions**: 3 practice questions
- **Topics**: Lambda, S3, SQS, API Gateway, Cognito

## Usage

### Option 1: Custom Artisan command
```bash
# With confirmation
php artisan exam:seed

# Without confirmation (force)
php artisan exam:seed --force
```

### Option 2: Shell script
```bash
# With confirmation
./seed-exams.sh

# Without confirmation
./seed-exams.sh --force
```

### Option 3: Standard Laravel seeder
```bash
php artisan db:seed
```

## Features

### Automatic Wipe
- **Before each seeding**: All existing exam data is deleted
- **Affected tables**: `answers`, `questions`, `exam_types`
- **Purpose**: Ensure a clean environment for studying

### Security
- **Confirmation**: By default asks for confirmation before deleting data
- **Foreign Keys**: Safe handling of foreign key constraints
- **Rollback**: In case of error, existing data is not lost

### Detailed Information
- **Logs**: Shows detailed progress of the process
- **Statistics**: Shows summary of created data at the end
- **Errors**: Error handling with clear messages

## Development

### Adding New Questions

1. Create new seeder in the corresponding directory:
```bash
php artisan make:seeder SOA_C02/Question4Seeder
```

2. Implement the seeder logic:
```php
<?php

namespace Database\Seeders\SOA_C02;

use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;
use App\Models\ExamType;

class Question4Seeder extends Seeder
{
    public function run(): void
    {
        $examType = ExamType::where('code', 'SOA-C02')->first();
        
        $question = Question::create([
            'question' => 'Your question here...',
            'exam_type_id' => $examType->id
        ]);

        Answer::insert([
            [
                'question_id' => $question->id,
                'answer_text' => 'Answer 1',
                'is_correct' => false,
            ],
            [
                'question_id' => $question->id,
                'answer_text' => 'Answer 2',
                'is_correct' => true,
            ],
            // ... more answers
        ]);
    }
}
```

3. Register the seeder in `DatabaseSeeder.php`:
```php
$this->call([
    // ... other seeders
    \Database\Seeders\SOA_C02\Question4Seeder::class,
]);
```

### Adding New Exam Type

1. Add in `ExamTypeSeeder.php`:
```php
[
    'name' => 'New Exam',
    'code' => 'NEW-CODE',
    'description' => 'Description of the new exam',
    'created_at' => now(),
    'updated_at' => now(),
],
```

2. Create directory and seeders for the new exam
3. Register the seeders in `DatabaseSeeder.php`

## Important Notes

- **Study only**: Seeders are designed for study environments
- **Test data**: Questions are educational examples
- **Automatic wipe**: Data is always cleaned before seeding
- **Backup**: Consider making a backup before running in production 