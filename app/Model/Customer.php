<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{

    protected $fillable = [
        'id', 
        'code' ,
    ];
    //
    public function user()
    {
        return $this->morphOne('App\User', 'userable');
    }

    public function requests()
    {
        return $this->hasMany('App\Model\Request');
    }

    public function mutations()
    {
        return $this->hasMany('App\Model\Mutation');
    }
}
