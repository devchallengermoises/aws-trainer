<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run(){
        // Wipe tables before seeding (for study purposes)
        $this->wipeTables();
        
        $this->call([
            AdminUserSeeder::class,
            ExamTypeSeeder::class,
            // SOA-C02 (SysOps Administrator) Questions
            \Database\Seeders\SOA_C02\SOA_C02Seeder::class,
            // SAA-C03 (Solutions Architect) Questions
            \Database\Seeders\SAA_C03\SAA_C03Seeder::class,
            // DVA-C02 (Developer) Questions
            \Database\Seeders\DVA_C02\DVA_C02Seeder::class,
        ]);
    }

    /**
     * Wipe tables before seeding for clean study environment
     */
    private function wipeTables(): void
    {
        // Disable foreign key checks to avoid constraint issues
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        
        // Wipe tables in correct order (child tables first)
        DB::table('answers')->truncate();
        DB::table('questions')->truncate();
        DB::table('exam_types')->truncate();
        
        // Re-enable foreign key checks
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
        
        $this->command->info('Tables wiped successfully for clean seeding.');
    }
}
