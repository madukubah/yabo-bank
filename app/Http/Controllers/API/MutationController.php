<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;

use App\Model\Mutation;
use App\Model\Customer;
use Session;
use Auth;
use App\Alert;

class MutationController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $data['mutations']              = Mutation::accountBook(  Auth::user()->userable->id )->get();
        $data['mutations']              = Mutation::where( 'customer_id', Auth::user()->userable->id )->orderBy( 'id', 'desc' )->get();

        $data['balance']                = Mutation::getAccumulations( Auth::user()->userable->id )->first()->total;
        $data['credit']                 = Mutation::getAccumulations( Auth::user()->userable->id, 1 )->first()->total;
        $debit                          = Mutation::getAccumulations( Auth::user()->userable->id, 2 )->first();
        $data['debit']                  = ( $debit != NULL ) ? abs( $debit->total ) : 0 ;
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
