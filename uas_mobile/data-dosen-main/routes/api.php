<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\DataDosenController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::get('/biodosen', [DataDosenController::class, 'index']);
Route::get('/biodosen/{id}', [DataDosenController::class, 'show']);
Route::post('/biodosen', [DataDosenController::class, 'store']);
Route::put('/biodosen/{id}', [DataDosenController::class, 'update']);
Route::delete('/biodosen/{id}', [DataDosenController::class, 'destroy']);
