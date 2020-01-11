<?php

namespace App\Http\Controllers\S_admin;

use Illuminate\Http\Request;
use App\Http\Controllers\AdminController;
use Auth;


class HomeController extends AdminController
{
    public function __construct()
    {
        parent::__construct();
    }
    public function index()
    {
        return $this->render( 'layouts.templates.contents.content' );
    }
}