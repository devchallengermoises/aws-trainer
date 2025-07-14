<?php
use App\Http\Controllers\UserController;
use App\Http\Controllers\QuizController;
use App\Services\QuizSessionStore;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ExamController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\ExamTypeController;

Route::post('/login', [AuthController::class, 'login']);
Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
Route::get('/sanctum/csrf-cookie', function () {
    return response()->json(['csrf' => csrf_token()]);
});


Route::middleware(['web', 'auth:sanctum'])->group(function () {
    Route::get('/user', [AuthController::class, 'user']);

    
    Route::post('/quiz/start', [QuizController::class, 'startQuiz']);
    Route::get('/quiz/question/{index}', [QuizController::class, 'fetchQuestion']);
    Route::post('/quiz/answer', [QuizController::class, 'submitAnswer']);
    Route::post('/quiz/finish', [QuizController::class, 'finish']);
    Route::post('/quiz/current-index', [QuizController::class, 'updateCurrentIndex']);
    Route::post('/quiz/clear', function () {
        $store = app(\App\Services\QuizSessionStore::class);
        $existed = $store->exists();
        $store->clear();
        \Log::info('Quiz session cleared', ['existed' => $existed]);
        return response()->json(['cleared' => true, 'existed' => $existed]);
    });
    Route::get('/quiz/validate-session', function () {
        $store = app(\App\Services\QuizSessionStore::class);
        return response()->json(['valid' => $store->exists()]);
    });
    Route::get('/exam-types', [ExamTypeController::class, 'index']);
});
