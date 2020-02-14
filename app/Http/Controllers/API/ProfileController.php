<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\User;
use App\Model\Customer;
use App\Model\Mutation;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Support\Facades\Hash;


class ProfileController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = Auth::user();
        // $user->userable->mutations;
        if( Auth::user()->hasRole('customer') )
        {
            $user->identity_photo =  $user->userable->identity_photo;
            $user->status         =  $user->userable->status;
        }
        $success['user'] =  $user;

        return $this->sendResponse( $success );
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
            $validationConfig[ '_password' ] = ['required', 'string', 'min:8', 'confirmed'];
        }

        $validator = Validator::make($request->all(), $validationConfig );

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

        $user->name     = $request->input('name');
        $user->email    = $request->input('email');
        $user->phone    = $request->input('phone');
        $user->address  = $request->input('address');
        if( $request->input('_password') != NULL )
        {
            $user->password  = Hash::make( $request->input('_password') );
        }
        $user->save();
        if( Auth::user()->hasRole('customer') )
        {
            $user->identity_photo =  $user->userable->identity_photo;
        }
        $data['user'] = $user;
        return $this->sendResponse( $data, 'data berhasil di edit' );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function uploadProfilPhoto( Request $request )
    {
        $validator = Validator::make($request->all(), [
            'photo' => 'required|file|max:1024',
        ]  );

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }
        // var_dump( $request->photo );die;
        $fileName = "PROFILE_".time().".".$request->photo->getClientOriginalExtension();

        if( $request->photo->move( User::PHOTO_PATH, $fileName ) )
        {
            $user = Auth::user();

            $oldPhoto   = $user->photo;
            if( $oldPhoto != 'default.jpg' )
                unlink( User::PHOTO_PATH."/".$oldPhoto );

            $user->update( [
                'photo' => $fileName
            ] );
        }
        if( Auth::user()->hasRole('customer') )
        {
            $user->identity_photo =  $user->userable->identity_photo;
        }
        $data['user'] = $user;

        return $this->sendResponse( $data, 'berhasil upload foto' );
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function uploadIdendityPhoto( Request $request )
    {
        // dd( $request->input() );die;
        $customer       = Auth::user()->userable ;
        $validator = Validator::make($request->all(), [
            'photo' => 'required|file|max:1024',
        ]  );

        if($validator->fails()){
            return $this->sendError('Validation Error.', $validator->errors());
        }

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
        // absolutely customer
        $user = Auth::user();
        $user->identity_photo =  $user->userable->identity_photo;
        $data['user'] = $user;
        return $this->sendResponse( $data, 'berhasil upload foto' );
    }

}
