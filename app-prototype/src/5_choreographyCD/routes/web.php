<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\SearchController;

use App\Http\Controllers\PostController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\FrontendController;



Auth::routes(['register' => false, 'login' => true]);

Route::get('/home', [HomeController::class, 'index'])->name('home');

Route::get('/', [SearchController::class, 'searching']);
Route::post('/query', [SearchController::class, 'quering']);


Route::group(['middleware' => 'auth'], function () {
  Route::resource('category', CategoryController::class);
  Route::get('/category/{idcategory}/delete', [CategoryController::class, 'delete']);

  Route::resource('post', PostController::class);
  Route::get('/post/{idpost}/delete', [PostController::class, 'delete']);
});

// Route::get('/', [FrontendController::class, 'beranda']);
Route::get('/home', [FrontendController::class, 'beranda']);
Route::get('/beranda', [FrontendController::class, 'beranda']);
Route::get('/detail/{id}', [FrontendController::class, 'detail']);
