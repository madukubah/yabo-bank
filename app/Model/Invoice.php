<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
		'id', 
		'code', 
		'selling_id', 
		'date', 
		'due_date', 
    ];
    public function payments()
    {
        return $this->hasMany('App\Model\Payment');
    }
    
    public function salesOrder()
    {
        return $this->belongsTo('App\Model\Selling', 'selling_id');
    }

    public static function getCode(  )
    {
        $last = Invoice::latest()->first();
        $last = ( $last != NULL ) ? $last->id : 0;
        $last++;
        $code = "INVOICE_".date('mY');
        return $code = $code.str_pad( $last, 5, "0", STR_PAD_LEFT);
    }

    public static function getFormData(  )
    {
        $form =  [
            'id' => [
                'type' => 'hidden',
            ],
            'selling_id' => [
                'type' => 'hidden',
            ],
            'code' => [
                'type' => 'hidden',
                'label' => 'Code',
                'readonly' => true,
                'value' => Invoice::getCode(  )
            ],
            'factory_name' => [
                'type' => 'hidden',
                'label' => 'Nama Pabrik',
                'readonly' => true,
                // 'value' => "KARYA AGUNG REALITI"
            ],
            'container_number' => [
                'type' => 'text',
                'label' => 'No. Kontainer',
                'weight' => 'col-md-6',
                'readonly' => true,
                // 'value' => "TEGU 682378(9)4561"
            ],
            'car_number' => [
                'type' => 'text',
                'label' => 'No. Mobil',
                'readonly' => true,
                'weight' => 'col-md-6',
                // 'value' => "8762 MJ"
            ],
            'date' => [
                'type' => 'date',
                'label' => 'Tanggal Invoice',
                'weight' => 'col-md-6',
            ],
            'due_date' => [
                'type' => 'date',
                'label' => 'Jatuh Tempo',
                'weight' => 'col-md-6',
            ],
            'netto' => [
                'type' => 'number',
                'label' => 'Netto ( Kg )',
                'readonly' => true,
                'weight' => 'col-md-6',
                // 'value' => 20409
            ],
            'selling_price' => [
                'type'  => 'number',
                'weight' => 'col-md-6',
                'readonly' => true,
                'label' => 'Harga Jual',
                // 'value' => 2115
            ],
        ];

        return $form;
    }

}