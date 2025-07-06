<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use App\Models\Question;

class QuestionController extends Controller
{
    public function index(): JsonResponse
    {
        $questions = Question::with('answers')->inRandomOrder()->limit(10)->get();

        return response()->json($questions);
    }
}
