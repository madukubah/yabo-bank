<?php

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
use Illuminate\Http\Request;

Route::get('/', function () {
    return view('welcome');
});

Route::get("/berita", "BeritaController@index"  )->name( 'berita' );

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
Route::get('/s-admin', 'S_admin\HomeController@index')->name('s-admin');
Route::resource('/roles', 'S_admin\RoleController');

Route::get('/menus_role/{role}', 'S_admin\MenuController@role')->name("menu_role");
Route::resource('/menus', 'S_admin\MenuController');

Route::resource('/users', 'S_admin\UsersManagementController');

Route::resource('/profiles', 'User\ProfileController');
Route::resource('/pricelists', 'User\PriceListController');

Route::resource('/invoices', 'User\InvoiceController');
Route::post('/invoices/create', 'User\InvoiceController@create')->name( 'invoices.create' );

Route::resource('/requests', 'User\RequestController');
Route::resource('/pickups', 'User\PickUpController');

Route::get('/pickup/process/{role}', 'User\PickUpController@process')->name("pickup_process");

Route::resource('/mutations', 'User\MutationController');
Route::post('/withdrawal', 'User\MutationController@withdrawal')->name('withdrawal');
Route::post('/confirm_withdrawal', 'User\MutationController@confirmWithdrawal')->name('confirm.withdrawal');

Route::resource('/transactions', 'User\TransactionController');  

Route::resource('/customers', 'User\CustomerController');
Route::resource('/drivers', 'User\DriverController');


