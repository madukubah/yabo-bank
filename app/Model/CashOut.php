<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class CashOut extends Model
{
    protected $fillable = [
		'id', 
		'description', 
		'nominal', 
		'date', 
    ];

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
