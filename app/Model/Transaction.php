<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    protected $fillable = [
		'id', 
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
}
