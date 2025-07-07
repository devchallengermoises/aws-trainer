<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ExamTypeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run(): void
    {
        DB::table('exam_types')->insert([
            [
                'name' => 'AWS SysOps Administrator',
                'code' => 'SOA-C02',
                'description' => 'AWS SysOps Administrator - Associate certification exam',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'AWS Solutions Architect',
                'code' => 'SAA-C03',
                'description' => 'AWS Solutions Architect - Associate certification exam',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'name' => 'AWS Developer',
                'code' => 'DVA-C02',
                'description' => 'AWS Certified Developer - Associate certification exam',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
} 