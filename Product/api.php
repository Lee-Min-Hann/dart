<?php

// use Illuminate\Http\Request;

use App\Http\Controllers\Api\AuthController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ProductController;
use App\Models\User;
use Illuminate\Http\Request;
// use App\Http\Controllers\AuthController;

// // Endpoint untuk mengecek status API
// Route::get('/ping', function () {
//     return response()->json(['message' => 'API is working!']);
// });
// Route::post('auth/login',[AuthController::class,'login']);
// // Endpoint contoh untuk mengambil daftar pengguna
// Route::get('/users', function () {
//     return response()->json([
//         ['id' => 1, 'name' => 'Mimin', 'email' => 'mimin@example.com'],
//         ['id' => 2, 'name' => 'John Doe', 'email' => 'john@example.com']
//     ]);
// });

// // Endpoint contoh untuk menerima request dengan parameter
// Route::get('/hello/{name}', function ($name) {
//     return response()->json(['message' => "Hello, $name!"]);
// });

// Route::post('/register', [AuthController::class, 'register']);

// Route::middleware('auth:sanctum')->group(function () {
//     Route::post('/logout', [AuthController::class, 'logout']);
// });
Route::post('auth/login',[AuthController::class,'login']);
Route::post('auth/register',[AuthController::class,'register']);
Route::middleware('auth:sanctum')->group(function () {
Route::post('logout', [AuthController::class, 'logout']);

});

Route::middleware('auth:sanctum')->get('auth/me', [AuthController::class, 'me']);
use App\Http\Controllers\Api\CategoryController;

Route::middleware('auth:sanctum')->group(function () {
    Route::apiResource('categories', CategoryController::class);
    Route::apiResource('products', ProductController::class);
});

