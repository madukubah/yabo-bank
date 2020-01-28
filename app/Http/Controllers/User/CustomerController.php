<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UserController;

use Session;
use App\User;
use App\Model\Role;
use App\Model\Mutation;
use App\Alert;
use Auth;
use DB;
use App\Model\Customer;
use App\Model\Driver;
use Illuminate\Support\Facades\Hash;


class CustomerController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->middleware( [ 'role:uadmin' ] );
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
        $table = view('layouts.templates.tables.plain_table', $table);

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
            'code' => $request->input('customer_code')
        ] );
        $previlege->user()->save( $user );
        Mutation::create([
            'customer_id'       => $previlege->id,
            'transaction_id'    => 0 ,
            'nominal'           => 0,
            'position'          => 1,
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
        #notations
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
        $this->data[ 'balance' ]             = Mutation::getAccumulations( $user->userable->id )->first()->total;
        $this->data[ 'credit' ]              = Mutation::getAccumulations( $user->userable->id, 1 )->first()->total;
        $debit                               = Mutation::getAccumulations( $user->userable->id, 2 )->first();
        $this->data[ 'debit' ]               =  ( $debit != NULL ) ? $debit->total : 0 ;
        // modal pencairan
        $modalwithdrawal['modalTitle']    = "Buat Pencairan";
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
        $fileName = "PROFILE_".time().".".$request->photo->getClientOriginalExtension();
        
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
