<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use Auth;
use App\Alert;
use App\User;
use App\Model\Driver;
use Session;
use Validator;


use App\Model\Request as RequestModel ;


class RequestController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:customer' ], ['only' => ['store', 'update']] );
        $this->middleware( [ 'role:uadmin|customer' ], ['only' => ['index']] );

        $this->data[ 'page_title' ]          = 'Penjemputan';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        if( Auth::user()->hasRole( 'uadmin' )  )
        {
            ################
            # uadmin
            ################
            $tableForm[ 'header' ]  = [ 
                // 'customer->code' => 'Kode Customer',
                'code'                      => 'Kode Request',
                'customer->user->name'      => 'Nama Customer',
                'customer->user->address'   => 'Alamat',
                'photo'                     => 'Gambar',
                'info'                      => 'Keterangan',
                'created_at'                => 'Waktu Request',
             ];
             $tableForm[ 'imageUrl' ]    = RequestModel::PHOTO_PATH."/";

             $tableForm[ 'rows' ]    = RequestModel::
                                                select([ '*','requests.id as request_id' ])
                                                ->where( 'status', 0 )
                                                ->get();
            
            $tableForm[ 'number' ]        = 1;
            $drivers = Driver::all();
            $driverSelect = array();
            foreach( $drivers as $driver )
            {
                $driverSelect[ $driver->id ] = $driver->code ." | ".$driver->user->name;
            }
            // dd( $driver );die;
            $tableForm[ 'driverSelect' ]  = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                    'driver_id' => [
                                                        'type' => 'select',
                                                        'label' => 'Pilih Driver',
                                                        'options' => $driverSelect,
                                                    ],
                                            ]] );
            $table = view('request.table_form', $tableForm );
            
        }
        else
        {
            ################
            # Customer
            ################
            $table[ 'header' ]  = [ 
                'code'          => 'Kode Request',
                'created_at'    => 'Waktu Request',
                'photo'         => 'Gambar',
                'info'          => 'Keterangan',
             ];
             $table[ 'action' ]  = [
                "modal_delete" => [
                    "modalId"       => "delete",
                    "dataParam"     => "id",
                    "modalTitle"    => "Hapus",
                    "formUrl"       => url('requests'),
                    "formMethod"    => "post",
                    "buttonColor"   => "danger",
                    "formFields"    => [
                        '_method' => [
                            'type' => 'hidden',
                            'value'=> 'DELETE'
                        ],
                        'id' => [
                            'type' => 'hidden',
                        ],
                    ],
                ],//modal_delete
                // "modal_form" => [
                //     "modalId"       => "edit",
                //     "dataParam"     => "id",
                //     "modalTitle"    => "Edit Request",
                //     "formUrl"       => url('requests'),
                //     "formMethod"    => "post",
                //     "buttonColor"   => "warning",
                //     "formFields"    => [
                //         '_method' => [
                //             'type' => 'hidden',
                //             'value'=> 'PUT'
                //         ],
                //         'id' => [
                //             'type' => 'hidden',
                //         ],
                //         'info' => [
                //             'type' => 'textarea',
                //             'label' => 'Keterangan',
                //         ],
                //     ],
                // ],//modal_form
            ];
            $table[ 'number' ]      = 1;
            $table[ 'rows' ]        = Auth::user()->userable->requests->where( 'status', 0 );
            $table[ 'imageUrl' ]    = RequestModel::PHOTO_PATH."/";
            $table = view('request.table', $table);

            # modal
            $modalCreate['modalTitle']    = "Buat Request";
            $modalCreate['modalId']       = "create";
            $modalCreate['formMethod']    = "post";
            $modalCreate['formEnctype']    = "multipart";
            $modalCreate['formUrl']       = route('requests.store') ;
            $modalCreate['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                    'code' => [
                                                        'type' => 'text',
                                                        'label' => 'Kode',
                                                        'readonly' => 'Ex. admin/member',
                                                        'value' => 'Request_'.time(),
                                                    ],
                                                    'photo' => [
                                                        'type' => 'file',
                                                        'label' => 'Foto',
                                                    ],
                                                    'info' => [
                                                        'type' => 'textarea',
                                                        'label' => 'Keterangan',
                                                    ],
                                            ]] );
            $modalCreate = view('layouts.templates.modals.modal', $modalCreate );
            $this->data[ 'header_button' ]       = $modalCreate;
        }
       
        $this->data[ 'contents' ]            = $table;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'header' ]              = 'Daftar Request Penjemputan Sampah ';
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
            'code' => 'required',
            'photo' => 'required|file|max:1024',
            'info' => 'required',
        ] );

        $fileName = "REQUEST_".time().".".$request->photo->getClientOriginalExtension();
        $request->photo->move( RequestModel::PHOTO_PATH, $fileName );
        // unlink( RequestModel::PHOTO_PATH."/".$fileName );
        // die;
        
        RequestModel::create([
            'code'          => $request->input('code') ,
            'info'          => $request->input('info') ,
            'photo'         => $fileName ,
            'customer_id'   => Auth::user()->userable->id ,
            'status'        => 0 ,
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

        $request->validate( [
            'id' => ['required'],
            'info' => ['required'],
        ] );
        $req = RequestModel::findOrFail( $id );
        if( $req->status != 0 )
        {
            return redirect()->route('requests.index')->with(['message' => Alert::setAlert( Alert::DANGER, "tidak dapat mengubah" ) ]);
        }
        $req->update([
            'info'    => $request->input('info'),
        ]);
        // dd( $req );die;

        return redirect()->route('requests.index')->with(['message' => Alert::setAlert( 1, "data berhasil di update" ) ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $req = RequestModel::find( $id );
        if( $req->status != 0 )
        {
            return redirect()->route('requests.index')->with(['message' => Alert::setAlert( Alert::DANGER, "tidak dapat menghapus" ) ]);

        }
        unlink( RequestModel::PHOTO_PATH."/".$req->photo );
        $req->delete();
        return redirect()->route('requests.index')->with(['message' => Alert::setAlert( 1, "data berhasil di hapus" ) ]);

    }
}
