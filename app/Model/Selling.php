<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Selling extends Model
{
    protected $fillable = [
		'id', 
		'code', 
		'factory_name', 
		'container_number', 
		'car_number', 
		'send_date', 
		'unloading_date', 
		'gross', 
		'cut_off', 
		'selling_price', 
    ];

    public function invoice()
    {
        return $this->hasOne('App\Model\Invoice');
    }

    public static function getData(  )
    {
        $sellings = DB::table('sellings')
                  ->selectRaw(  '
                        *,
                        CONCAT( container_number, " / ", car_number )  as container_car,
                      ( gross -  cut_off ) as netto,
                      ( ( gross -  cut_off ) * selling_price ) as total
                    ' );
        return $sellings;
    }

    public static function getCode(  )
    {
        $last = Selling::latest()->first();
        $last = ( $last != NULL ) ? $last->id : 0;
        $last++;
        $code = "SO_".date('mY');
        return $code = $code.str_pad( $last, 5, "0", STR_PAD_LEFT);

    }
    public static function getFormData(  )
    {
        $form =  [
            'id' => [
                'type' => 'hidden',
            ],
            'code' => [
                'type' => 'text',
                'label' => 'Code',
                'readonly' => true,
            ],
            'factory_name' => [
                'type' => 'text',
                'label' => 'Nama Pabrik',
                // 'value' => "KARYA AGUNG REALITI"
            ],
            'container_number' => [
                'type' => 'text',
                'label' => 'No. Kontainer',
                'weight' => 'col-md-6',
                // 'value' => "TEGU 682378(9)4561"
            ],
            'car_number' => [
                'type' => 'text',
                'label' => 'No. Mobil',
                'weight' => 'col-md-6',
                // 'value' => "8762 MJ"
            ],
            'send_date' => [
                'type' => 'date',
                'label' => 'Tanggal Kirim',
                'weight' => 'col-md-6',
            ],
            'unloading_date' => [
                'type' => 'date',
                'label' => 'Tanggal Bongkar',
                'weight' => 'col-md-6',
            ],
            'gross' => [
                'type' => 'number',
                'label' => 'Bruto ( Kg )',
                'weight' => 'col-md-6',
                // 'value' => 20409
            ],
            'cut_off' => [
                'type' => 'number',
                'label' => 'Potongan ( Kg )',
                'weight' => 'col-md-6',
                // 'value' => 0
            ],
            'selling_price' => [
                'type'  => 'number',
                'label' => 'Harga Jual',
                // 'value' => 2115
            ],
        ];

        return $form;
    }

}
