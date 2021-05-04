<div class="form-group">
    <label class="col-sm-2 control-label">
        <?php echo form_label($this->lang->line('common_photo') . ':', 'photo_url'); ?>
    </label>
    <div class="col-sm-10">
        <?php if( trim(trim($person_info->photo_url) !== "") && file_exists( FCPATH  . "/uploads/profile-" . $person_info->person_id . "/" . $person_info->photo_url ) ): ?>
        <img id="img-pic" src="<?= base_url("uploads/profile-" . $person_info->person_id . "/" . $person_info->photo_url); ?>" style="height:99px" />
        <?php else: ?>
        <img id="img-pic" src="http://via.placeholder.com/80x80" style="height:99px" />
        <?php endif; ?>
        <div id="filelist"></div>
        <div id="progress" class="overlay"></div>

        <div class="progress progress-task" style="height: 4px; width: 15%; margin-bottom: 2px; display: none">
            <div style="width: 0%;" aria-valuemax="100" aria-valuemin="0" aria-valuenow="50" role="progressbar" class="progress-bar progress-bar-info">

            </div>                                    
        </div>

        <div id="container">
            <a id="pickfiles" href="javascript:;" class="btn btn-default" data-person-id="<?= $person_info->person_id; ?>"><?= $this->lang->line("common_browse"); ?></a> 
        </div>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_first_name') . ':', 'first_name', array('class' => 'required')); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'first_name',
                    'id' => 'first_name',
                    'value' => $person_info->first_name,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>


<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_last_name') . ':', 'last_name', array('class' => 'required')); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'last_name',
                    'id' => 'last_name',
                    'value' => $person_info->last_name,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_conyuge_name') . ':', 'conyuge_name'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'conyuge_name',
                    'id' => 'conyuge_name',
                    'value' => $person_info->conyuge_name,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_address_1') . ':', 'address_1'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'address_1',
                    'id' => 'address_1',
                    'value' => $person_info->address_1,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_address_2') . ':', 'address_2'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'address_2',
                    'id' => 'address_2',
                    'value' => $person_info->address_2,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>


<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_phone_number') . ':', 'phone_number'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'phone_number',
                    'id' => 'phone_number',
                    'value' => $person_info->phone_number,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_celular') . ':', 'phone_celular'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'celular',
                    'id' => 'celular',
                    'value' => $person_info->celular,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_oficina') . ':', 'phone_oficina'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'oficina',
                    'id' => 'oficina',
                    'value' => $person_info->oficina,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>


<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_email') . ':', 'email'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'email',
                    'id' => 'email',
                    'value' => $person_info->email,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>


<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_lugar_nacimiento') . ':', 'lugar_nacimiento'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'lugar_nacimiento',
                    'id' => 'lugar_nacimiento',
                    'value' => $person_info->lugar_nacimiento,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_fecha_nacimiento') . ':', 'fecha_nacimiento'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'fecha_nacimiento',
                    'id' => 'fecha_nacimiento',
                    'value' => $person_info->fecha_nacimiento,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_lugar_trabajo') . ':', 'lugar_trabajo'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'lugar_trabajo',
                    'id' => 'lugar_trabajo',
                    'value' => $person_info->lugar_trabajo,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_puesto') . ':', 'puesto'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'puesto',
                    'id' => 'puesto',
                    'value' => $person_info->puesto,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_facebook') . ':', 'facebook'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'facebook',
                    'id' => 'facebook',
                    'value' => $person_info->facebook,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-solid"></div>
<!-- referencia 1 -->
<div class="form-group"><label style="font-size:1.5em" class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_referencia1') . ':', 'referencia1'); ?></label> </div>
   
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refnombre1') . ':', 'refnombre1'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refnombre1',
                    'id' => 'refnombre1',
                    'value' => $person_info->refnombre1,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refdireccion1') . ':', 'refdireccion1'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refdireccion1',
                    'id' => 'refdireccion1',
                    'value' => $person_info->refdireccion1,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_reftel1') . ':', 'reftel1'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'reftel1',
                    'id' => 'reftel1',
                    'value' => $person_info->reftel1,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refparentesco1') . ':', 'refparentesco1'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refparentesco1',
                    'id' => 'refparentesco1',
                    'value' => $person_info->refparentesco1,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<!-- referencia 2 -->
<div class="form-group"><label style="font-size:1.5em" class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_referencia2') . ':', 'referencia2'); ?></label> </div>
   
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refnombre2') . ':', 'refnombre2'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refnombre2',
                    'id' => 'refnombre2',
                    'value' => $person_info->refnombre2,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refdireccion2') . ':', 'refdireccion2'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refdireccion2',
                    'id' => 'refdireccion2',
                    'value' => $person_info->refdireccion2,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_reftel2') . ':', 'reftel2'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'reftel2',
                    'id' => 'reftel2',
                    'value' => $person_info->reftel2,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refparentesco2') . ':', 'refparentesco2'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refparentesco2',
                    'id' => 'refparentesco2',
                    'value' => $person_info->refparentesco2,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<!-- referencia 3 -->
<div class="form-group"><label style="font-size:1.5em" class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_referencia3') . ':', 'referencia3'); ?></label> </div>
   
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refnombre3') . ':', 'refnombre3'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refnombre3',
                    'id' => 'refnombre3',
                    'value' => $person_info->refnombre3,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refdireccion3') . ':', 'refdireccion3'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refdireccion3',
                    'id' => 'refdireccion3',
                    'value' => $person_info->refdireccion3,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_reftel3') . ':', 'reftel3'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'reftel3',
                    'id' => 'reftel3',
                    'value' => $person_info->reftel3,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_refparentesco3') . ':', 'refparentesco3'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_input(
                array(
                    'name' => 'refparentesco3',
                    'id' => 'refparentesco3',
                    'value' => $person_info->refparentesco1,
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>
<div class="hr-line-solid"></div>




<div class="form-group"><label class="col-sm-2 control-label"><?php echo form_label($this->lang->line('common_comments') . ':', 'comments'); ?></label>
    <div class="col-sm-10">
        <?php
        echo form_textarea(
                array(
                    'name' => 'comments',
                    'id' => 'comments',
                    'value' => $person_info->comments,
                    'rows' => '5',
                    'cols' => '17',
                    'class' => 'form-control'
                )
        );
        ?>
    </div>
</div>





