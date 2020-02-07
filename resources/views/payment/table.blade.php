<div class="table-responsive">
    <table class="rg-table table-striped table-bordered table-hover  ">
        <thead>
            <tr>
                <th style="width:50px">No</th>
                <?php foreach ( $header as $key => $value) : ?>
                    <th><?php echo $value ?></th>
                <?php endforeach; ?>
            </tr>
        </thead>
        <tbody>
            <?php
            $no = (isset($number) && ($number != NULL))  ? $number : 1;
            foreach ($rows as $ind => $row) :
                $saleOrder = $row->salesOrder;
                $billTotal = ( $saleOrder->gross - $saleOrder->cut_off ) * $saleOrder->selling_price;

                $paymentTotal = $row->payments->sum('amount');
                $status = 'bersisa Rp. '.number_format( $billTotal - $paymentTotal ) ;
                if( $billTotal == $paymentTotal )
                    $status= 'Lunas';
                // $paymentTotal = Payment::sumByInvoiceId( $row->id );
                ?>
                <tr>
                        <td> <?php echo $no++ ?> </td>
                        <td> <a href="{{route('sellings.show', $row->salesOrder->id )}}"> <?php echo $row->salesOrder->code ?> </a>  </td>
                        <td> <a href="{{route('sellings.show', $row->salesOrder->id )}}"> <?php echo $row->code ?> </a> </td>
                        <td> Rp. <?php echo number_format( $billTotal ) ?> </td>
                        <td> Rp. <?php echo number_format( $paymentTotal ) ?> </td>
                        <td>  <?php echo $status ?> </td>
                </tr>
            <?php
            endforeach;
            ?>
        </tbody>
    </table>
</div>
<script>
    var width = window.innerWidth;
    var element = document.getElementsByClassName('table');
    element = element[0];
    if (width <= 600) {
        element.classList.add('rg-table');
    } else {
        element.classList.remove('rg-table');
    }
</script>