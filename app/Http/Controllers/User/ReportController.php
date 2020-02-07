<?php

namespace App\Http\Controllers\User;

use Illuminate\Http\Request;
use App\Http\Controllers\UadminController;
use Session;
use App\Model\CashFlow;
use App\Model\CashOut;
use App\Model\Mutation;
use App\Model\Payment;
use App\Alert;

class ReportController extends UadminController
{
    public $MONTH = [
        1 => 'Januari',
        2 => 'Februari',
        3 => 'Maret',
        4 => 'April',
        5 => 'Mei',
        6 => 'Juni',
        7 => 'Juli',
        8 => 'Agustus',
        9 => 'September',
        10 => 'Oktober',
        11 => 'November',
        12 => 'Desember',
    ];

    public $YEAR = [
        2020 => '2020',
        2021 => '2021',
        2022 => '2022',
        2023 => '2023',
        2024 => '2024',
    ];
    public function __construct()
    {
        parent::__construct();
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // modalProcessData
        $modalProcessData['modalTitle']    = "Proses data";
        $modalProcessData['modalId']       = "create";
        $modalProcessData['formMethod']    = "post";
        $modalProcessData['formUrl']       = route('process.data') ;
        $modalProcessData['modalBody']     = view('layouts.templates.forms.form_fields', [ 'formFields' => [
            'month' => [
                'type'      => 'select',
                'label'     => 'Bulan',
                'options'   => $this->MONTH,
                'value'     => date('m'),

            ],
            'year' => [
                'type'      => 'select',
                'label'     => 'Tahun',
                'options'   => $this->YEAR,
                'value'     => date('Y'),
            ],
        ] ] );
        $modalProcessData = view('layouts.templates.modals.modal', $modalProcessData );
        $this->data[ 'modalProcessData' ]       = $modalProcessData;


        $this->data[ 'message_alert' ]       = Session::get('message');
        $this->data[ 'page_title' ]          = 'Proses Data dan Laporan';
        $this->data[ 'header' ]              = '';
        $this->data[ 'sub_header' ]          = '';
        return $this->render( 'report.content' );   
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function processData(Request $request)
    {
        $this->validate($request, [
            'month'             => 'required',
            'year'              => 'required',
        ]);
        $month =  $request->input( 'month' );
        $year =  $request->input( 'year' );
        
        $data = [];
        $data = array_merge( 
                Mutation::toCashFlow( $month, $year ), 
                Payment::toCashFlow( $month, $year ), 
                CashOut::toCashFlow( $month, $year ) 
        );

		$count_days = cal_days_in_month(CAL_GREGORIAN, $month, $year );

        CashFlow::whereBetween( 'date', [ $year.'-'.$month.'-01' , $year.'-'.$month.'-'.$count_days ] )->delete();
        CashFlow::insert($data);
        return redirect()->back()->with(['message' => Alert::setAlert( Alert::SUCCESS, "data berhasil di proses" ) ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }


    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
