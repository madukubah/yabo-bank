<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use App\Model\Mutation;
use App\Model\Customer;
use Session;
use Auth;
use App\Alert;



class MutationController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:uadmin' ], ['only' => [ 'withdrawal', 'confirmWithdrawal' ] ]  );
        $this->middleware( [ 'role:customer' ], ['except' => [ 'withdrawal', 'confirmWithdrawal'] ] );
        $this->data[ 'page_title' ]          = 'Mutasi';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        # NEW
        $mutationsTable[ 'header' ]  = [ 
            'created_at'    => 'Tanggal',
            'description'   => 'Keterangan',
            // 'nominal'       => 'nominal',
            'credit_total' => 'Kredit',
            'debit_total'  => 'Debit',
            'balance'      => 'Saldo',
        ];
        $mutationsTable[ 'number' ]  = 1;

        // customer
        // $mutations = $user->userable->mutations;
        // $mutations = Mutation::where( 'customer_id', $user->userable->id )->orderBy( 'id', 'desc' )->get();
        $mutations = Mutation::accountBook(  Auth::user()->userable->id )->get();
        
        $mutationsTable[ 'rows' ]    = $mutations;
        $table = view('mutation.table2', $mutationsTable);

        $balance                              = Mutation::getAccumulations( Auth::user()->userable->id, $position = 0 )->first();
        $this->data['balance']                = ( $balance != NULL ) ? ( $balance->total ) : 0 ;

        $credit                               = Mutation::getAccumulations( Auth::user()->userable->id,$position =  1 )->first();
        $this->data['credit']                 = ( $credit != NULL ) ? ( $credit->total ) : 0 ;

        $debit                                = Mutation::getAccumulations( Auth::user()->userable->id, $position = 2 )->first();
        $this->data['debit']                  = ( $debit != NULL ) ? abs( $debit->total ) : 0 ;


        $this->data[ 'contents' ]            = '<div class="row">
                                                    <div class="col text-center" >
                                                        <h5>
                                                            Kredit = '.number_format( abs( $this->data['credit'] )  ).'
                                                        </h5>
                                                    </div>
                                                    <div class="col text-center" >
                                                        <h5>
                                                            Debit = '.number_format( $this->data['debit'] ).'
                                                        </h5>
                                                    </div>
                                                    <div class="col text-center" >
                                                        <h5>
                                                            Saldo = '.number_format( $this->data['balance'] ).'
                                                        </h5>
                                                    </div>
                                                </div>
                                                <br>';
        $this->data[ 'contents' ]            .= $table;

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
    public function withdrawal( Request $request )
    {
        $request->validate([
            'nominal' => ['required'],
            'customer_id' => ['required'],
            'user_id' => ['required'],
        ] );
        
        $balance = Mutation::getAccumulations( $request->input('customer_id') )->first()->total;
        $nominal = $request->input('nominal');
        if( $nominal > $balance )
        {
            return redirect()->route('customers.show', $request->input('user_id') )->with(['message' => Alert::setAlert( Alert::DANGER, "Nominal Melewati saldo" ) ]);
        }

        $customer = Customer::findOrFail( $request->input('customer_id') );

        $this->data[ 'customer' ]       = $customer;
        $this->data[ 'total' ]           = $nominal;
        ################
        # modal
        ################
        $confirmFormFields [ 'nominal' ]= [
            'type' => 'hidden',
            'value' =>  $request->input('nominal') ,
        ];
        $confirmFormFields [ 'customer_id' ]= [
            'type' => 'hidden',
            'value' =>  $request->input('customer_id') ,
        ];
        $confirmFormFields [ 'user_id' ]= [
            'type' => 'hidden',
            'value' =>  $request->input('user_id') ,
        ];
        $modalConfirm['modalTitle']    = "Konfirmasi";
        $modalConfirm['modalId']       = "confirm";
        $modalConfirm['buttonColor']   = "success";
        $modalConfirm['formMethod']    = "post";
        $modalConfirm['formUrl']       = route('confirm.withdrawal') ;
        $modalConfirm['modalBody']     =  "<div class='alert alert-success alert-dismissible'>
                                            <h5>Anda Yakin ?</h5></div>";
        $modalConfirm['modalBody']     .= view('layouts.templates.forms.form_fields', [ 'formFields' => $confirmFormFields ] );
        $modalConfirm = view('layouts.templates.modals.modal', $modalConfirm );

        $this->data[ 'modalConfirm' ]       = $modalConfirm;

        $this->data[ 'page_title' ]          = 'Penarikan';
        return $this->render( 'mutation.withdrawal' );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function confirmWithdrawal( Request $request )
    {
        $request->validate([
            'nominal' => ['required'],
            'customer_id' => ['required'],
            'user_id' => ['required'],
        ] );
        
        $balance = Mutation::getAccumulations( $request->input('customer_id') )->first()->total;
        $nominal = $request->input('nominal');
        if( $nominal > $balance )
        {
            return redirect()->route('customers.show', $request->input('user_id') )->with(['message' => Alert::setAlert( Alert::DANGER, "Nominal Melewati saldo" ) ]);
        }

        $customer = Customer::findOrFail( $request->input('customer_id') );
        // dd( $request->input() );die;
        Mutation::createMutaion([
            'customer_id'       => $customer->id,
            'transaction_id'    => 0,
            'nominal'           => $nominal,
            'position'          => 1, // credit
            'description'       => 'Penarikan ',
        ]);
        return redirect()->route('customers.show', $request->input('user_id') )->with(['message' => Alert::setAlert( Alert::SUCCESS, "Pencairan Berhasil" ) ]);
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
