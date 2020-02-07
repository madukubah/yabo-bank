<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;


class Payment extends Model
{
    protected $fillable = [
		'id', 
		'code', 
		'invoice_id', 
		'date', 
		'amount', 
    ];
    public function invoice()
    {
        return $this->belongsTo('App\Model\Invoice');
    }

    public function sumAmount( $invoiceId )
    {
        $sum = DB::table('payments')
                    ->where('invoice_id', $invoiceId)
                    ->sum('amount');
        return $sum;
    }

    public static function sumByInvoiceId( $invoiceId )
    {
        $sum = DB::table('payments')
                    ->where('invoice_id', $invoiceId)
                    ->sum('amount');
        return $sum;
    }

    public static function getCode(  )
    {
        $last = Payment::latest()->first();
        $last = ( $last != NULL ) ? $last->id : 0;
        $last++;
        $code = "PAYMENT_".date('mY');
        return $code = $code.str_pad( $last, 5, "0", STR_PAD_LEFT);
    }

    public static function toCashFlow( $month, $year )
    {
		$count_days = cal_days_in_month(CAL_GREGORIAN, $month, $year );
        //find withdrawal
        $payments = Payment::whereBetween( 'date', [ $year.'-'.$month.'-01' , $year.'-'.$month.'-'.$count_days ] );


        $data = [];
        foreach( $payments->get() as $item )
        {
            $data []= [
                'date'          => $item->date,
                'description'   => "payment from ".$item->invoice->salesOrder->factory_name,
                'position'      => 2,
                'nominal'       => $item->amount,
                'resource_code' => $item->code,
                'resource_type' => 'App\\Model\\Payment',
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
            'invoice_id' => [
                'type' => 'text',
            ],
            'code' => [
                'type' => 'text',
                'label' => 'Code',
                'readonly' => true,
                'value' => Payment::getCode(  )
            ],
            'date' => [
                'type' => 'date',
                'label' => 'Tanggal Pembayaran',
            ],
            'amount' => [
                'type' => 'number',
                'label' => 'Masukkan Nominal',
                'placeholder' => '',
                'value' => '',
            ],
        ];

        return $form;
    }
}
