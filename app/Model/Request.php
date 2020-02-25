<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Request extends Model
{
    public const PHOTO_PATH = "uploads/requests";
    protected $fillable = [
		'id',
		'customer_id',
		'code',
		'status',
		'info',
		'photo',
		'latitude',
		'longitude',
    ];

    public function customer()
    {
        return $this->belongsTo('App\Model\Customer');
    }

    public function pickUp()
    {
        return $this->hasOne('App\Model\PickUp');
    }

    public function a()
    {
        return $this->hasOne('App\Model\PickUp');
    }
}
