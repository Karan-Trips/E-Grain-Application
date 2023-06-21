<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\fetchData;

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

Route::get('/', function () {
    return view('welcome');
});
Route::get('/welcome', function () {
    return view('welcome');
});


Route::get('/del', [fetchData::class, 'deleteProd']);

Route::get('/forgot', function () {
    return view('forgot');
});
Route::get('/contactus', function () {
    return view('contactus');
});

Route::get('/about', function () {
    return view('about');
});

Route::get('/home', function () {
    return view('homepage');
});
Route::get('/Order_detail', function () {
    return view('Orderstored');
});

Route::get('/orders', [fetchData::class, 'displayProducts']);

Route::get('/edit', [fetchData::class, 'editProducts']);

Route::get('/payments', function () {
    return view('payments');
});

Route::get('/show', [fetchData::class, 'show']);
Route::get('/saveProd', [fetchData::class, 'saveProd']);

Route::get('/stock_update', [fetchData::class, 'displayProd']);

Route::get('/delete/{id}', [fetchData::class, 'delProd']);

Route::get('/edit/{id}', [fetchData::class, 'edit']);

Route::get('/update/{id}', [fetchData::class, 'edit_show']);

Route::get('/Userdetail', [fetchData::class, 'userD']);