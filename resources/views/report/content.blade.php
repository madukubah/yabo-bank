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
        <div class="col-lg-12">
            <?= $message_alert = ( isset( $message_alert ) ) ? $message_alert : ''  ?>
        </div>
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title m-0">Proses Data</h5>
                </div>
                <div class="card-body">

                    <p class="card-text">
                    Lakukan Proses Data terlebih dahulu sebelum meng-generate laporan-laporan
                    </p>

                    <?= $modalProcessData?>
                </div>
            </div>
        </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title m-0">Data Pembelian</h5>
              </div>
              <div class="card-body">
                <p class="card-text">Lakukan Proses Data terlebih dahulu sebelum meng-generate laporan.</p>
                <a href="#" class="btn btn-primary">Go somewhere</a>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h5 class="card-title m-0">Data Pembayaran</h5>
              </div>
              <div class="card-body">
                <p class="card-text">Lakukan Proses Data terlebih dahulu sebelum meng-generate laporan.</p>
                <?= $modalgetPayment ?>
              </div>
            </div>

          </div>
          <!-- /.col-md-6 -->
          <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title m-0">Cash Flow</h5>
                </div>
                <div class="card-body">

                    <p class="card-text">
                    Lakukan Proses Data terlebih dahulu sebelum meng-generate laporan
                    </p>
                    <?= $modalgetCashFlow ?>
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
