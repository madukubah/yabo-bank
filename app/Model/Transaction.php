<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = [
		'id', 
		'code',
		'customer_id',
		'driver_id',
		'product',
		'unit',
		'price',
		'quantity',
    ];
    public function mutation()
    {
        return $this->hasOne('App\Model\Mutation');
	}
	public function customer()
    {
        return $this->belongsTo('App\Model\Customer');
	}
	public static function createTransaction( $data = [] )
    {
        $last = Transaction::latest()->first();
        $last = ( $last != NULL ) ? $last->id : 0;
        $last++;
        $code = "TRANSACTION_".date('mY');
        $code = $code.str_pad( $last, 5, "0", STR_PAD_LEFT);
        // dd( $code );die;
        $data['code'] = $code;

        return Transaction::create($data);
    }
}
