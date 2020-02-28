<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UadminController;
use App\Alert;
use Session;
use Route;
use App\Model\Promotion;


class PromotionController extends UadminController
{
    public function __construct()
    {
        parent::__construct();

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        ################
        # modal
        ################
        $modalCreate['modalTitle']    = "Tambah Promosi";
        $modalCreate['modalId']       = "create";
        $modalCreate['formMethod']    = "post";
        $modalCreate['formEnctype']   = "multipart";
        $modalCreate['formUrl']       = route('promotions.store') ;
        $modalCreate['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                'image' => [
                                                    'type' => 'file',
                                                    'label' => 'Gambar',
                                                    'value' => '',
                                                ],
                                        ]] );
        $modalCreate = view('layouts.templates.modals.modal', $modalCreate );
        
        ################
        # table
        ################
        $table[ 'header' ]  = [ 
            'image' => 'Gambar',
         ];
        $table[ 'number' ]  = 1;
        $table[ 'rows' ]    = Promotion::get();
        $table[ 'action' ]  = [
            "modal_delete" => [
                "modalId"       => "delete",
                "dataParam"     => "id",
                "modalTitle"    => "Hapus",
                "formUrl"       => url('promotions'),
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
        ];
        $table[ 'imageUrl' ]    = Promotion::PHOTO_PATH."/";

        $table = view('promotion.table', $table);

        $this->data[ 'header_button' ]       = $modalCreate;
        $this->data[ 'contents' ]            = $table;

        $this->data[ 'message_alert' ] = Session::get('message');
        $this->data[ 'page_title' ]          = 'Promosi';
        $this->data[ 'header' ]              = 'Promosi';
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
            'image' => 'required|file|max:1024',
        ] );

        $fileName = "PROMOTION_".time().".".$request->image->getClientOriginalExtension();
        $request->image->move( Promotion::PHOTO_PATH, $fileName );
        // die;
        Promotion::create([
            'image'         => $fileName ,
        ]);
        return redirect()->route('promotions.index')->with(['message' => Alert::setAlert( 1, "data berhasil di buat" ) ]);
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
        $promotion = Promotion::find( $id );
        unlink( Promotion::PHOTO_PATH."/".$promotion->image );
        $promotion->delete();
        return redirect()->route('promotions.index')->with(['message' => Alert::setAlert( 1, "data berhasil di hapus" ) ]);
    }
}
