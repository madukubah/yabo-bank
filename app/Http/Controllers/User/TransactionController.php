<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use Session;
use Auth;
use App\Model\Transaction;

class TransactionController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:driver' ] );
        $this->data[ 'page_title' ]          = 'Transaksi';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table[ 'header' ]  = [ 
            'customer->code'    => 'Kode Customer',
            'customer->user->name'   => 'Nama',
            'product'       => 'Produk',
            'quantity'      => 'Jumlah',
            'total'         => 'Total',
        ];
        $table[ 'number' ]  = 1;
        // customer
        // $table[ 'rows' ]    = Auth::user()->userable->transactions;
        $table[ 'rows' ]    = Transaction::where( 'driver_id', Auth::user()->userable->id )->orderBy( 'id', 'desc' )->get();
        $table = view('transaction.table', $table);

        $this->data[ 'contents' ]            = $table;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'header' ]              = 'Daftar Mutasi Rekening ';
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
        //
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
