<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UadminController;

use Session;
use App\User;
use App\Model\Role;
use App\Model\Mutation;
use App\Alert;
use Auth;
use DB;
use App\Model\Driver;
use Illuminate\Support\Facades\Hash;

class DriverController extends UadminController
{
    public function __construct()
    {
        parent::__construct();
        $this->data[ 'menu_id' ] = "drivers";
        $this->data[ 'page_title' ]          = 'Driver';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $table[ 'header' ]  = [ 
            'userable->code' => 'Kode',
            'name' => 'Nama',
            'email' => 'Email',
         ];
        $table[ 'number' ]  = 1;
        
        $users = User::select([ 'role_name','name', 'email', 'users.id as id', 'userable_type', 'userable_id' ])
                                    ->join('role_user', 'role_user.user_id', '=', 'users.id')
                                    ->join('roles', 'roles.id', '=', 'role_user.role_id')
                                    ->where('users.id',"!=", Auth::user()->id )
                                    ->orderBy('roles.id',"asc" );

        $users = $users->where('roles.role_name', 'driver' );
        if( Auth::user()->roles()->first()->role_name != 'admin' )
        {
            $users = $users->where('roles.role_name',"!=", 'admin' );
            // $users = $users->where('roles.role_name',"!=", Auth::user()->roles()->first()->role_name );
        }
        // dd( $users->get()[2]->userable->code );die;

        $table[ 'rows' ]    = $users->get();
        $table[ 'action' ]  = [
            "link" => [
                "dataParam"     => "id",
                "linkName"      => "Detail",
                "url"           => url('drivers'),
                "buttonColor"   => "primary",
            ],//link
            "modal_delete" => [
                "modalId"       => "delete",
                "dataParam"     => "id",
                "modalTitle"    => "Hapus",
                "formUrl"       => url('drivers'),
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

        $table = view('layouts.templates.tables.plain_table', $table);

        $linkCreate['url']              = url('drivers/create');
        $linkCreate['linkName']         = 'Tambah Driver';
        $linkCreate                     = view('layouts.templates.tables.actions.link', $linkCreate);
        $this->data[ 'header_button' ]  = $linkCreate;


        $this->data[ 'contents' ]            = $table;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Driver';
        $this->data[ 'header' ]              = 'List';
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
        $form[ 'formUrl' ]      = url('drivers');
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $formFields = User::getFormData(  );
        unset( $formFields['_password'] );
        unset( $formFields['_password_confirmation'] );
        unset( $formFields['role'] );
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => [
            'driver_code' => [
                'type' => 'text',
                'label' => 'Kode Driver',
                'value' => 'Driver_'.time(),
                'readonly' => ''
            ],
        ] ] );
        $form[ 'content' ]      .= view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields ] );
        $form                   = view('layouts.templates.forms.form', $form );
        
        $this->data[ 'contents' ]            = $form ;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Driver';
        $this->data[ 'header' ]              = 'Tambah User';
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
        $user->putRole( 'driver' );
        $previlege = Driver::create( [
            'code' => $request->input('driver_code')
        ] );
        $previlege->user()->save( $user );
        return redirect()->route('drivers.index' )->with(['message' => Alert::setAlert( 1, "data berhasil di buat, PASSWORD PERTAMA adalah nama email sampai '@' " ) ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user       = User::findOrFail( $id );
        $user->role = $user->roles[0]->id;
        $user->role_name = $user->roles[0]->role_name;
        $this->data[ 'user' ]            = $user;

        // dd( $user->roles );
        $detail     = view('layouts.templates.forms.form_fields_readonly', [ 'formFields' => [
            'customer_code' => [
                'type' => 'text',
                'label' => 'Kode Driver',
                'placeholder' => '',
                'value' => $user->userable->code,
                'readonly' => ''
            ],
        ] ] );
        $formFields = User::getFormData( FALSE );
        unset( $formFields['role_name'] );
        
        $detail     .= view('layouts.templates.forms.form_fields_readonly', [ 'formFields' => $formFields, 'data'=> $user ] );

        $linkEdit['url']        = url('drivers').'/'. $user->id.'/edit';
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
        
        ##########
        # transaction 
        $transactionTable[ 'header' ]  = [ 
            'created_at'    => 'Tanggal',
            'customer->user->name'   => 'Nama',
            'product'       => 'Produk',
            'quantity'      => 'Jumlah',
            'total'         => 'Total',
        ];
        $transactionTable[ 'number' ]  = 1;
        // customer
        $transactionTable[ 'rows' ]    = $user->userable->transactions;
        $transactionTable = view('transaction.table', $transactionTable);
        $this->data[ 'transactionTable' ]       = $transactionTable;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Driver';
        $this->data[ 'header' ]              = 'detail';
        $this->data[ 'sub_header' ]          = '';
        
        return $this->render( 'driver.detail' );
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
      
        $form[ 'formUrl' ]      = url('drivers').'/'. $user->id;
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
        $this->data[ 'header' ]              = 'edit driver';
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
        // dd( $request->input('_password') );
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

        return redirect()->route('drivers.show', $id )->with(['message' => Alert::setAlert( 1, "data berhasil di edit" ) ]);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $user       = User::findOrFail( $id );
        $driver_id  = $user->userable->id;
        $driver     = Driver::findOrFail( $driver_id );
        $user->forgetRole();
        $user->delete();
        $driver->delete();
        return redirect()->route('drivers.index' )->with(['message' => Alert::setAlert( 1, "data berhasil di Hapus" ) ]);
    }
}
