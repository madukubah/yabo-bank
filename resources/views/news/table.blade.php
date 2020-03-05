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
            $no = (isset($number) && ($number != NULL))  ? $number : 1;
            foreach ($rows as $ind => $row) :
                ?>
                <tr>
                    <td> <?php echo $no++ ?> </td>
                    <td> <?= $row->title ?> </td>
                    <td>
                        <a href="" data-toggle="modal" data-target="#image<?php echo  $row->id ; ?>">
                            <img class=" img-fluid" src="<?php echo $imageUrl.$row->image  ?>" alt="" height="auto" width="100">
                        </a>
                        <div class="modal fade" id="image<?php echo  $row->id ; ?>" role="dialog">
                            <div class="modal-dialog modal-xl " style="overflow: hidden">
                                <img class=" img-fluid" src="<?php echo $imageUrl.$row->image  ?>" alt="" height="auto" width="1500">
                            </div>
                        </div>
                    </td>
                    <td> <?= $row->preview ?> </td>
                    <?php if( isset( $action ) ):?>
                        <td>
                            <!--  -->
                            <!-- <div class="btn-group"> -->
                                <!-- <ul class="nav navbar-nav"> -->
                                    <?php 
                                        foreach ( $action as $type => $value) :
                                    ?>
                                        <!-- <li> -->
                                            <?php 
                                                    switch( $type )
                                                    {
                                                        case "link" :
                                                                $value["data"] = $row;
                                                                echo view('layouts.templates.tables.actions.link', $value);
                                                            break;
                                                        case "modal_delete" :
                                                                $value["modalId"] = $value["modalId"].$row->{ $value["dataParam"] };
                                                                $value["formUrl"] = $value["formUrl"]."/".$row->{ $value["dataParam"] };
                                                                $dialog = "
                                                                    <div class='alert alert-danger alert-dismissible'>
                                                                    <h5>".
                                                                        ( $message = ( isset( $value["message"] ) ) ? $value["message"] : "yakin ?" ) 
                                                                    ."</h5></div>
                                                                    ";
                                                                $value["modalBody"] = $dialog.view('layouts.templates.forms.form_fields', [ "formFields" => $value["formFields"], "data" => $row ] );
                                                            
                                                                echo view('layouts.templates.modals.modal', $value);
                                                            break;
                                                        case "modal_form" :
                                                                $value["modalId"] = $value["modalId"].$row->{ $value["dataParam"] };
                                                                $additional_dialog = ( isset( $value["additional_dialog"] ) ) ? $value["additional_dialog"] : ""  ;
                                                                if( isset( $value["isCreateMode"] ) )
                                                                    $value["formUrl"] = $value["formUrl"];
                                                                else
                                                                    $value["formUrl"] = $value["formUrl"]."/".$row->{ $value["dataParam"] };

                                                                $value["modalBody"] = $additional_dialog.view('layouts.templates.forms.form_fields', [ "formFields" => $value["formFields"], "data" => $row ] );
                                                               
                                                                echo view('layouts.templates.modals.modal', $value);
                                                            break;
                                                        case "modal_form_multipart" :
                                                                $value["data"] = $row;
                                                                $this->load->view('templates/actions/modal_form_multipart', $value ); 
                                                            break;
                                                    }
                                            ?>
                                        <!-- </li> -->
                                    <?php 
                                        endforeach;
                                    ?>
                                <!-- </ul> -->
                            <!-- </div> -->
                            <!--  -->
                        </td>
                    <?php endif;?>
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