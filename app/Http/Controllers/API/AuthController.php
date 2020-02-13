<?php


namespace App\Http\Controllers\API;


use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use App\User;
use App\Model\Customer;
use App\Model\Mutation;
use Illuminate\Support\Facades\Auth;
use Validator;

class AuthController extends BaseController
{
    public function login(){
        if(Auth::attempt(['email' => request('email'), 'password' => request('password')])){
            $user = Auth::user();
            $user->token =  $user->createToken('YABO_BANK')->accessToken;
            if( Auth::user()->hasRole('customer') )
            {
                $user->identity_photo =  $user->userable->identity_photo;
                $user->status         =  $user->userable->status;
            }
            $success['user'] =  $user;

            return $this->sendResponse( $success , 'login success');
        }
        else{
            return $this->sendError( NULL , 'login failed');
        }
    }

    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register( Request $request )
    {
        $validator = Validator::make($request->all(), [
            'name'          => 'required',
            'email'         => 'required|email|unique:users',
            'phone'         => 'required|unique:users',
            'address'       => 'required',
            'password'      => 'required',
            'c_password'    => 'required|same:password',
        ]);

        if($validator->fails()){
            return $this->sendError( 'Validation Error.', $validator->errors());       
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);

        $input['username']          = $input['name'];
        $input['phone']             = $input['phone'];
        $input['address']           = $input['address'];
        $input['photo']             = 'default.jpg';
        $input['identity_photo']    = 'default.jpg';
        $input['map_point']         = '0,0';

        $user = User::create($input);
        $user->putRole('customer');
        // customer
        $previlege = Customer::create( [
            'code' => 'Customer_'.time()
        ] );
        $previlege->user()->save( $user );
        Mutation::createMutaion([
            'customer_id'       => $previlege->id,
            'transaction_id'    => 0 ,
            'nominal'           => 0,
            'position'          => 2,
            'description'       => 'initial',
        ]);
        // customer
        // $success['token'] =  $user->createToken('YABO_BANK')->accessToken;
        $user->token =  $user->createToken('YABO_BANK')->accessToken;
        $success['user'] =  $user;

        return $this->sendResponse( $success , 'register success');
        
    }

    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return $this->sendResponse( 'Successfully logged out');
    }
}