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
                <?php 
                    if( $row->customer_status == 0 ):
                ?>
                    <tr style="background-color: rgba(222, 82, 82, 0.4);  " >
                <?php 
                    else:
                ?>
                    <tr>
                <?php 
                    endif;
                ?>
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