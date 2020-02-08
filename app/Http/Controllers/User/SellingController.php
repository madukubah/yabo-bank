<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\UadminController;
use Session;
use App\Model\Selling;
use App\Model\Mutation;
use App\Model\Invoice;
use App\Model\Payment;
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
            'code'              => 'Kode',
            'factory_name'      => 'Nama Pabrik',
            'container_car'     => 'No. Kontainer/ No. Mobil',
            'send_date'         => 'Tanggal Kirim',
            'unloading_date'    => 'Tanggal Bongkar',
            // 'gross'             => 'Bruto (Kg)',
            // 'cut_off'           => 'Potongan (Kg)',
            'netto'             => 'Netto (Kg)',
            'selling_price'     => 'Harga Jual',
            'total'             => 'Total',
         ];
        $table[ 'number' ]  = 1;

        $sellings = Selling::getData()->get();


        $table[ 'rows' ]    = $sellings;
        $table[ 'action' ]  = [
            "link" => [
                "dataParam"     => "id",
                "linkName"      => "Detail",
                "url"           => url('sellings'),
                "buttonColor"   => "primary",
            ],//link
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
        $dataForm = (object) [];
        $dataForm->code = Selling::getCode(  );
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields, 'data' => $dataForm ] );
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
            'code'              => ['required'],
            'factory_name'      => ['required'],
            'container_number'  => ['required'],
            'car_number'        => ['required'],
            'send_date'         => ['required'],
            'unloading_date'    => ['required'],
            'gross'             => ['required'],
            'cut_off'           => ['required'],
            'selling_price'     => ['required'],

        ];
        $request->validate( $validationConfig );
        Selling::create([
            'code'                  => $request->input('code'),
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
        unset( $formFields["code"] );
        $formFields["total"] = [
            'type' => 'text',
            'label' => 'Total',
            'value' => 'Rp. '.number_format( ( $selling->gross - $selling->cut_off ) * $selling->selling_price )
        ];
        $formFields["_method"] = [
            'type' => 'hidden',
            'value' => "PUT"
        ];
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields_readonly', [ 'formFields' => $formFields, 'data' => $selling ] );

        $linkEdit['url']              = route('sellings.edit', $id );
        $linkEdit['linkName']         = 'Edit';
        $linkEdit                     = view('layouts.templates.tables.actions.link', $linkEdit);
        $this->data[ 'contents' ]            = $form[ 'content' ] .'<br>'. $linkEdit ;
        //link invoice
        $linkCreate['url']              = route('invoice.create', $id);
        $linkCreate['linkName']         = 'Buat Invoice';
        $linkCreate['buttonColor']      = 'success';
        $linkCreate                     = view('layouts.templates.tables.actions.link', $linkCreate);
        if( $selling->invoice == null )
            $this->data[ 'header_button' ]  = $linkCreate;

        // modal Pembayaran
        if( $selling->invoice != null ){
            // payment table
            $table[ 'header' ]  = [
                'code'          => 'Kode',
                'date'          => 'Tanggal',
                'bill'          => 'Tagihan',
                'amount'        => 'Jumlah Bayar',
                'balance_due'   => 'Sisa',
            ];
            $table[ 'number' ]          = 1;
            $table[ 'rows' ]            = $selling->invoice->payments;
            $table[ 'billTotal' ]       = ( $selling->gross - $selling->cut_off ) * $selling->selling_price;
            $table = view('selling.payment_history_table', $table);
            $this->data[ 'payment_history' ]            = $table;

            $modalPayment['modalTitle']    = "Buat Pembayaran";
            $modalPayment['modalId']       = "create_payment";
            $modalPayment['formMethod']    = "post";
            $modalPayment['buttonColor']   = "success";
            $modalPayment['formUrl']       = route('payments.store') ;
            $dataForm = (object) [];
            $dataForm->invoice_id = $selling->invoice->id;

            $modalPayment['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => Payment::getFormData(), 'data' => $dataForm ] );
            $modalPayment = view('layouts.templates.modals.modal', $modalPayment );
            $this->data[ 'modalPayment' ]             = $modalPayment;
        }

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Penjualan';
        $this->data[ 'header' ]              = $selling->code;
        $this->data[ 'sub_header' ]          = '';
        return $this->render( 'selling.detail' );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function createInvoice($id)
    {
        $selling            = Selling::findOrFail( $id );
        if( $selling->invoice != null )
            return redirect()->route('sellings.index' )->with(['message' => Alert::setAlert( 0, "Sudah Punya Invoice" ) ]);

        $selling->selling_id= $selling->id;
        $selling->date      = date('Y-m-d');
        $selling->due_date  = date('Y-m-d', strtotime( '+1 day', time() ));
        $selling->netto     = $selling->gross - $selling->cut_off;

        $form[ 'formUrl' ]      = route('invoice.confirm' );
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $formFields = Invoice::getFormData(  );
        // unset( $formFields["code"] );
        $formFields["total"] = [
            'type' => 'text',
            'readonly' => true,
            'value' => 'Rp. '.number_format( ( $selling->gross - $selling->cut_off ) * $selling->selling_price )
        ];
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields, 'data' => $selling ] );
        $form                   = view('layouts.templates.forms.form', $form );

        $this->data[ 'contents' ]            = $form;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Invoice';
        $this->data[ 'header' ]              = $selling->code.'/'.Invoice::getCode(  );
        $this->data[ 'sub_header' ]          = '';
        return $this->render( 'selling.create_invoice' );
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function confirmInvoice( Request $request )
    {
        $validationConfig = [
            'code'        => ['required'],
            'selling_id'  => ['required'],
            'date'        => ['required'],
            'due_date'    => ['required'],
        ];
        $request->validate( $validationConfig );

        $selling            = Selling::findOrFail( $request->input('selling_id') );
        if( $selling->invoice != null )
            return redirect()->route('sellings.index' )->with(['message' => Alert::setAlert( 0, "Sudah Punya Invoice" ) ]);


        Invoice::create([
            'code'                  => $request->input('code'),
            'selling_id'            => $request->input('selling_id'),
            'date'                  => $request->input('date'),
            'due_date'              => $request->input('due_date'),
        ]);
        return redirect()->route('sellings.index' )->with(['message' => Alert::setAlert( 1, "data berhasil di buat" ) ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
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
        return redirect()->route('sellings.show', $id )->with(['message' => Alert::setAlert( 1, "data berhasil di Edit" ) ]);
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
