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
Route::post('/users_photo/{userId}', 'S_admin\UsersManagementController@uploadProfilPhoto')->name('users.upload_photo');

Route::resource('/profiles', 'User\ProfileController');
Route::post('/upload_photo', 'User\ProfileController@uploadProfilPhoto')->name('profile.upload_photo');
Route::post('/identity_photo/{customerId}', 'User\ProfileController@uploadIdendityPhoto')->name('customers.identity_photo');

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
Route::post('/customers_photo/{customerId}', 'User\CustomerController@uploadIdendityPhoto')->name('customers.upload_photo');

Route::resource('/drivers', 'User\DriverController');

Route::resource('/sellings', 'User\SellingController');
Route::get('/create_invoice/{so_id}', 'User\SellingController@createInvoice')->name( 'invoice.create' );
Route::post('/confirm_invoice', 'User\SellingController@confirmInvoice')->name( 'invoice.confirm' );

Route::resource('/cash_outs', 'User\CashOutController');
Route::resource('/payments', 'User\PaymentController');

Route::resource('/reports', 'User\ReportController');
Route::post('/processData', 'User\ReportController@processData')->name('process.data');