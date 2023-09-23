<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\HomeController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Auth::routes(['register' => false, 'login' => false]);

Auth::routes();

// Route::get('/home', [HomeController::class, 'index'])->name('home');
Route::get('/', [HomeController::class, 'beranda'])->name('beranda');


Route::get('/beranda', function () {
    return view('beranda');
});

Route::get('/prototipe1', function () {
    return view('prototipe1');
});

Route::get('/prototipe2', function () {
    return view('prototipe2');
});

Route::get('/prototipe3', function () {
    return view('prototipe3');
});


Route::get('/prototipe4', function () {
    return view('prototipe5');
});


Route::get('/prototipe5', function () {
    return view('prototipe5');
});


Route::get('/prototipe6', function () {
    return view('prototipe6');
});




