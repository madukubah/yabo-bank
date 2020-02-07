<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use Auth;
use App\Alert;
use App\User;
use App\Model\PriceList;
use App\Model\Transaction;
use App\Model\Mutation;
use Session;
use Illuminate\Support\Facades\Hash;

class InvoiceController extends UserController
{

    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:driver' ]  );
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create( Request $request )
    {
        // dd( $request->input() );die;
        $request->validate( [
            'product' => ['required'],
            'quantity' => ['required'],
            'pickUpId' => ['required'],
        ] );
        $pickup = Auth::user()->userable->pickUps->find( $request->input('pickUpId') );
        $request_ = $pickup->request;
        $this->data[ 'request' ]            = $request_;
        $this->data[ 'products' ]           = $request->input('product');
        $quantities                         = $request->input('quantity');
        $tableData = [];
        $total = 0;

        $confirmFormFields = [];
        foreach( $request->input('product') as $ind => $product ):
            $product_ = PriceList::findOrFail( $product );
            $total += $product_->price * $quantities[ $ind ];
            $tableData[]= (object) [
                'product_name' => $product_->name,
                'product_price_per_unit' => $product_->price." / ".$product_->unit,
                'quantity' => $quantities[ $ind ],
                'sub_total' => $product_->price * $quantities[ $ind ] ,
            ];
            $confirmFormFields [ 'product['.$ind.']' ]= [
                'type' => 'hidden',
                'value' => $product,
            ];
            $confirmFormFields [ 'quantity['.$ind.']' ]= [
                'type' => 'hidden',
                'value' => $quantities[ $ind ],
            ];
        endforeach;

        $this->data[ 'tableData' ]       = $tableData;
        $this->data[ 'total' ]           = $total;
        ################
        # modal
        ################
        $confirmFormFields [ 'pickUpId' ]= [
            'type' => 'hidden',
            'value' =>  $request->input('pickUpId') ,
        ];
        $modalConfirm['modalTitle']    = "Konfirmasi";
        $modalConfirm['modalId']       = "confirm";
        $modalConfirm['formMethod']    = "post";
        $modalConfirm['formUrl']       = route('invoices.store') ;
        $modalConfirm['modalBody']     =  "<div class='alert alert-success alert-dismissible'>
                                            <h5>Anda Yakin ?</h5></div>";
        $modalConfirm['modalBody']     .= view('layouts.templates.forms.form_fields', [ 'formFields' => $confirmFormFields ] );
        $modalConfirm = view('layouts.templates.modals.modal', $modalConfirm );

        $this->data[ 'modalConfirm' ]       = $modalConfirm;


        return $this->render( 'invoice.create' );

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
            'product' => ['required'],
            'quantity' => ['required'],
            // 'pickUpId' => ['required'],
        ] );
        $pickup = Auth::user()->userable->pickUps->find( $request->input('pickUpId') );
        $quantities                         = $request->input('quantity');

        foreach( $request->input('product') as $ind => $product ):
            $product_ = PriceList::findOrFail( $product );
            
            $transaction = Transaction::createTransaction([
                'customer_id'   => $pickup->request->customer_id,
                'driver_id'     => Auth::user()->userable->id,
                'product'       => $product_->name,
                'unit'          => $product_->unit,
                'price'         => $product_->price,
                'quantity'      => $quantities[ $ind ]  ,
            ]);
            // nominal
            // 1 = credit // uang keluar
            // 2 = debit // uang masuk
            Mutation::createMutaion([
                'customer_id'       => $pickup->request->customer_id,
                'transaction_id'    => $transaction->id,
                'nominal'           => $product_->price * $quantities[ $ind ] ,
                'position'          => 2,
                'description'       => 'transaction to customer '.  $pickup->request->customer->code  . ': '
                                        .$product_->name.','.$product_->price
                                        .','.$product_->unit.',qty:'.$quantities[ $ind ]
                                        .'driver:'.Auth::user()->name,
            ]);
        endforeach;
        if( $request->input('pickUpId') != NULL )
        {
            $pickup->update([
                'status' => 1
            ]);
            $pickup->request->update([
                'status' => 2
            ]);
        }
        
        return redirect()->route('pickups.index')->with(['message' => Alert::setAlert( 1, "transaksi Berhasil berhasil di buat" ) ]);
        // dd( $request->input() );die;
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
