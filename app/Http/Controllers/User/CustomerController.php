<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UadminController;

use Session;
use App\User;
use App\Model\Role;
use App\Model\Mutation;
use App\Model\Transaction;
use App\Alert;
use Auth;
use DB;
use App\Model\Customer;
use App\Model\Driver;
use App\Model\PriceList;
use Illuminate\Support\Facades\Hash;


class CustomerController extends UadminController
{
    public function __construct()
    {
        parent::__construct();
        $this->data[ 'menu_id' ] = "customers";
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table[ 'header' ]  = [
            'customer_code' => 'Kode',
            'name' => 'Customer',
            'total' => 'Saldo',
         ];
        $table[ 'number' ]  = 1;

        $customers = Mutation::getAccumulations()->get();

        $table[ 'rows' ]    = $customers;
        $table[ 'action' ]  = [
            "link" => [
                "dataParam"     => "user_id",
                "linkName"      => "Detail",
                "url"           => url('customers'),
                "buttonColor"   => "primary",
            ],//link
        ];

        $table = view('customer.table', $table);

        $linkCreate['url']              = url('customers/create');
        $linkCreate['linkName']         = 'Tambah Customer';
        $linkCreate                     = view('layouts.templates.tables.actions.link', $linkCreate);
        $this->data[ 'header_button' ]  = $linkCreate;

        $this->data[ 'contents' ]            = $table;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Customer';
        $this->data[ 'header' ]              = 'List Customer';
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
        $form[ 'formUrl' ]      = url('customers');
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $formFields = User::getFormData(  );
        unset( $formFields['_password'] );
        unset( $formFields['_password_confirmation'] );
        unset( $formFields['role'] );
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => [
            'customer_code' => [
                'type' => 'text',
                'label' => 'Kode Customer',
                'value' => 'Customer_'.time(),
                'readonly' => ''
            ],
        ] ] );
        $form[ 'content' ]      .= view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields ] );
        $form                   = view('layouts.templates.forms.form', $form );

        $this->data[ 'contents' ]            = $form ;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Customer';
        $this->data[ 'header' ]              = 'Tambah Customer';
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
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'phone' => ['required', 'string', 'max:255'],
            'address' => ['required', 'string', 'max:255'],

        ];
        $request->validate( $validationConfig );
        // dd( $request->input() );die;
        $user = User::create([
            'name'          =>  $request->input('name'),
            'email'         =>  $request->input('email'),
            'username'      =>  $request->input('email'),
            'password'      =>  Hash::make( substr( $request->input('email'), 0, strpos( $request->input('email') , "@" ) ) ) ,
            'phone'         =>  $request->input('phone'),
            'address'       =>  $request->input('address'),
            'photo'         =>  'default.jpg',
            'identity_photo'=>  'default.jpg',
            'map_point'     =>  '0,0',
        ]);
        $user->putRole( 'customer' );
        $previlege = Customer::create( [
            'code'      => $request->input('customer_code'),
            'status'    => 0
        ] );
        $previlege->user()->save( $user );
        Mutation::createMutaion([
            'customer_id'       => $previlege->id,
            'transaction_id'    => 0 ,
            'nominal'           => 0,
            'position'          => 2,
            'description'       => 'initial',
        ]);
        return redirect()->route('customers.index' )->with(['message' => Alert::setAlert( 1, "data berhasil di buat, PASSWORD PERTAMA adalah nama email sampai '@' " ) ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id ,Request $request )
    {
        $position = $request->input('position');
        $position || $position = 0;

        $user       = User::findOrFail( $id );
        $user->role = $user->roles[0]->id;
        $user->role_name = $user->roles[0]->role_name;
        $this->data[ 'user' ]            = $user;

        // dd( $user->roles );
        $detail     = view('layouts.templates.forms.form_fields_readonly', [ 'formFields' => [
            'customer_code' => [
                'type' => 'text',
                'label' => 'Kode Customer',
                'value' => $user->userable->code,
                'readonly' => ''
            ],
        ] ] );
        $formFields = User::getFormData( FALSE );
        unset( $formFields['role_name'] );

        $detail     .= view('layouts.templates.forms.form_fields_readonly', [ 'formFields' => $formFields, 'data'=> $user ] );

        $linkEdit['url']        = url('customers').'/'. $user->id.'/edit';
        $linkEdit['linkName']   = 'Edit';
        $linkEdit               = view('layouts.templates.tables.actions.link', $linkEdit);

        $this->data[ 'contents' ]            = $detail.'<br>'.$linkEdit;
        # modal upload photo
        $modalUploadPhoto['modalTitle']    = "Upload Foto";
        $modalUploadPhoto['modalId']       = "upload";
        $modalUploadPhoto['formMethod']    = "post";
        $modalUploadPhoto['formEnctype']    = "multipart";
        $modalUploadPhoto['formUrl']       = route('users.upload_photo', $user->id) ;
        $modalUploadPhoto['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                'photo' => [
                                                    'type' => 'file',
                                                    'label' => 'Foto',
                                                ],
                                        ]] );
        $modalUploadPhoto = view('layouts.templates.modals.modal', $modalUploadPhoto );
        $this->data[ 'modalUploadPhoto' ]    = $modalUploadPhoto;

        #modal activation
        $modalActive['modalTitle']    = ( $user->userable->status == 0 ) ? "Aktifkan" : "Non Aktifkan" ;
        $modalActive['modalId']       = "changeStatus";
        $modalActive['buttonColor']   = ( $user->userable->status == 0 ) ? "success" : "danger";
        $modalActive['formMethod']    = "post";
        $modalActive['formUrl']       = route('customer.change.status', $user->userable->id) ;
        $modalActive['modalBody']     =  "<div class='alert alert-".$modalActive['buttonColor']." alert-dismissible'>
                                            <h5>Anda Yakin ?</h5></div>";
        $modalActive['modalBody']     .= view('layouts.templates.forms.form_fields', [ 'formFields' => [
            'status' => [
                'type' => 'hidden',
                'value' =>  $user->userable->status ^ 1
            ],
        ] ] );
        $modalActive = view('layouts.templates.modals.modal', $modalActive );

        $this->data[ 'modalActive' ]       = $modalActive;

        # modal upload identity photo
        $modalUploadIdentity['modalTitle']    = "Upload Foto KTP";
        $modalUploadIdentity['modalId']       = "customers_upload";
        $modalUploadIdentity['formMethod']    = "post";
        $modalUploadIdentity['formEnctype']    = "multipart";
        $modalUploadIdentity['formUrl']       = route('customers.upload_photo', $user->userable->id) ;
        $modalUploadIdentity['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                'photo' => [
                                                    'type' => 'file',
                                                    'label' => 'Foto',
                                                ],
                                        ]] );
        $modalUploadIdentity = view('layouts.templates.modals.modal', $modalUploadIdentity );
        $this->data[ 'modalUploadIdentity' ]    = $modalUploadIdentity;
        // linkCreateTransaction
        $linkCreateTransaction['url']              = route('customer.create_transaction', $user->userable->id );
        $linkCreateTransaction['linkName']         = 'Buat Transaksi';
        $linkCreateTransaction                     = view('layouts.templates.tables.actions.link', $linkCreateTransaction);
        $this->data[ 'linkCreateTransaction' ]     = $linkCreateTransaction;

        #mutations
        $mutationsTable[ 'header' ]  = [
            'created_at'    => 'Tanggal',
            'description'   => 'Keterangan',
            'credit_total' => 'Kredit',
            'debit_total'  => 'Debit',
            'balance'      => 'Saldo',
        ];
        $mutationsTable[ 'number' ]  = 1;

        // customer
        // $mutations = $user->userable->mutations;
        // $mutations = Mutation::where( 'customer_id', $user->userable->id )->orderBy( 'id', 'desc' )->get();
        $mutations = Mutation::accountBook(  $user->userable->id )->get();
        if( $position != 0 )
            $mutations = $mutations->where('position', $position );

        $mutationsTable[ 'rows' ]    = $mutations;
        $mutationsTable = view('mutation.table2', $mutationsTable);
        // credit debit
        $filter[ 'formUrl' ]      = url('customers/'.$id  );
        $filter[ 'content' ] = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                'position' => [
                    'type' => 'select',
                    'labeled' => false,
                    'options' => [
                        0 => 'Kredit/Debit',
                        1 => 'Kredit',
                        2 => 'Debit',
                    ],
                    'value' => $position
                ],
        ]] );
        $filter                   = view('layouts.templates.forms.form_horizontal', $filter );

        $this->data[ 'mutationsTable' ]      = $filter.$mutationsTable;

        $balance                              = Mutation::getAccumulations( $user->userable->id, $position = 0 )->first();
        $this->data['balance']                = ( $balance != NULL ) ? ( $balance->total ) : 0 ;
        $credit                               = Mutation::getAccumulations( $user->userable->id,$position =  1 )->first();
        $this->data['credit']                 = ( $credit != NULL ) ? ( $credit->total ) : 0 ;
        $debit                                = Mutation::getAccumulations( $user->userable->id, $position = 2 )->first();
        $this->data['debit']                  = ( $debit != NULL ) ? abs( $debit->total ) : 0 ;

        // modal pencairan
        $modalwithdrawal['modalTitle']    = "Buat Penarikan";
        $modalwithdrawal['modalId']       = "create";
        $modalwithdrawal['formMethod']    = "post";
        $modalwithdrawal['buttonColor']   = "success";
        $modalwithdrawal['formUrl']       = route('withdrawal') ;
        $modalwithdrawal['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                'nominal' => [
                                                    'type' => 'number',
                                                    'label' => 'Masukkan Nominal',
                                                    'placeholder' => '',
                                                    'value' => '',
                                                ],
                                                'customer_id' => [
                                                    'type' => 'hidden',
                                                    'label' => 'Customer',
                                                    'placeholder' => '',
                                                    'value' => $user->userable->id, // customer_id
                                                ],
                                                'user_id' => [
                                                    'type' => 'hidden',
                                                    'label' => 'user',
                                                    'placeholder' => '',
                                                    'value' => $user->id, // customer_id
                                                ],
                                        ]] );
        $modalwithdrawal = view('layouts.templates.modals.modal', $modalwithdrawal );
        $this->data[ 'modalwithdrawal' ]             = $modalwithdrawal;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Customer';
        $this->data[ 'header' ]              = 'Detail Customer';
        $this->data[ 'sub_header' ]          = '';

        return $this->render( 'customer.detail' );
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function createTransaction($customer_id)
    {
        $customer = Customer::findOrFail( $customer_id );
        $this->data[ 'customer' ]            = $customer;

        $formProduct = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                'product[]' => [
                    'type' => 'select',
                    'label' => 'Role Name',
                    'labeled' => false,
                    'options' => DB::table('price_lists')->pluck( 'name', 'id' ) ,
                    'value' => '',
                ],
        ]] );
        $this->data[ 'formProduct' ]            = $formProduct;
        $this->data[ 'products' ]               = DB::table('price_lists')->pluck( 'price', 'id' );
        $this->data[ 'units' ]                  = DB::table('price_lists')->pluck( 'unit', 'id' );
        // dd( $this->data[ 'products' ] );die;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Buat Transaksi';
        $this->data[ 'header' ]              = '';//$pickup->request->code;
        $this->data[ 'sub_header' ]          = '';

        return $this->render( 'customer.create_transaction' );
    }

     /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function checkoutTransantion( Request $request )
    {
        // dd( $request->input() );die;
        $request->validate( [
            'product'       => ['required'],
            'quantity'      => ['required'],
            'customer_id'   => ['required'],
        ] );

        $customer = Customer::findOrFail( $request->input('customer_id') );
        $this->data[ 'customer' ]            = $customer;

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
        $confirmFormFields [ 'customer_id' ]= [
            'type' => 'hidden',
            'value' =>  $request->input('customer_id') ,
        ];
        $modalConfirm['modalTitle']    = "Konfirmasi";
        $modalConfirm['modalId']       = "confirm";
        $modalConfirm['formMethod']    = "post";
        $modalConfirm['formUrl']       = route('customer.confirm_transaction') ;
        $modalConfirm['modalBody']     =  "<div class='alert alert-success alert-dismissible'>
                                            <h5>Anda Yakin ?</h5></div>";
        $modalConfirm['modalBody']     .= view('layouts.templates.forms.form_fields', [ 'formFields' => $confirmFormFields ] );
        $modalConfirm = view('layouts.templates.modals.modal', $modalConfirm );

        $this->data[ 'modalConfirm' ]       = $modalConfirm;
        return $this->render( 'customer.checkout_transaction' );
    }

     /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function confirmTransaction(Request $request)
    {
        $request->validate( [
            'product' => ['required'],
            'quantity' => ['required'],
            'customer_id' => ['required'],
        ] );
        $customer = Customer::findOrFail( $request->input('customer_id') );

        $quantities                         = $request->input('quantity');

        foreach( $request->input('product') as $ind => $product ):
            $product_ = PriceList::findOrFail( $product );

            $transaction = Transaction::createTransaction([
                'customer_id'   => $customer->id,
                'driver_id'     => 0,
                'product'       => $product_->name,
                'unit'          => $product_->unit,
                'price'         => $product_->price,
                'quantity'      => $quantities[ $ind ]  ,
            ]);
            // nominal
            // 1 = credit // uang keluar
            // 2 = debit // uang masuk
            Mutation::createMutaion([
                'customer_id'       => $customer->id,
                'transaction_id'    => $transaction->id,
                'nominal'           => $product_->price * $quantities[ $ind ] ,
                'position'          => 2,
                'description'       => 'Transaksi Langsung '.strtoupper( $product_->name ).' ('.$product_->price
                                        .' / '.$product_->unit.') , '.$quantities[ $ind ].' '.$product_->unit,
            ]);
        endforeach;

        return redirect()->route('customers.show', $customer->user->id )->with(['message' => Alert::setAlert( 1, "transaksi Berhasil berhasil di buat" ) ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user       = User::findOrFail( $id );
        $user->role = $user->roles[0]->id;
        $user->role_name = $user->roles[0]->role_name;

        $form[ 'formUrl' ]      = url('customers').'/'. $user->id;
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $formFields = User::getFormData(  );
        $formFields["role"]['type'] = 'hidden';
        $formFields["_method"] = [
            'type' => 'hidden',
            'value' => "PUT"
        ];
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields , 'data'=> $user ] );
        $form                   = view('layouts.templates.forms.form', $form );
        $this->data[ 'contents' ]            = $form ;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'header' ]              = 'edit customer';
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
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255'],
            'phone' => ['required', 'string', 'max:255'],
            'address' => ['required', 'string', 'max:255'],
        ];

        $user       = User::findOrFail( $id );
        if( $request->input('email') != $user->email )
            $validationConfig[ 'email' ] []= 'unique:users';

        if( $request->input('_password') != NULL )
        {
            $validationConfig[ '_password' ] = ['required', 'string', 'min:4', 'confirmed'];
        }
        $request->validate( $validationConfig );

        $data = [
            'name'          =>  $request->input('name'),
            'email'         =>  $request->input('email'),
            'phone'         =>  $request->input('phone'),
            'address'       =>  $request->input('address'),
        ];
        if( $request->input('_password') != NULL )
            $data['password'] = Hash::make( $request->input('_password') );

        $user->update( $data );

        return redirect()->route('customers.show', $id )->with(['message' => Alert::setAlert( 1, "data berhasil di edit" ) ]);
    }

     /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function uploadIdendityPhoto( $id, Request $request )
    {
        // dd( $request->input() );die;
        $customer       = Customer::findOrFail( $id );
        $request->validate( [
            'photo' => 'required|file|max:1024',
        ] );
        $fileName = "IDENTITY_".time().".".$request->photo->getClientOriginalExtension();

        if( $request->photo->move( Customer::PHOTO_PATH, $fileName ) )
        {
            $oldPhoto   = $customer->identity_photo;
            if( $oldPhoto != 'default.jpg' )
                unlink( Customer::PHOTO_PATH."/".$oldPhoto );

            $customer->identity_photo = $fileName;
            $customer->save();
            // dd( $customer->identity_photo );die;

        }
        return redirect()->back()->with(['message' => Alert::setAlert( 1, "Foto Berhasil di upload" ) ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function changeStatus( $id, Request $request )
    {
        // dd( $request->input() );die;
        $customer       = Customer::findOrFail( $id );
        $request->validate( [
            'status' => 'required',
        ] );

        $customer->status = $request->input( 'status' );
        $customer->save();

        return redirect()->back()->with(['message' => Alert::setAlert( 1, "Foto Berhasil di upload" ) ]);
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
