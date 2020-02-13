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
            <div class="col-10">
                <div class="card">
                    <div class="card-header">
                        <div class="col-12">
                                <?= $message_alert = ( isset( $message_alert ) ) ? $message_alert : ''  ?>
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <h5>
                                    <?= $header = ( isset( $header ) ) ? strtoupper( $header ) : ''  ?>
                                    <p class="text-secondary"><small><?= $sub_header = ( isset( $sub_header ) ) ? $sub_header : ''  ?></small></p>
                                </h5>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-2"></div>
                                    <div class="col-10">
                                        <div class="float-right">
                                            <?php echo (isset( $header_button )) ? $header_button : '';  ?>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                    <!--  -->
                    <?php echo (isset($contents)) ? $contents : '';  ?>
                    <!--  -->
                    <!--  -->
                    <?php echo (isset($pagination_links)) ? $pagination_links : '';  ?>
                    <!--  -->
                    </div>
                </div>
            </div>
             <!-- photo -->
             <div class=" col-md-2 ">
                <div class="row clearfix">
                    <div class=" col-md-12 ">
                        <div class="card">
                            <div class="card-body">
                                <img class=" img-fluid " src="<?= url('uploads/users/'.$user->photo ) ?>" width="100%" >
                                <br>
                                <br>
                                <?php echo ( isset( $modalUploadPhoto )  ) ? $modalUploadPhoto : '' ;  ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  -->
            <!-- transaction -->
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <div class="col-12">
                           
                        </div>
                        <div class="row">
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <h5>
                                    Transaksi
                                    <p class="text-secondary"><small><?= $sub_header = ( isset( $sub_header ) ) ? $sub_header : ''  ?></small></p>
                                </h5>
                            </div>
                            <div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
                                <div class="row">
                                    <div class="col-2"></div>
                                    <div class="col-10">
                                        <div class="float-right mr-5">
                                           
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                    
                    <!--  -->
                    <?php echo (isset($transactionTable)) ? $transactionTable : '';  ?>
                    <!--  -->
                    <!--  -->
                    <?php echo (isset($pagination_links)) ? $pagination_links : '';  ?>
                    <!--  -->
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
