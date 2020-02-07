<?php

namespace App\Exports;

use App\Model\CashFlow;
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

class CashFlowExport implements 
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
        return CashFlow::data(  )->whereBetween( 'cash_flows.date', [ $this->year.'-'.$this->month.'-01' , $this->year.'-'.$this->month.'-'.$count_days ] )->orderBy( 'cash_flows.date', 'asc' )->get();
    }
    
    public function map( $row): array
    {
        return [
            $row->date , $row->description, $row->credit, $row->debit
        ];
    }

    public function headings(): array
    {
        return [
            // '#',
            'Tanggal',
            'Deskripsi',
            'Kredit',
            'Debit',
        ];
    }
    public function registerEvents(): array
    {
        return [
            AfterSheet::class    => function(AfterSheet $event) {
                $cellRange = 'A1:W1'; // All headers
                $event->sheet->getDelegate()->getStyle($cellRange)->getFont()->setBold(true);

                $event->sheet->getDelegate()->getStyle('C2:D500')->getNumberFormat()->setFormatCode( '_("Rp "* #,##0.00_);_("$"* \(#,##0.00\);_("$"* "-"??_);_(@_)' );
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
