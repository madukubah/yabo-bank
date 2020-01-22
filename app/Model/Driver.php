<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Driver extends Model
{
    protected $fillable = [
        'id', 
        'code' ,

    ];
    public function user()
    {
        return $this->morphOne('App\User', 'userable');
    }
    public function pickUps()
    {
        return $this->hasMany('App\Model\PickUp');
    }
    public function transactions()
    {
        return $this->hasMany('App\Model\Transaction');
    }
}
