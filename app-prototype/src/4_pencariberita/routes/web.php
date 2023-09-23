<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\SearchController;




Auth::routes(['register' => false, 'login' => false]);

Route::get('/home', [HomeController::class, 'index'])->name('home');

Route::get('/', [SearchController::class, 'searching']);
Route::post('/query', [SearchController::class, 'quering']);
