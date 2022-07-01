<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiController;
use Illuminate\Support\Facades\Auth;
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


Route::post('/auth/register', [ApiController::class, 'registration'])->name('register');
Route::post('/auth/login', [ApiController::class, 'login'])->name('login');
Route::post('/page/create', [ApiController::class, 'createPage'])->name('createPage');
Route::post('/follow/person/{personId}', [ApiController::class, 'followUser'])->name('followUser');
Route::post('/follow/page/{pageId}', [ApiController::class, 'followPage'])->name('followPage');
Route::post('/person/attach-post', [ApiController::class, 'AddUserPost'])->name('AddUserPost');
Route::post('/page/{pageId}/attach-post', [ApiController::class, 'AddPagePost'])->name('AddPagePost');
Route::get('/person/feed', [ApiController::class, 'GetFeed'])->name('GetFeed');

