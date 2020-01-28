<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover  ">
        <thead>
            <tr>
                <th style="width:50px">No</th>
                <?php foreach ( $header as $key => $value) : ?>
                    <th><?php echo $value ?></th>
                <?php endforeach; ?>
                <?php if (isset($action)) : ?>
                    <th><?php echo "Aksi" ?></th>
                <?php endif; ?>
            </tr>
        </thead>
        <tbody>
            <?php
            $_position = [ 1 => 'Kredit', 2 => 'Debit' ];
            $no = (isset($number) && ($number != NULL))  ? $number : 1;
            foreach ($rows as $ind => $row) :
                ?>
               <tr>
                   <td> <?= $no++ ?> </td>
                   <td> <?= $row->created_at ?> </td>
                   <td> <?= $row->customer->user->name ?> </td>
                   <td> <?= $row->product.' ( Rp. '. number_format( $row->price ).'/'. $row->unit .') ' ?> </td>
                   <td> <?= $row->quantity ?> </td>
                   <td>Rp. <?= number_format( $row->quantity * $row->price )  ?> </td>
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