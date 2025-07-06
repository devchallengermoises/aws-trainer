<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class SeedExamData extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'exam:seed {--force : Force the operation without confirmation}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Wipe exam tables and seed fresh exam data for study purposes';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        if (!$this->option('force')) {
            if (!$this->confirm('This will delete ALL exam data (questions, answers, exam types) and recreate them. Are you sure?')) {
                $this->info('Operation cancelled.');
                return 0;
            }
        }

        $this->info('Starting exam data seeding process...');

        try {
            // Disable foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=0;');
            
            $this->info('Wiping existing exam data...');
            
            // Wipe tables in correct order
            DB::table('answers')->truncate();
            $this->info('✓ Answers table wiped');
            
            DB::table('questions')->truncate();
            $this->info('✓ Questions table wiped');
            
            DB::table('exam_types')->truncate();
            $this->info('✓ Exam types table wiped');
            
            // Re-enable foreign key checks
            DB::statement('SET FOREIGN_KEY_CHECKS=1;');
            
            $this->info('Running seeders...');
            
            // Run the database seeder
            $this->call('db:seed', ['--class' => 'DatabaseSeeder']);
            
            $this->info('✓ Exam data seeded successfully!');
            $this->info('Total exam types created: ' . DB::table('exam_types')->count());
            $this->info('Total questions created: ' . DB::table('questions')->count());
            $this->info('Total answers created: ' . DB::table('answers')->count());
            
            return 0;
            
        } catch (\Exception $e) {
            $this->error('Error during seeding: ' . $e->getMessage());
            return 1;
        }
    }
} 