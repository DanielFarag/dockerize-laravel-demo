<?php

use Illuminate\Support\Facades\Route;
use App\Models\User;

Route::prefix('api')->group(function () {
    Route::get('/users', function () {
        return response()->json(User::all());
    });
});