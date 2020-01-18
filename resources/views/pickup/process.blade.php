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
                <div class="card">
                    <div class="card-body">
                        <div class="row" >
                            <div class="col-12">
                                @if ($errors->any())
                                    <div class="alert alert-danger">
                                            @foreach ($errors->all() as $error)
                                                {{ $error }}
                                                <br>
                                            @endforeach
                                    </div>
                                @else
                                    <?= $message_alert = ( isset( $message_alert ) ) ? $message_alert : ''  ?>
                                @endif
                            </div>
                        </div>
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
                        </div>
                    <!--  -->
                        <button id="add" class="btn btn-primary float-right m-2" >Tambah</button>
                        <form action="{{route('invoices.create')}}" method="POST" >
                        @csrf
                        <!--  -->
                        <div class="table-responsive">
                            <table class="table table-striped table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Produk</th>
                                        <th>Harga / Satuan</th>
                                        <th>Jumlah</th>
                                        <th>Sub Total</th>
                                        <th>Aksi</th>
                                    </tr>
                                </thead>
                                <tbody id='table_body' >
                                </tbody>
                            </table>
                        </div>
                        <!--  -->
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
                                    <th id="total" > 0 </th>
                                </tr>
                                </tbody></table>
                            </div>
                            </div>
                            <!-- /.col -->
                        </div>
                        <br>
                        <input type="hidden" value='<?= $request->pickUp->id ?>' name='pickUpId' >
                        <button class="btn btn-bold btn-success btn-md float-right m-2 " style="margin-left: 5px;" type="submit">
                            Selanjutanya
                        </button>
                        <!--  -->
                        </form>

                    </div>
                </div>
            </div>
        </div>
       
    </div>
</section>
<div id='formProduct' class='fade'>
    <?= trim( $formProduct )?>
</div>
<textarea style="display:none" id="products" >
        <?php echo json_encode($products) ; ?>
</textarea>
<textarea style="display:none" id="units" >
        <?php echo json_encode($units) ; ?>
</textarea>
<!-- /.content -->
@endsection
@section('js')
<script>
    $(document).ready(function(){

        var products = JSON.parse( $("#products").val().trim() ) ;
        var units    = JSON.parse( $("#units").val().trim() ) ;

        $("#add").click(function(){
            html = get_form();
            $('#table_body').append(html);
        });
        $("#table_body").on('click','.hapus',function(){
            $(this).parent().parent().remove() ;
            setTotal();
        });
        $("#table_body").on('keyup','input[name="quantity[]"]',function(){
            var parentElem = $(this).parent().parent();
            var product = parentElem.find( 'select[name="product[]"]' );
            var price    = Number( products[ product.val() ] );
            var quantity = Number( $(this).val()  );
            parentElem.find( '.sub_total' ).html( price * quantity ) ;

            setTotal();
        });
        $("#table_body").on('change','select[name="product[]"]',function(){
            var parentElem = $(this).parent().parent().parent().parent();
            
            parentElem.find( '.price' ).html( products[ $(this).val() ]  + ' / ' +  units[ $(this).val() ] ) ;
            
            var quantity = parentElem.find( 'input[name="quantity[]"]' );
            var price    = Number( products[ $(this).val() ] );
            var quantity = Number( quantity.val()  );

            parentElem.find( '.sub_total' ).html( ( price * quantity ) ) ;
            setTotal();
        });

        function setTotal()
        {
            var subTotals = $(".sub_total")
              .map(function(){return $(this).html();}).get();
            var result = 0;
            for( var i=0; i< subTotals.length; i++ )
            {
                result += Number( subTotals[ i ]  );
            }

            $("#total").html( result );
        }
        function get_form()
        {
            var html = '';
            html     +=  '<tr>' ;
            html     +=     '<td style="width:20%">' ;
            html     +=          $("#formProduct").html( ) ;
            html     +=     '</td>' ;
            html     +=     '<td class="price">' ;
            html     +=          ''+products[ $("#formProduct").find( 'select[name="product[]"]' ).val() ] + ' / ' +  units[ $("#formProduct").find( 'select[name="product[]"]' ).val() ] ;
            html     +=     '</td>' ;
            html     +=     '<td>' ;
            html     +=          '<input  type="text" class="form-control" min="0"  name="quantity[]" value="0"  />' ;
            html     +=     '</td>' ;
            html     +=     '<td class="sub_total">' ;
            html     +=          '0' ;
            html     +=     '</td>' ;
            
            html     +=     '<td>' ;
            html     +=          '<button id="subtract"  class="hapus btn btn-danger" >Hapus</button>' ;
            html     +=     '</td>' ;
            html     +=  '</tr>' ;
            return html;
        }
    });
</script>
@endsection
