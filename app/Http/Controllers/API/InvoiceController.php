<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Support\Facades\Auth;
use Validator;
use App\Model\Request as RequestModel;

use App\User;
use App\Model\PriceList;
use App\Model\Transaction;
use App\Model\Mutation;
use App\Model\Customer;


class InvoiceController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
        $validator = Validator::make($request->all(), [
            'product_id' => ['required'],
            'quantity' => ['required'],
            'customer_id' => ['required'],
        ] );

        if($validator->fails()){
            return $this->sendError( 'Validation Error.', $validator->errors());
        }

        // return $this->sendError( $request->all(), $validator->errors());
        // die;

        $quantities = $request->input('quantity');
        $customer = Customer::find( $request->input('customer_id') );

        foreach( $request->input('product_id') as $ind => $product_id ):
            $product_ = PriceList::findOrFail( $product_id );
            $transaction = Transaction::createTransaction([
                'customer_id'   => $customer->id ,
                'driver_id'     => Auth::user()->userable->id,
                'product'       => $product_->name,
                'unit'          => $product_->unit,
                'price'         => $product_->price,
                'quantity'      => $quantities[ $ind ]  ,
            ]);
            // nominal
            // 1 = credit
            // 2 = debit
            Mutation::createMutaion([
                'customer_id'       => $customer->id ,
                'transaction_id'    => $transaction->id,
                'nominal'           => $product_->price * $quantities[ $ind ] ,
                'position'          => 2,
                'description'       => 'Transaksi : '
                                        .strtoupper($product_->name).' ('.$product_->price
                                        .' / '.$product_->unit.') , '.$quantities[ $ind ]." ".$product_->unit
                                        .', Driver : '.Auth::user()->name,
            ]);
        endforeach;
        if( $request->input('pickup_id') != NULL )
        {
            $pickup = Auth::user()->userable->pickUps->find( $request->input('pickup_id') );

            $pickup->update([
                'status' => 1
            ]);
            $pickup->request->update([
                'status' => 2
            ]);
        }
        return $this->sendResponse( 1 , 'data berhasil di buat' );

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
