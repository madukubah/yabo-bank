<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Model\Request as RequestModel;
use App\Model\PickUp;
use App\User;

class RequestController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        $data['unprocess_request'] = [];
        $unprocess_request = Auth::user()->userable->requests->where( 'status', 0 );
        foreach( $unprocess_request as $item )
        {
            $data['unprocess_request'] []= $item;
        }
        $data['processed_request'] = [];
        $processed_request = Auth::user()->userable->requests->where( 'status', 1 );
        foreach( $processed_request as $item )
        {
            $item->driver_name  = $item->pickUp->driver->user->name; 
            $item->confirm_at   = date('Y-m-d H:i:s', strtotime( $item->pickUp->created_at ) );
            $data['processed_request'] []= $item;
        }
        return $this->sendResponse( $data );
    }

     /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function countRequest()
    {
        $data['unprocess_request'] = RequestModel::
                                    select([ '*','requests.id as request_id' ])
                                    ->where( 'status', 0 )->count();
        $data['processed_request'] = PickUp::where( 'status',  0 )->count();
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
        if( Auth::user()->userable->status == 0 )
            return $this->sendError( NULL, 'akun belum di verifikasi' );

        $validator = Validator::make($request->all(), [
            'photo' => 'required|file|max:1024',
            'info' => 'required',
        ] );

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());       
        }
        $fileName = "REQUEST_".time().".".$request->photo->getClientOriginalExtension();
        $request->photo->move( RequestModel::PHOTO_PATH, $fileName );

        $req = RequestModel::create([
            'code'          => 'Request_'.time(),
            'info'          => $request->input('info'),
            'photo'         => $fileName ,
            'customer_id'   => Auth::user()->userable->id ,
            'status'        => 0,
            'latitude'      => 0 ,
            'longitude'     => 0 ,
        ]);
        return $this->sendResponse( $req, 'request berhasil di buat' );

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
        $req = RequestModel::find( $id );
        if( $req->status != 0 )
        {
            return $this->sendError( NULL , 'Gagal' );

        }
        // dd( $req->photo ); die;
        unlink( RequestModel::PHOTO_PATH."/".$req->photo );
        $req->delete();
        return $this->sendResponse( NULL , 'request berhasil di Hapus' );

    }
}
