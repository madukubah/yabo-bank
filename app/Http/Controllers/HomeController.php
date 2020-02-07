<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use App\UserRole;

class HomeController extends UserController
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    
    public function __construct()
    {
        parent::__construct();
        
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        // dd( ${Auth::user()->userable_type} );die;
        return $this->render(  );
    }
}
