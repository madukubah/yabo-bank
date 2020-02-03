<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;
use DB;

class Selling extends Model
{
    protected $fillable = [
		'id', 
		'factory_name', 
		'container_number', 
		'car_number', 
		'send_date', 
		'unloading_date', 
		'gross', 
		'cut_off', 
		'selling_price', 
    ];

    public static function getData(  )
    {
        $sellings = DB::table('sellings')
                  ->selectRaw(  '
                        *,
                        CONCAT( container_number, " / ", car_number )  as container_car,
                      ( gross -  cut_off ) as netto,
                      ( ( gross -  cut_off ) * selling_price ) as total
                  '  );
        return $sellings;
    }

    public static function getFormData(  )
    {
        $form =  [
            'id' => [
                'type' => 'hidden',
            ],
            'factory_name' => [
                'type' => 'text',
                'label' => 'Nama Pabrik',
                // 'value' => "KARYA AGUNG REALITI"
            ],
            'container_number' => [
                'type' => 'text',
                'label' => 'No. Kontainer',
                // 'value' => "TEGU 682378(9)4561"
            ],
            'car_number' => [
                'type' => 'text',
                'label' => 'No. Mobil',
                // 'value' => "8762 MJ"
            ],
            'send_date' => [
                'type' => 'date',
                'label' => 'Tanggal Kirim',
            ],
            'unloading_date' => [
                'type' => 'date',
                'label' => 'Tanggal Bongkar',
            ],
            'gross' => [
                'type' => 'number',
                'label' => 'Bruto ( Kg )',
                // 'value' => 20409
            ],
            'cut_off' => [
                'type' => 'number',
                'label' => 'Potongan ( Kg )',
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
