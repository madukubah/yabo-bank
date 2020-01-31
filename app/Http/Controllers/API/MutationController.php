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
    public function index( Request $request )
    {
        $from   = $request->input('start');
        $from ||  $from = date( "Y-m-d", strtotime("-1 month", time() )  );

        $to     = $request->input('end');
        $to ||  $to = date( "Y-m-d" );

        $to = date( "Y-m-d", strtotime("+1 day", strtotime( $to ) )  );
        // Reservation::whereBetween('reservation_from', [$from, $to])->get();
        // $data['mutations']              = Mutation::accountBook(  Auth::user()->userable->id )->get();
        $data['mutations']              = Mutation::where( 'customer_id', Auth::user()->userable->id )
                                                    ->whereBetween( 'created_at', [ $from, $to ] )
                                                    ->orderBy( 'id', 'desc' )->get();

        $balance                        = Mutation::getAccumulations( Auth::user()->userable->id, $position = 0 )->first();
        $data['balance']                = ( $balance != NULL ) ? ( $balance->total ) : 0 ;

        $credit                         = Mutation::getAccumulations( Auth::user()->userable->id,$position =  1, $from , $to )->first();
        $data['credit']                 = ( $credit != NULL ) ? ( $credit->total ) : 0 ;

        $debit                          = Mutation::getAccumulations( Auth::user()->userable->id, $position = 2, $from , $to )->first();
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
