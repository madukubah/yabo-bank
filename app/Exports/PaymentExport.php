<?php

namespace App\Exports;

use App\Model\Payment;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\FromArray;
use Maatwebsite\Excel\Concerns\WithStrictNullComparison;

use Maatwebsite\Excel\Concerns\WithColumnFormatting;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\WithHeadings;
use PhpOffice\PhpSpreadsheet\Style\NumberFormat;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

use Maatwebsite\Excel\Concerns\WithEvents;
use Maatwebsite\Excel\Events\AfterSheet;

class PaymentExport implements 
        FromCollection, 
        WithMapping, 
        WithStrictNullComparison, 
        WithColumnFormatting,
        ShouldAutoSize,
        WithHeadings, 
        WithEvents
{
    private $year;
    private $month;

    public function __construct( int $month, int $year) 
    {
        $this->year = $year;
        $this->month = $month;
    }

    public function collection()
    {
		$count_days = cal_days_in_month(CAL_GREGORIAN, $this->month, $this->year );

        return Payment::whereBetween( 'payments.date', [ $this->year.'-'.$this->month.'-01' , $this->year.'-'.$this->month.'-'.$count_days ] )->get();
    }
    
    public function map( $row): array
    {
        return [
            $row->date , 
            $row->invoice->salesOrder->container_number.' / '.$row->invoice->salesOrder->container_number , 
            $row->invoice->salesOrder->factory_name,
            $row->invoice->salesOrder->send_date,
            $row->invoice->salesOrder->unloading_date,
            $row->amount,
        ];
    }

    public function headings(): array
    {
        return [
            // '#',
            'Tanggal',
            'No. Kontainer / No. Mobil',
            'Nama Pabrik',
            'Tanggal Kirim',
            'Tanggal Bongkar',
            'Total Pembayaran',
        ];
    }
    public function registerEvents(): array
    {
        return [
            AfterSheet::class    => function(AfterSheet $event) {
                $cellRange = 'A1:W1'; // All headers
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setBold(true);

                $event->sheet->getDelegate()->getStyle('F2:F500')->getNumberFormat()->setFormatCode( '_("Rp "* #,##0.00_);_("$"* \(#,##0.00\);_("$"* "-"??_);_(@_)' );
            },
        ];
    }
    public function startCell(): string
    {
        return 'B2';
    }

    public function columnFormats(): array
    {
        return [
            'A' =>  NumberFormat::FORMAT_DATE_DDMMYYYY ,
        ];
    }
}
