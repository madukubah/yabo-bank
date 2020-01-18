@extends( 'layouts.admin.app' )

@section('sidebar')
    <?= $sidebar = ( isset( $sidebar ) ) ? $sidebar : ''  ?>
@endsection

@section('content')
<!-- Content Header (Page header) -->
<div class="content-header">
    <div class="container-fluid">
        <div class="row mb-2">
            <div class="col-sm-6">
                <h1 class="m-0 text-dark"><?= $page_title = ( isset( $page_title ) ) ? strtoupper( $page_title ) : ''  ?></h1>
            </div>
            <!-- /.col -->
            <!-- <div class="col-sm-6">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="#">Home</a></li>
                    <li class="breadcrumb-item active">Dashboard v1</li>
                </ol>
            </div> -->
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <!--  -->
                <div class="invoice p-3 mb-3">
                <!-- title row -->
                <div class="row">
                    <div class="col-12">
                    <h4>
                        <i class="fas fa-globe"></i> Yabo BANK
                        <small class="float-right">Date: <?= date('d/m/Y')?></small>
                    </h4>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- info row -->
                <div class="row invoice-info">
                    <div class="col-sm-4 invoice-col">
                        <address>
                        <strong><?= $request->customer->code?></strong><br>
                        <?= $request->customer->user->name?><br>
                        <?= $request->customer->user->address?><br>
                        Phone: <?= $request->customer->user->phone?><br>
                        Email: <?= $request->customer->user->email?> <br>
                        Keterangan: <?= $request->info?>
                        </address>
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                  
                    </div>
                    <!-- /.col -->
                    <div class="col-sm-4 invoice-col">
                    <b>Invoice #007612</b><br>
                    <br>
                    <b>Order ID:</b> 4F3S8J<br>
                    <b>Payment Due:</b> 2/22/2014<br>
                    <b>Account:</b> 968-34567
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- Table row -->
                <div class="row">
                    <div class="col-12 table-responsive">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>Produk</th>
                                <th>Harga / Satuan</th>
                                <th>Jumlah</th>
                                <th>Sub Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php 
                                foreach( $tableData as $data ):
                            ?>
                                <tr>
                                    <td>
                                        <?= $data->product_name?>
                                    </td>
                                    <td>
                                        <?= $data->product_price_per_unit ?>
                                    </td>
                                    <td>
                                        <?= $data->quantity ?>
                                    </td>
                                    <td>
                                        <?= $data->sub_total ?>
                                    </td>
                                </tr>
                            <?php endforeach;?>
                        </tbody>
                    </table>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
                <div class="row">
                    <!-- accepted payments column -->
                    <div class="col-6">
                    
                    </div>
                    <!-- /.col -->
                    <div class="col-6">
                    <div class="table-responsive">
                        <table class="table">
                        <tbody>
                        <tr>
                            <th>Total:</th>
                            <th id="total" > <?= $total ?> </th>
                        </tr>
                        </tbody></table>
                    </div>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->

                <!-- this row will not appear when printing -->
                    <div class="row" >
                        <div class='col' >
                            <div class="float-right" >
                                <?= $modalConfirm ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- /.content -->
@endsection
@section('js')

@endsection
