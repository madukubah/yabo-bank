<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PickUp extends Model
{
    protected $fillable = [
		'id', 
		'request_id', 
		'driver_id', 
		'status', 
    ];

    public function request()
    {
        return $this->belongsTo('App\Model\Request');
    }

    public function driver()
    {
        return $this->belongsTo('App\Model\Driver');
    }
}
