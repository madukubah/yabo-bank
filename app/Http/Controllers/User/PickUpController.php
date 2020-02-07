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
use DB;

class PickUpController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:customer|driver|uadmin' ], ['only' => ['index'], ] );
        $this->middleware( [ 'role:driver' ], ['only' => ['process'] ] );
        $this->middleware( [ 'role:uadmin' ], ['only' => ['store'] ] );
        $this->data[ 'page_title' ]          = 'Penjemputan';
        $this->data[ 'menu_id' ] = "pickups";

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
            $this->data[ 'page_title' ]          = 'Transaksi';
            $table[ 'header' ]  = [ 
                // 'id'                            => 'ID',
                'request->code'                 => 'Kode Request',
                'request->customer->user->name' => 'Nama Customer',
                'request->info'                 => 'Keterangan',
             ];
            $table[ 'number' ]  = 1;
            // DRIVer
            $table[ 'rows' ]    = Auth::user()->userable->pickUps->where( 'status',  0 );
            $table[ 'action' ]  = [
                "link" => [
                    "dataParam"     => "id",
                    "linkName"      => "Proses",
                    "url"           => url('pickup/process/'),
                    "buttonColor"   => "success",
                ],//link
            ];
        }
        else if ( Auth::user()->hasRole( 'customer' ) )
        {
            $table[ 'header' ]  = [ 
                'code'                          => 'Kode Request',
                'info'                          => 'Keterangan',
                'pickUp->driver->user->name'    => 'Driver Penjemput',
                'pickUp->created_at'            => 'Waktu Penjemputan dibuat',
            ];
            $table[ 'number' ]  = 1;
            // customer
            $table[ 'rows' ]    = Auth::user()->userable->requests->where( 'status',  1 );
        }
        else // uadmin
        {
            $table[ 'header' ]  = [ 
                'request->code'                 => 'Kode Request',
                'request->customer->user->name' => 'Nama Customer',
                'driver->user->name'            => 'Driver Penjemput',
            ];
            $table[ 'number' ]  = 1;
            // customer
            $table[ 'rows' ]    = PickUp::where( 'status',  0 )->get();
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
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function process($id)
    {
        $pickup = Auth::user()->userable->pickUps->find( $id );
        $request = $pickup->request;
        $this->data[ 'request' ]            = $request;
        $formProduct = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                'product[]' => [
                    'type' => 'select',
                    'label' => 'Role Name',
                    'labeled' => false,
                    'options' => DB::table('price_lists')->pluck( 'name', 'id' ) ,
                    'value' => '',
                ],
        ]] );
        $this->data[ 'formProduct' ]            = $formProduct;
        $this->data[ 'products' ]               = DB::table('price_lists')->pluck( 'price', 'id' );
        $this->data[ 'units' ]                  = DB::table('price_lists')->pluck( 'unit', 'id' );
        // dd( $this->data[ 'products' ] );die;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Proses Penjemputan';
        $this->data[ 'header' ]              = '';//$pickup->request->code;
        $this->data[ 'sub_header' ]          = '';
        
        return $this->render( 'pickup.process' );
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
            'driver_id' => ['required'],
        ] );
        // dd( $request->input()  );die;
        foreach( $request->input('request_id') as $ind => $request_id ):
            PickUp::create([
                'request_id'=> $request_id,
                'driver_id' => $request->input('driver_id') ,
                'status'    => 0,
            ]);
            RequestModel::findOrFail( $request_id )->update([
                'status'    => 1,
            ]);
        endforeach;
        
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
