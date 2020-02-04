<div class="table-responsive">
    <table class="rg-table table-striped table-bordered table-hover  ">
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
            $no = (isset($number) && ($number != NULL))  ? $number : 1;
            foreach ($rows as $ind => $row) :
                ?>
               
                <tr>
                    <td> <?php echo $no++ ?> </td>
                    <td> <?php echo $row->code ?> </td>
                    <td> <?php echo $row->date ?> </td>
                    <td> Rp. <?php echo number_format( $billTotal ) ?> </td>
                    <td> Rp. <?php echo number_format( $row->amount ) ?> </td>
                    <td> Rp. <?php echo number_format( $billTotal = $billTotal - $row->amount ) ?> </td>
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