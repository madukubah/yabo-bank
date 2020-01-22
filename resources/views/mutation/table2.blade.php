<div class="table-responsive">
    <table class="table table-striped table-bordered table-hover  ">
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
            $_position = [ 1 => 'Kredit', 2 => 'Debit' ];
            $no = (isset($number) && ($number != NULL))  ? $number : 1;
            $balance = 0;
            foreach ($rows as $ind => $row) :
                ?>
                <tr>
                    <td> <?php echo $no++ ?> </td>
                    <td>
                        <?= ( $row->created_at )?>
                    </td>
                    <td>
                        <?= ( $row->description )?>
                    </td>
                    <td>
                        <?= number_format( $row->credit_total )?>
                    </td>
                    <td>
                        <?= number_format( $row->debit_total )?>
                    </td>
                    <td>
                        <?php 
                            $balance = $balance + $row->credit_total - $row->debit_total;
                            echo number_format( $balance ) ;
                        ?>
                    </td>
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