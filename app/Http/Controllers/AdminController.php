<?php

namespace App\Http\Controllers;

class AdminController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:admin' ] );
    }
    protected function render( $view = 'layouts.templates.contents.content' )
    {
        return parent::render( $view );
    }
}
