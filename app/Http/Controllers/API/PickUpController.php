<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Model\Request as RequestModel;

use App\User;

class PickUpController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if( Auth::user()->hasRole( 'driver' )  )
        {
            $data    = [];
            foreach( Auth::user()->userable->pickUps->where( 'status',  0 ) as $item )
            {
                $item->request;
                $item->customer_name    = $item->request->customer->user->name; 
                $item->customer_address = $item->request->customer->user->address; 
                $item->request_info     = $item->request->info;
                $item->customer_id      = $item->request->customer_id;
                $item->customer_phone   = $item->request->customer->user->phone;
                $item->request_date     = date( 'Y-m-d H:i:s', strtotime( $item->request->created_at ) ) ;
                $data[]= $item;
            }
        }
        else if ( Auth::user()->hasRole( 'customer' ) )
        {
            $data    = [];
            foreach( Auth::user()->userable->requests->where( 'status',  1 ) as $item )
            {
                $item->pickUp; 
                $data[]= $item;
            }
        }
        return $this->sendResponse( $data );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
