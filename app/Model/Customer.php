<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    public const PHOTO_PATH = "uploads/identity_photo";

    protected $fillable = [
        'id',
        'code' ,
        'status' ,
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
