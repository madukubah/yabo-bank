<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

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

    public static function getAccumulations( $customer_id = NULL, $position = 0 )
    {
        $mutations = DB::table('mutations')
                  ->selectRaw(  "
                      SUM( CASE WHEN mutations.position = 1 THEN  mutations.nominal ELSE 0 end  ) as credit_total,
                      SUM( CASE WHEN mutations.position = 2 THEN  mutations.nominal ELSE 0 end  ) as debit_total,
                      mutations.customer_id
                  "  )
                  ->groupBy('mutations.customer_id');
                  // ->groupBy('mutations.position');
                  
        if( $position != NULL )
            $mutations->where('mutations.position', $position );

        $mutations =  DB::table( DB::raw("({$mutations->toSql()}) mutations ") )
        ->mergeBindings($mutations )
        ->selectRaw('
            ( mutations.credit_total - mutations.debit_total  ) as total,
            customers.id as customer_id,
            CONCAT( customers.code, " " )  as customer_code,
            users.id as user_id,
            users.name,
            users.userable_type
        ')
        ->join('customers', 'customers.id', '=', 'mutations.customer_id')
        ->join('users', 'customers.id', '=', 'users.userable_id')
        ->where('users.userable_type', 'like', '%Customer');

        if( $customer_id != NULL )
            $mutations->where('customers.id', $customer_id );

        return $mutations;
    }

    public static function accountBook( $customer_id = NULL )
    {
        $mutations = DB::table('mutations')
                  ->selectRaw(  "
                        *,
                      ( CASE WHEN mutations.position = 1 THEN  mutations.nominal ELSE 0 end  ) as credit_total,
                      ( CASE WHEN mutations.position = 2 THEN  mutations.nominal ELSE 0 end  ) as debit_total
                  "  )->where('mutations.customer_id', $customer_id );
                //   ->groupBy('mutations.customer_id');
                  // ->groupBy('mutations.position');
        // dd( $mutations->toSql() );die;
        return $mutations;
    }
}
