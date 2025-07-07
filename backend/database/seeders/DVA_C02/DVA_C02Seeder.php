<?php

namespace Database\Seeders\DVA_C02;

use Illuminate\Database\Seeder;

class DVA_C02Seeder extends Seeder
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
