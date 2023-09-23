<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmployeeController;

use App\Http\Controllers\PostController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\FrontendController;
use App\Http\Controllers\FileController;


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

Route::get('/', function () {
    return redirect('/employee');
});

Route::get('/home', function () {
    return redirect('/employee');
});

Auth::routes(['register' => true]);

Route::group(['middleware' => 'auth'], function () {
    Route::resource('employee', EmployeeController::class);
    Route::get('/employee/{idemployee}/delete', [EmployeeController::class, 'delete']);
});


