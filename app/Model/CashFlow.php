<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

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

    public static function data(  )
    {
        $cash_flows = DB::table('cash_flows')
                  ->selectRaw(  "
                        *,
                      ( CASE WHEN cash_flows.position = 1 THEN  cash_flows.nominal ELSE 0 end  ) as credit,
                      ( CASE WHEN cash_flows.position = 2 THEN  cash_flows.nominal ELSE 0 end  ) as debit
                  "  );
        return $cash_flows;
    }
}
