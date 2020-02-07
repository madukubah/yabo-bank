<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CashFlow extends Model
{
    protected $fillable = [
		'id', 
		'date', 
		'description', 
		'position', // 1 creadit, 2 debit
		'nominal', 
		'resource_code', 
		'resource_type', 
		'resource_id', 
    ];
}
