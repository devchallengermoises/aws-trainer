<?php

namespace App\Http\Controllers;

use App\Models\ExamType;
use Illuminate\Http\JsonResponse;

class ExamTypeController extends Controller
{
    /**
     * Get all exam types
     */
    public function index(): JsonResponse
    {
        $examTypes = ExamType::all();
        return response()->json($examTypes);
    }
} 