<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BaseController extends Controller
{
    public $successStatus = 200;

     /**
     * success response method.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendResponse($result, $message = '' )
    {
    	$response = [
            'success' => true,
            'data'    => $result,
            'message' => $message,
        ];


        return response()->json($response, 200);
    }


    /**
     * return error response.
     *
     * @return \Illuminate\Http\Response
     */
    public function sendError($error = NULL , $errorMessages = [], $code = 200)
    {
        $message = json_encode( $errorMessages );
        $message = json_decode( $message );
        $errorMessages = (array) $message ;
        $message = '' ;
        // var_dump( $message[ 'phone' ][0] );die;
        if( is_array( $errorMessages ) )
        {

            foreach( $errorMessages as $message_ )
            {
                if( is_array( $message_ ) )
                {
                    foreach( $message_ as $item )
                    {
                        $message .= $item."\n";
                    }
                }
                else
                {
                    $message .= "asdffd \n";//$message_;
                }
            }
        }
        else
        {
            $message = $errorMessages;
        }
    	$response = [
            'success' => false,
            'message' => $message,
            'data' => null,
        ];

        return response()->json($response, $code);
    }
}
