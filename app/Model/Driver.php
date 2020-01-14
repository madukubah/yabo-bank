<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Driver extends Model
{
    protected $fillable = [
        'id', 
    ];
    public function user()
    {
        return $this->morphOne('App\User', 'userable');
    }
    public function pickUps()
    {
        return $this->hasMany('App\Model\PickUp');
    }
}
