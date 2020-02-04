<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UserController;
use Auth;
use App\Alert;
use App\User;
use App\Model\Customer;
use Session;
use Illuminate\Support\Facades\Hash;


class ProfileController extends UserController
{
    public function __construct()
    {
        parent::__construct();
        $this->data[ 'page_title' ]          = 'PROFIL';
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user       = Auth::user() ;
        $user->role = $user->roles[0]->id;
        $user->role_name = $user->roles[0]->role_name;
        // dd( $user->roles );
        $detail     = view('layouts.templates.forms.form_fields_readonly', [ 'formFields' => User::getFormData( FALSE ), 'data'=> $user ] );

        $linkEdit['url']        = route('profiles.edit', $user->id);
        $linkEdit['linkName']   = 'Edit';
        $linkEdit               = view('layouts.templates.tables.actions.link', $linkEdit);

        
        $this->data[ 'contents' ]            = $detail.'<br>'.$linkEdit;

        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'header' ]              = $user->name;
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
    public function show( $id )
    {
        
        $user       = Auth::user() ;
        $user->role = $user->roles[0]->id;
        $user->role_name = $user->roles[0]->role_name;
        // dd( $user->roles );
        $detail     = view('layouts.templates.forms.form_fields_readonly', [ 'formFields' => User::getFormData( FALSE ), 'data'=> $user ] );

        $linkEdit['url']        = route('profiles.edit', $user->id);
        $linkEdit['linkName']   = 'Edit';
        $linkEdit               = view('layouts.templates.tables.actions.link', $linkEdit);
        $this->data[ 'contents' ]            = $detail.'<br>'.$linkEdit;

        # modal
        $modalUploadPhoto['modalTitle']    = "Upload Foto";
        $modalUploadPhoto['modalId']       = "upload";
        $modalUploadPhoto['formMethod']    = "post";
        $modalUploadPhoto['formEnctype']    = "multipart";
        $modalUploadPhoto['formUrl']       = route('profile.upload_photo') ;
        $modalUploadPhoto['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                'photo' => [
                                                    'type' => 'file',
                                                    'label' => 'Foto',
                                                ],
                                        ]] );
        $modalUploadPhoto = view('layouts.templates.modals.modal', $modalUploadPhoto );

        if( Auth::user()->hasRole( 'customer' ) )
        {
             # modal upload identity photo
            $modalUploadIdentity['modalTitle']    = "Upload Foto KTP";
            $modalUploadIdentity['modalId']       = "upload_idendity_photo";
            $modalUploadIdentity['formMethod']    = "post";
            $modalUploadIdentity['formEnctype']   = "multipart";
            $modalUploadIdentity['formUrl']       = route('customers.identity_photo', Auth::user()->userable->id) ;
            $modalUploadIdentity['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
                                                    'photo' => [
                                                        'type' => 'file',
                                                        'label' => 'Foto',
                                                    ],
                                            ]] );
            $modalUploadIdentity = view('layouts.templates.modals.modal', $modalUploadIdentity );
            $this->data[ 'modalUploadIdentity' ]    = $modalUploadIdentity;
        }

        $this->data[ 'modalUploadPhoto' ]    = $modalUploadPhoto;
        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'header' ]              = 'Detail';
        $this->data[ 'sub_header' ]          = '';
        return $this->render( 'profile.detail' );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function uploadProfilPhoto( Request $request )
    {
        $request->validate( [
            'photo' => 'required|file|max:1024',
        ] );
        $fileName = "PROFILE_".time().".".$request->photo->getClientOriginalExtension();
        
        if( $request->photo->move( User::PHOTO_PATH, $fileName ) )
        {
            $user       = Auth::user() ;
            $oldPhoto   = $user->photo;
            if( $oldPhoto != 'default.jpg' )
                unlink( User::PHOTO_PATH."/".$oldPhoto );

            $user->update( [
                'photo' => $fileName
            ] );
        }
        return redirect()->route('profiles.show', $user->id )->with(['message' => Alert::setAlert( 1, "Foto Berhasil di upload" ) ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $user       = Auth::user() ;
        $user->role = $user->roles[0]->id;
        $user->role_name = $user->roles[0]->role_name;
      
        $form[ 'formUrl' ]      = route('profiles.update', $user->id);
        $form[ 'formMethod' ]   = 'post';
        $form[ 'blank' ]        = 'blank';
        $formFields = User::getFormData(  );
        unset( $formFields['role'] );
        $formFields["_method"] = [
            'type' => 'hidden',
            'value' => "PUT"
        ];
        $form[ 'content' ]      = view('layouts.templates.forms.form_fields', [ 'formFields' => $formFields , 'data'=> $user ] );
        $form                   = view('layouts.templates.forms.form', $form );
        
        $this->data[ 'contents' ]            = $form ;
        
        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'header' ]              = 'edit '.$user->name;
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
       
        $user       = Auth::user() ;
        if( $request->input('email') != $user->email )
            $validationConfig[ 'email' ] []= 'unique:users';

        if( $request->input('_password') != NULL )
        {
            $validationConfig[ '_password' ] = ['required', 'string', 'min:4', 'confirmed'];
        }
        
        $request->validate( $validationConfig );
        
        $data = [
            'name' =>  $request->input('name'),
            'email' =>  $request->input('email'),
            'phone'  =>  $request->input('phone'),
            'address'  =>  $request->input('address'),
        ];
        // dd( $data );die;
        if( $request->input('_password') != NULL )
        {
            Auth::logout();
            $data['password'] = Hash::make( $request->input('_password') );
        }

        $user->update( $data );

        return redirect()->route('profiles.show', $id )->with(['message' => Alert::setAlert( 1, "data berhasil di edit" ) ]);
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
        if( ! Auth::user()->hasRole( 'customer' ) )
        {
            return redirect()->back()->with(['message' => Alert::setAlert( Alert::DANGER, "Bukan Customer" ) ]);
        }
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
