<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CashOut extends Model
{
    protected $fillable = [
		'id', 
		'code', 
		'description', 
		'nominal', 
		'date', 
    ];

    public static function getCode(  )
    {
        $last = CashOut::latest()->first();
        $last = ( $last != NULL ) ? $last->id : 0;
        $last++;
        $code = "CASH_OUT_".date('mY');
        return $code = $code.str_pad( $last, 5, "0", STR_PAD_LEFT);
    }

    public static function toCashFlow( $month, $year )
    {
		$count_days = cal_days_in_month(CAL_GREGORIAN, $month, $year );

        //find withdrawal
        $cashOuts = CashOut::whereBetween( 'date', [ $year.'-'.$month.'-01' , $year.'-'.$month.'-'.$count_days ] );

        $data = [];
        foreach( $cashOuts->get() as $item )
        {
            $data []= [
                'date'          => $item->date,
                'description'   => $item->description,
                'position'      => 1,
                'nominal'       => $item->nominal,
                'resource_code' => $item->code,
                'resource_type' => 'App\\Model\\CashOut',
                'resource_id'   => $item->id,
            ];
        }
        return $data;
    }

    public static function getFormData(  )
    {
        $form =  [
            'id' => [
                'type' => 'hidden',
            ],
            'date' => [
                'type' => 'date',
                'label' => 'Tanggal',
            ],
            'description' => [
                'type' => 'textarea',
                'label' => 'Keterangan',
                'value' => "Biaya Ekspedisi 682378(9)4561 / 8762 MJ"
            ],
            'nominal' => [
                'type' => 'number',
                'label' => 'Nominal',
                'value' => 10500000
            ],
        ];

        return $form;
    }


}
