<?php

namespace Database\Seeders\SAA_C03;

use Illuminate\Database\Seeder;

class SAA_C03Seeder extends Seeder
{
    public function run(): void
    {
        $this->call([
            Question1Seeder::class,
            Question2Seeder::class,
            Question3Seeder::class
        ]);
    }
}
