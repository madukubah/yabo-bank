<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Mutation extends Model
{
    protected $fillable = [
		'id', 
		'code', 
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

    public static function getAccumulations( $customer_id = NULL, $position = 0, $from = "2018", $to = NULL )
    {
        if( !isset( $to ) )
            $to = date( "Y-m-d", strtotime( "+ 1 day ", time() ) );
        
        $mutations = DB::table('mutations')
                  ->selectRaw(  "
                      SUM( CASE WHEN mutations.position = 1 THEN  mutations.nominal ELSE 0 end  ) as credit_total,
                      SUM( CASE WHEN mutations.position = 2 THEN  mutations.nominal ELSE 0 end  ) as debit_total,
                      mutations.customer_id
                  "  )
                  ->whereBetween( 'mutations.created_at', [ $from, $to ] )
                  ->groupBy('mutations.customer_id');
                  // ->groupBy('mutations.position');
                  
        if( $position != NULL )
            $mutations->where('mutations.position', $position );

        $mutations =  DB::table( DB::raw("({$mutations->toSql()}) mutations ") )
        ->mergeBindings($mutations )
        ->selectRaw('
            ( mutations.debit_total - mutations.credit_total   ) as total,
            customers.id as customer_id,
            customers.status as customer_status,
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
                  "  );
        if( $customer_id != NULL )
            $mutations->where('mutations.customer_id', $customer_id );

        return $mutations;
    }

    public static function createMutaion( $data = [] )
    {
        $last = Mutation::latest()->first();
        $last = ( $last != NULL ) ? $last->id : 0;
        $last++;
        $code = "MUTATION_".date('mY');
        $code = $code.str_pad( $last, 5, "0", STR_PAD_LEFT);
        // dd( $code );die;
        $data['code'] = $code;

        return Mutation::create($data);
    }

    public static function toCashFlow( $month, $year )
    {
		$count_days = cal_days_in_month(CAL_GREGORIAN, $month, $year );

        //find withdrawal
        $mutations = Mutation::accountBook();
        $mutations->whereBetween( 'mutations.created_at', [ $year.'-'.$month.'-01' , $year.'-'.$month.'-'.$count_days ] );
        $mutations->where('mutations.position', 1 );

        $data = [];
        foreach( $mutations->get() as $item )
        {
            $data []= [
                'date'          => $item->created_at,
                'description'   => $item->description,
                'position'      => 1,
                'nominal'       => $item->nominal,
                'resource_code' => $item->code,
                'resource_type' => 'App\\Model\\Mutation',
                'resource_id'   => $item->id,
            ];
        }
        return $data;
    }
}
