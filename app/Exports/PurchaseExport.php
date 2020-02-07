<?php

namespace App\Exports;

use App\Model\Mutation;
use Maatwebsite\Excel\Concerns\FromCollection;

class PurchaseExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Mutation::all();
    }
}
