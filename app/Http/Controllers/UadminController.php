<?php

namespace App\Http\Controllers;

class UadminController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:admin|uadmin' ] );
    }
    protected function render( $view = 'layouts.templates.contents.content' )
    {
        return parent::render( $view );
    }
}