<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\UadminController;
use Session;
use App\Model\Selling;
use App\Model\Mutation;
use App\Alert;



class SellingController extends UadminController
{
    public function __construct()
    {
        parent::__construct();
        $this->data[ 'menu_id' ] = "sellings";
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table[ 'header' ]  = [ 
            'factory_name'      => 'Nama Pabrik',
            'container_car'     => 'No. Kontainer/ No. Mobil',
            'send_date'         => 'Tanggal Kirim',
            'unloading_date'    => 'Tanggal Bongkar',
            'gross'             => 'Bruto (Kg)',
            'cut_off'           => 'Potongan (Kg)',
            'netto'             => 'Netto (Kg)',
            'selling_price'     => 'Harga Jual',
            'total'             => 'Total',
         ];
        $table[ 'number' ]  = 1;
        
        $customers = Selling::getData()->get();
        

        $table[ 'rows' ]    = $customers;
        $table[ 'action' ]  = [
            "link" => [
                "dataParam"     => "id",
                "linkName"      => "Edit",
                "url"           => url('sellings'),
                "buttonColor"   => "primary",
            ],//link
            "modal_delete" => [
                "modalId"       => "delete",
                "dataParam"     => "id",
                "modalTitle"    => "Hapus",
                "formUrl"       => url('sellings'),
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
        $table = view('selling.table', $table);
        $this->data[ 'contents' ]            = $table;

        $linkCreate['url']              = url('sellings/create');
        $linkCreate['linkName']         = 'Buat Penjualan';
        $linkCreate                     = view('layouts.templates.tables.actions.link', $linkCreate);
        $this->data[ 'header_button' ]  = $linkCreate;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Penjualan';
        $this->data[ 'header' ]              = 'Daftar Penjualan';
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
        $form[ 'formUrl' ]      = url('sellings');
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $formFields = Selling::getFormData(  );
        
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields ] );
        $form                   = view('layouts.templates.forms.form', $form );
        
        $this->data[ 'contents' ]            = $form ;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Penjualan';
        $this->data[ 'header' ]              = 'Buat Penjualan';
        $this->data[ 'sub_header' ]          = '';
        return $this->render(  );
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validationConfig = [
            'factory_name' => ['required'],
            'container_number' => ['required'],
            'car_number' => ['required'],
            'send_date' => ['required'],
            'unloading_date' => ['required'],
            'gross' => ['required'],
            'cut_off' => ['required'],
            'selling_price' => ['required'],

        ];
        $request->validate( $validationConfig );
        Selling::create([
            'factory_name'          => $request->input('factory_name'),
            'container_number'      => $request->input('container_number'),
            'car_number'            => $request->input('car_number'),
            'send_date'             => $request->input('send_date'),
            'unloading_date'        => $request->input('unloading_date'),
            'gross'                 => $request->input('gross'),
            'cut_off'               => $request->input('cut_off'),
            'selling_price'         => $request->input('selling_price'),
        ]);
        return redirect()->route('sellings.index' )->with(['message' => Alert::setAlert( 1, "data berhasil di buat" ) ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $selling = Selling::findOrFail( $id );
        $form[ 'formUrl' ]      = url('sellings').'/'. $id;
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $formFields = Selling::getFormData(  );
        $formFields["_method"] = [
            'type' => 'hidden',
            'value' => "PUT"
        ];
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields, 'data' => $selling ] );
        $form                   = view('layouts.templates.forms.form', $form );
        
        $this->data[ 'contents' ]            = $form ;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Penjualan';
        $this->data[ 'header' ]              = 'Edit Penjualan';
        $this->data[ 'sub_header' ]          = '';
        return $this->render(  );
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
        $validationConfig = [
            'factory_name' => ['required'],
            'container_number' => ['required'],
            'car_number' => ['required'],
            'send_date' => ['required'],
            'unloading_date' => ['required'],
            'gross' => ['required'],
            'cut_off' => ['required'],
            'selling_price' => ['required'],

        ];
        $request->validate( $validationConfig );

        $selling = Selling::findOrFail( $id );
        $selling->update([
            'factory_name'          => $request->input('factory_name'),
            'container_number'      => $request->input('container_number'),
            'car_number'            => $request->input('car_number'),
            'send_date'             => $request->input('send_date'),
            'unloading_date'        => $request->input('unloading_date'),
            'gross'                 => $request->input('gross'),
            'cut_off'               => $request->input('cut_off'),
            'selling_price'         => $request->input('selling_price'),
        ]);
        return redirect()->route('sellings.index' )->with(['message' => Alert::setAlert( 1, "data berhasil di Edit" ) ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $selling = Selling::findOrFail( $id );
        $selling->delete();
        return redirect()->route('sellings.index' )->with(['message' => Alert::setAlert( 1, "data berhasil di Hapus" ) ]);
        
    }
}
