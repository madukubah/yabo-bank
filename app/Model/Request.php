<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Request extends Model
{
    protected $fillable = [
		'id', 
		'customer_id', 
		'code', 
		'status', 
		'info', 
    ];
    
    public function customer()
    {
        return $this->belongsTo('App\Model\Customer');
    }

    public function pickUp()
    {
        return $this->hasOne('App\Model\PickUp');
    }
}
