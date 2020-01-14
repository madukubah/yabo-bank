<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use Auth;
use App\Alert;
use App\User;
use App\Model\PickUp;
use App\Model\Request as RequestModel ;

use Session;
use Illuminate\Support\Facades\Hash;

class PickUpController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:customer|driver' ], ['only' => ['index']] );
        $this->middleware( [ 'role:driver' ], ['only' => ['store']] );
        $this->data[ 'page_title' ]          = 'Penjemputan';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if( Auth::user()->hasRole( 'driver' )  )
        {
            $table[ 'header' ]  = [ 
                'request->code'                 => 'Kode Request',
                'request->customer->user->name' => 'Nama Customer',
                'request->info'                 => 'Keterangan',
             ];
            $table[ 'number' ]  = 1;
            $table[ 'rows' ]    = Auth::user()->userable->pickUps;
        }
        else
        {
            $table[ 'header' ]  = [ 
                'code'                          => 'Kode Request',
                'info'                          => 'Keterangan',
                'pickUp->driver->user->name'    => 'Driver Penjemput',
                'pickUp->created_at'            => 'Waktu Penjemputan dibuat',
            ];
            $table[ 'number' ]  = 1;
            $table[ 'rows' ]    = Auth::user()->userable->requests->where( 'status',  1 );
        }
       
        $table = view('layouts.templates.tables.plain_table', $table);

        $this->data[ 'contents' ]            = $table;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'header' ]              = 'Daftar Penjemputan di Terima ';
        $this->data[ 'sub_header' ]          = '';
        return $this->render(  );
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
        $request->validate( [
            'request_id' => ['required', 'unique:pick_ups'],
        ] );

        PickUp::create([
            'request_id'=> $request->input('request_id'),
            'driver_id' => Auth::user()->userable->id ,
            'status'    => 0,
        ]);
        RequestModel::findOrFail( $request->input('request_id') )->update([
            'status'    => 1,
        ]);
        return redirect()->route('requests.index')->with(['message' => Alert::setAlert( 1, "data berhasil di buat" ) ]);
        
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
