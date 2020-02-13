<?php

namespace App\Http\Controllers\S_admin;

use Illuminate\Http\Request;
use App\Http\Controllers\AdminController;
use Auth;
use App\Model\Customer;


class HomeController extends AdminController
{
    public function __construct()
    {
        parent::__construct();
    }
    public function index()
    {
        // dd( Auth::user()->find(6)->userable->code );
        // dd( Customer::find(1)->user->name );
        return $this->render( 'layouts.templates.contents.content' );
    }
}