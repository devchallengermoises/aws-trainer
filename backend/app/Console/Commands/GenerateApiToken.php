<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\User;

class GenerateApiToken extends Command
{
    protected $signature = 'token:generate {userId} {name=frontend}';
    protected $description = 'Generates a Sanctum token for a user';

    public function handle(): int
    {
        $user = User::find($this->argument('userId'));

        if (! $user) {
            $this->error('User not found');
            return 1;
        }

        $token = $user->createToken($this->argument('name'))->plainTextToken;

        $this->info("Token: {$token}");
        return 0;
    }
}
