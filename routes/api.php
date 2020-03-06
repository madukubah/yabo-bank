<?php

use Illuminate\Http\Request;

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
// Route::post('register', 'API\RegisterController@register');
Route::post('login', 'API\AuthController@login');
Route::post('register', 'API\AuthController@register');

Route::group(['middleware' => 'auth:api'], function(){
    Route::get('logout', 'API\AuthController@logout');
    Route::get('pricelists', 'API\PriceListController@index');
});

Route::group(['middleware' => [ 'auth:api'] ], function(){
    Route::resource('profiles', 'API\ProfileController');
});
Route::post('/upload_photo', 'API\ProfileController@uploadProfilPhoto')->middleware('auth:api');
Route::get('/rubbish_summary', 'API\ProfileController@rubbishSummary')->middleware( [ 'auth:api', 'role:customer' ] );

Route::post('/upload_identity', 'API\ProfileController@uploadIdendityPhoto')->middleware([ 'auth:api', 'role:customer' ]);


Route::group(['middleware' => [ 'auth:api', 'role:customer'] ], function(){
    Route::resource('requests', 'API\RequestController');
    Route::get('mutations', 'API\MutationController@index');
});
Route::get('count_request', 'API\RequestController@countRequest');


Route::group(['middleware' => [ 'auth:api', 'role:driver'] ], function(){
    Route::resource('invoices', 'API\InvoiceController');
    Route::get('transactions', 'API\TransactionController@index');

});

Route::group(['middleware' => [ 'auth:api', 'role:driver'] ], function(){
    Route::get('pickups', 'API\PickUpController@index');
});
Route::resource('/promotions', 'API\PromotionController');
Route::resource('/news', 'API\NewsController');

// Route::middleware('auth:api')->group( function () {
// 	Route::resource('products', 'API\ProductController');
// });

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
