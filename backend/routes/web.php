<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return response()->json([
        'message' => 'Certification Trainer API is running.',
        'version' => '1.0.0',
        'status' => 'OK',
    ]);
});

// Luego el catch-all (solo si quieres servir frontend aquí también)
Route::get('/{any}', fn () => view('app'))
    ->where('any', '.*')
    ->middleware('web');