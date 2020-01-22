
@if ($errors->any())
    <div class="alert alert-danger">
            @foreach ($errors->all() as $error)
                {{ $error }}
                <br>
            @endforeach
    </div>
@endif
<form action="{{route('pickups.store')}}" method="POST"  >
    @csrf
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover  ">
            <thead>
                <tr>
                    <th style="width:50px">No</th>
                    <?php foreach ( $header as $key => $value) : ?>
                        <th><?php echo $value ?></th>
                    <?php endforeach; ?>
                    <th><?php echo "Checklist" ?></th>
                </tr>
            </thead>
            <tbody>
                <?php
                $no = (isset($number) && ($number != NULL))  ? $number : 1;
                foreach ($rows as $ind => $row) :
                    ?>
                
                    <tr>
                        <td> <?php echo $no++ ?> </td>
                        <?php foreach ($header as $key => $value) : ?>
                            <td>
                            <?php
                                    $attr = "";
                                    if (is_numeric($row->$key) && ($key != 'phone' && $key != 'username'))
                                        $attr = number_format($row->$key);
                                    else
                                        $attr = $row->$key;
                                    
                                    if( strpos( $key , '->' ) )
                                    {
                                        $output = $row;
                                        $keys = explode('->', $key );
                                        $isValid = true;
                                        foreach( $keys as $key )
                                        {
                                            if( strpos( $key , '()' ) )
                                            {
                                                if( $output->{$key}() == NULL ) 
                                                {
                                                    $isValid = false;
                                                    break;
                                                }
                                                $output = $output->{$key}();
                                            }
                                            else
                                            {
                                                if( $output->{$key} == NULL ) 
                                                {
                                                    $isValid = false;
                                                    break;
                                                }
                                                $output = $output->{$key};
                                            }
                                        }
                                        if( !$isValid ) continue;

                                        $attr = $output;
                                    }
                                    echo $attr; 
                            ?>
                            </td>
                        <?php endforeach; ?>
                        <td>
                            <div class="custom-control custom-checkbox">
                                <input class="custom-control-input" type="checkbox" name="request_id[]" id="customCheckbox<?= $ind?>" value="<?= $row->id ?>">
                                <label for="customCheckbox<?= $ind?>" class="custom-control-label"></label>
                            </div>  
                        </td>
                    </tr>
                <?php
                endforeach;
                ?>
            </tbody>
        </table>
    </div>
    <!-- table -->
    <?= $driverSelect ?>
    <br>
    <button class="btn btn-bold btn-success btn-sm float-right " style="margin-left: 5px;" type="submit">
        Simpan
    </button>
</form>