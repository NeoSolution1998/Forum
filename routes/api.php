<?php

use App\Http\Controllers\Api\V1\Auth\AuthController;
use App\Http\Controllers\Api\V1\Auth\EmailVerificationController;
use App\Http\Controllers\Api\V1\Auth\PasswordController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
});

// Auth routes
Route::prefix('auth')->group(function () {
    Route::post('register', [AuthController::class, 'register']);
    Route::post('login', [AuthController::class, 'login']);
    Route::post('logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');
});
// Password routes
Route::post('password/reset-link', [PasswordController::class, 'sendResetLink']);
Route::post('password/reset', [PasswordController::class, 'resetPassword']);
Route::put('password', [PasswordController::class, 'updatePassword'])->middleware('auth:sanctum');

// Email Verification routes
Route::post('email/verification-link', [EmailVerificationController::class, 'sendVerificationLink'])
    ->middleware('auth:sanctum');
Route::post('email/verify', [EmailVerificationController::class, 'verifyEmail'])->middleware('auth:sanctum');
