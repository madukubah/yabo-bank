<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UadminController;
use Session;
use App\Model\CashOut;
use App\Alert;

class CashOutController extends UadminController
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
        $table[ 'header' ]  = [ 
            'date'          => 'Tanggal',
            'description'   => 'Keterangan',
            'nominal'       => 'Nominal',
         ];
        $table[ 'number' ]  = 1;
        
        $customers = CashOut::orderBy( 'date', 'asc' )->get();

        $table[ 'rows' ]    = $customers;
        $table[ 'action' ]  = [
            "modal_form" => [
                "modalId"       => "edit",
                "dataParam"     => "id",
                "modalTitle"    => "Edit ",
                "formUrl"       => url('cash_outs'),
                "formMethod"    => "post",
                "buttonColor"   => "primary",
                "formFields"    => CashOut::getFormData(),
            ],//modal_form
            "modal_delete" => [
                "modalId"       => "delete",
                "dataParam"     => "id",
                "modalTitle"    => "Hapus",
                "formUrl"       => url('cash_outs'),
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
        $table[ 'action' ]["modal_form"]["formFields"]['_method'] = [ 'type' => 'hidden', 'value'=> 'PUT' ];
        $table = view('layouts.templates.tables.plain_table', $table);
        $this->data[ 'contents' ]            = $table;

        // modalCreate
        $modalCreate['modalTitle']    = "Buat Pengeluaran";
        $modalCreate['modalId']       = "create";
        $modalCreate['formMethod']    = "post";
        $modalCreate['formUrl']       = route('cash_outs.store') ;
        $modalCreate['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => CashOut::getFormData() ] );
        $modalCreate = view('layouts.templates.modals.modal', $modalCreate );
        $this->data[ 'header_button' ]       = $modalCreate;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Kas Keluar';
        $this->data[ 'header' ]              = 'Daftar Kas Keluar';
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
        $this->validate($request, [
            'date'          => 'required',
            'description'   => 'required',
            'nominal'       => 'required',

        ]);

        CashOut::create([
            'code'          => CashOut::getCode(),
            'date'          => $request->input('date'),
            'description'   => $request->input('description'),
            'nominal'       => $request->input('nominal'),
        ]);

        return redirect()->route('cash_outs.index')->with(['message' => Alert::setAlert( Alert::SUCCESS, "data berhasil di buat" ) ]);
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
        $this->validate($request, [
            'date'          => 'required',
            'description'   => 'required',
            'nominal'       => 'required',

        ]);

        CashOut::find($id)->update([
            'date'          => $request->input('date'),
            'description'   => $request->input('description'),
            'nominal'       => $request->input('nominal'),
        ]);

        return redirect()->route('cash_outs.index')->with(['message' => Alert::setAlert( Alert::SUCCESS, "data berhasil di update" ) ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        CashOut::find($id)->delete();
        return redirect()->route('cash_outs.index')->with(['message' => Alert::setAlert( Alert::SUCCESS, "data berhasil di hapus" ) ]);
    }
}
