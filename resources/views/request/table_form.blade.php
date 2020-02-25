

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
                        <td> <?= $row->code ?> </td>
                        <td> <?= $row->customer->user->name ?> </td>
                        <td> <?= $row->customer->user->address ?> </td>
                        <td>
                            <a href="" data-toggle="modal" data-target="#image<?php echo  $row->id ; ?>">
                                <img class=" img-fluid" src="<?php echo $imageUrl.$row->photo  ?>" alt="" height="auto" width="100">
                            </a>
                            <div class="modal fade" id="image<?php echo  $row->id ; ?>" role="dialog">
                                <div class="modal-dialog modal-xl " style="overflow: hidden">
                                    <img class=" img-fluid" src="<?php echo $imageUrl.$row->photo  ?>" alt="" height="auto" width="1500">
                                </div>
                            </div>
                        </td>
                        <td> <?= $row->latitude.','.$row->longitude ?> </td>
                        <td> <?= $row->info ?> </td>
                        <td> <?= $row->created_at ?> </td>

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
