<?php $this->load->view("partial/header"); ?>

<?= form_open('lotes/save/' . $lote_info->lote_id, array('id' => 'lote_form', 'class' => 'form-horizontal')); ?>
<input type="hidden" id="lote_id" value="<?= $lote_id ?>" />
<input type="hidden" id="linker" value="<?= random_string('alnum', 16); ?>" />

<div class="row">
    <div class="col-lg-12">
        <div class="inqbox float-e-margins">
            <div class="inqbox-content">
                <h2><?php echo $this->lang->line('common_list_of') . ' ' . $this->lang->line('module_' . $controller_name); ?></h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="<?= site_url(); ?>">Home</a>
                    </li>
                    <li>
                        <a href="<?= site_url("lotes"); ?>"><?= ucwords($this->lang->line('module_' . $controller_name)); ?></a>
                    </li>
                    <li class="active">
                        <strong>Add</strong>
                    </li>
                </ol>
            </div>
        </div>
    </div>    
</div>


<div class="row">
    <div class="col-lg-12">
        <div class="inqbox float-e-margins">
            <div class="inqbox-title">
                <h5>
                    <?php echo $this->lang->line("lotes_basic_information"); ?>
                </h5>
                <div class="inqbox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                    <a class="close-link">
                        <i class="fa fa-times"></i>
                    </a>
                </div>
            </div>
            <div class="inqbox-content">
                <div class="tabs-container">

                    <ul class="nav nav-tabs tab-border-top-danger">
                        <li class="active"><a data-toggle="tab" href="#sectionA"><?= $this->lang->line("lotes_personal_information"); ?></a></li>
                        
                    </ul>
                    <div class="tab-content">
                        <div id="sectionA" class="tab-pane fade in active">

                            <div style="text-align: center">
                                <div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
                                <ul id="error_message_box"></ul>
                            </div>
                            <?php $this->load->view("people/form_basic_info2"); ?>

                            <div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('lotes_estado') . ':', 'estado'); ?></label>
                                <div class="col-sm-10">
                                    <?php
                                    echo form_input(
                                            array(
                                                'name' => 'estado',
                                                'id' => 'estado',
                                                'value' => $lote_info->estado,
                                                'class' => 'form-control'
                                            )
                                    );
                                    ?>
                                </div>
                            </div>
                            
                            <div class="hr-line-dashed"></div>



                        </div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="form-group">
        <div class="col-sm-4 col-sm-offset-2">
            <button type="button" class="btn btn-default" data-dismiss="modal" id="btn-close"><?= $this->lang->line("common_close"); ?></button>
            <?php if ((int) $lote_id > -1) : ?>
                <button type="button" class="btn btn-primary" id="btn-edit"><?= $this->lang->line("common_edit"); ?></button>    
            <?php endif; ?>

            <?php
            $display = '';
            if ($lote_id > -1)
            {
                $display = 'display: none';
            }
            echo form_submit(
                    array(
                        'name' => 'submit',
                        'id' => 'btn-save',
                        'value' => $this->lang->line('common_save'),
                        'class' => 'btn btn-primary',
                        'style' => $display
                    )
            );
            ?>
        </div>
    </div>
</div>


<?= form_close(); ?>


<?php $this->load->view("partial/footer"); ?>



<script type="text/javascript">
    $(document).ready(function () {

     

        if ($("#lote_id").val() > -1)
        {
            $("#lote_form input, textarea").prop("disabled", true);
            $("#lote_form input[type='hidden']").prop("disabled", false);

            $("#btn-edit").click(function () {
                $("#btn-save").show();
                $(this).hide();
                $("#lote_form input, textarea").prop("disabled", false);
            });
        }

    
        
           
               

          


      

      

     
         
      
        var settings = {
            submitHandler: function (form) {
                var desarrollo = $('#desarrollo').val();
                var sm = $('#sm').val();
                var lote = $('#lote').val();
                var superficie = $('#superficie').val();
                var comentarios = $('#comentarios').val();
                var estado = $('#estado').val();

                var mensaje = 'CONFIRMAR DATOS DEL LOTE .\n\n';
                mensaje+= '     Desarrollo: ' + desarrollo + '\n';
                mensaje+= '     SM: ' + sm + '\n';
                mensaje+= '     Lote: ' + lote + '\n';
                mensaje+= '     Superficie: ' + superficie + '\n';
                mensaje+= '     Comentarios: ' + comentarios + '\n';
                mensaje+= '     Estado: ' + estado + '\n';
                var r = window.confirm(mensaje);
                if(r == true){

                }else{
                    return false;
                }
                
                
               
                $("#submit").prop("disabled", true);
                $(form).ajaxSubmit({
                    success: function (response) {
                        post_person_form_submit(response);
                        $("#submit").prop("disabled", false);
                    },
                    dataType: 'json',
                    type: 'post'
                });

            },
            rules: {
                desarrollo: "required",
                sm: "required",
                lote: "required"
               
                
            },
            messages: {
                desarrollo: "<?php echo $this->lang->line('common_desarrollo_required'); ?>",
                sm: "<?php echo $this->lang->line('common_sm_required'); ?>",
                lote: "<?php echo $this->lang->line('common_lote_required'); ?>"
                
            }
        };

        $('#lote_form').validate(settings);

        function post_person_form_submit(response)
        {
           

            if (!response.success)
            {
                set_feedback(response.message, 'error_message', true);
            }
            else
            {
                set_feedback(response.message, 'success_message', false);
            }
            
            $("#lote_form").attr("action", "<?= site_url(); ?>lotes/save/" + response.person_id);
        }
    });
</script>