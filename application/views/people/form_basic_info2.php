<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_desarrollo') . ':', 'desarrollo', array('class' => 'required')); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'desarrollo',
                    'id' => 'desarrollo',
                    'value' => $lote_info->desarrollo,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_sm') . ':', 'sm', array('class' => 'required')); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'sm',
                    'id' => 'sm',
                    'value' => $lote_info->sm,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>


<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_lote') . ':', 'lote', array('class' => 'required')); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'lote',
                    'id' => 'lote',
                    'value' => $lote_info->lote,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_superficie') . ':', 'superficie', array('class' => 'required')); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'superficie',
                    'id' => 'superficie',
                    'value' => $lote_info->superficie,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>



<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_comentarios') . ':', 'comentarios'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_textarea(
                array(
                    'name' => 'comentarios',
                    'id' => 'comentarios',
                    'value' => $lote_info->comentarios,
                    'rows' => '5',
                    'cols' => '17',
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>





