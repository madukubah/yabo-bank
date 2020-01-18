<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Mutation extends Model
{
    protected $fillable = [
		'id', 
		'customer_id', 
		'transaction_id', 
		'nominal', 
		'position', 
		'description', 
    ];
    public function transaction()
    {
        return $this->belongsTo('App\Model\Transaction');
    }
}
