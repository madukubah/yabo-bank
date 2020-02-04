<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UadminController;
use App\Model\Invoice;
use App\Model\Payment;
use App\Model\Selling;
use App\Alert;
use Session;

class PaymentController extends UadminController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        parent::__construct();
    }

     /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table[ 'header' ]  = [ 
            'selling_code'              => 'Kode SO',
            'invoice_code'              => 'Kode Invoice',
            'bill'                      => 'Tagihan',
            'payed'                     => 'Terbayar',
            'status'                    => 'Status',
         ];
        $table[ 'number' ]  = 1;
        
        $table[ 'rows' ]    = Invoice::orderBy( 'date', 'desc' )->get();
        $table[ 'action' ]  = [
            "link" => [
                "dataParam"     => "id",
                "linkName"      => "Detail",
                "url"           => url('sellings'),
                "buttonColor"   => "primary",
            ],//link
        ];
        $table = view('payment.table', $table);
        $this->data[ 'contents' ]            = $table;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Pembayaran';
        $this->data[ 'header' ]              = 'Daftar Pembayaran';
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
            'invoice_id'        => ['required'],
            'code'  => ['required'],
            'date'        => ['required'],
            'amount'    => ['required'],
        ];
        $request->validate( $validationConfig );

        $invoice = Invoice::findOrFail( $request->input('invoice_id') );
        $saleOrder = $invoice->salesOrder;
        $billTotal = ( $saleOrder->gross - $saleOrder->cut_off ) * $saleOrder->selling_price;
        // dd( $invoice->salesOrder );die;
        // dd( Payment::sumByInvoiceId( $invoice->id )  );die;
        $totalAmount = Payment::sumByInvoiceId( $invoice->id );
        if( $totalAmount + $request->input('amount') > $billTotal )
            return redirect()->back()->with(['message' => Alert::setAlert( 0, "Pembayaran melebihi tagihan" ) ]);

        Payment::create([
            'code'                  => $request->input('code'),
            'invoice_id'            => $request->input('invoice_id'),
            'date'                  => $request->input('date'),
            'amount'                => $request->input('amount'),
        ]);
        return redirect()->back()->with(['message' => Alert::setAlert( 1, "data berhasil di buat" ) ]);

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
