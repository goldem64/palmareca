<script src="http://momentjs.com/downloads/moment.js"></script>


<div style="text-align: center">
    <h3><?= $this->lang->line('loan_type_payment_sched'); ?></h3>
    <div id="required_fields_message"><?php echo $this->lang->line('common_fields_required_message'); ?></div>
    <ul id="error_message_box"></ul>
</div>

<div class="form-group">
    <label class="col-sm-2 control-label">
   Cantidad:
    </label>
    <div class="col-sm-2">
        <input type="hidden" id="amount" name="amount" value="<?=$loan_info->loan_amount;?>" />
        <?php
        echo form_input(
                array(
                    'name' => 'amount1',
                    'id' => 'amount1',
                  //  'value' => $loan_info->loan_amount,
                  'value' => $loan_info->loan_amount,
                    'class' => 'form-control',
                    'type' => 'number',
                    'step' => 'any',
                )
        );
        ?>
    </div>
</div>


<div class="hr-line-dashed"></div>
<!-- <div class="form-group">
    <label class="col-sm-2 control-label">
       Interes:
    </label>
    <div class='col-sm-2'>
        <div class="input-group">
            <input type="hidden" class="form-control" name="interest_rate" id="interest_rate" value="<?= $c_payment_scheds["interest_rate"] ?>" />
           <span class="input-group-addon">%</span>
        </div>
    </div>
</div> -->
<input type="hidden" class="form-control" name="interest_rate" id="interest_rate" value="<?= $c_payment_scheds["interest_rate"] ?>" />

<div class="hr-line-dashed"></div>

<div class="form-group">
    <label class="col-sm-2 control-label">
        <?= $this->lang->line('loan_type_term'); ?>:
    </label>
    <div class="col-sm-2">
        <input type="text" name="term" id="term" class="form-control" value="<?= $c_payment_scheds["term"]; ?>" />
    </div>
    <div class="col-sm-2">
        <select class="form-control" name="term_period" id="term_period">
            
            <option value="month" <?= $c_payment_scheds["term_period"] === "monthly" ? 'selected="selected"' : ''; ?>><?= $this->lang->line('common_month'); ?></option>
            
        </select>
    </div>
</div>

       <div class="form-group row">
       <div class="col-sm-2 control-label">
        <div class="form-check">
        <label class="form-check-label"><input class="form-check-input" type="checkbox" name="segmentadas" id="segmentadas" class="form-control"  onChange="dividir(this);"/>Dividir</label>

        </div>
        <div class="col-sm-2">
        <input type="hidden" id="flagDividir" value ="0" />
        </div>
       </div>
       </div>

       <div class="form-group">
       <label class="col-sm-2 control-label">
       #1
    </label>
       <div class="col-sm-2">
        <input type="text" name="cuotas1" id="cuotas1" class="form-control" style="display:none" />
    </div>
    <div class="col-sm-2">
    <input type="text" name="cantidad1" id="cantidad1" class="form-control" style="display:none" />
    </div>

       </div>

       <div class="form-group">
       <label class="col-sm-2 control-label">
       #2
    </label>
       <div class="col-sm-2">
        <input type="text" name="cuotas2" id="cuotas2" class="form-control" style="display:none" />
    </div>
    <div class="col-sm-2">
    <input type="text" name="cantidad2" id="cantidad2" class="form-control" style="display:none" />
    </div>
    

       </div>

       <div class="form-group">
       <label class="col-sm-2 control-label">
       #3
    </label>
       <div class="col-sm-2">
        <input type="text" name="cuotas3" id="cuotas3" class="form-control" style="display:none" />
    </div>
    <div class="col-sm-2">
    <input type="text" name="cantidad3" id="cantidad3" class="form-control" style="display:none" />
    </div>

       </div>
        

      

<div class="hr-line-dashed"></div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        Primer pago:
    </label>
    <div class='col-sm-2'>
        <div class="input-group date">
            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>                                        
            <input type="text" class="form-control" name="start_date" id="start_date" value="" />
        </div>
    </div>
</div>


<div class="hr-line-dashed"></div>
<div class="form-group">
    <label class="col-sm-2 control-label">
        Balance:
    </label>
    <div class="col-sm-2">
        <div id="loan-total-amount">0.00</div>
    </div>
</div>
<div class="hr-line-dashed"></div>


<div class="form-group">
    <label class="col-sm-2 control-label">
        &nbsp;
    </label>
    <div class="col-sm-4">
        <button class="btn btn-primary" type="button" id="btn-loan-calculator">Generar</button>
    </div>
</div>
<div class="hr-line-dashed"></div>

<div class="form-group">
    <label class="col-sm-2 control-label"> &nbsp; </label>
    <div class="col-sm-10">
        <div id="div-payment-scheds">
            
            <?php if (count($c_payment_scheds["payment_breakdown"]["balance"]) > 0): ?>
                <table class="table table-bordered">
                    <tr>
                        <td style="width:15px">#</td>
                        <td style="text-align:center">Fecha</td>
                        <td style="text-align:center">Mensualidad</td>
                        <!-- <td style="text-align:center">Principal Amount</td>
                        <td style="text-align:center">Interest Amount</td> -->
                        <td style="text-align:center">Balance</td>
                    </tr>
                    <?php for ($i = 0; $i < count($c_payment_scheds["payment_breakdown"]["balance"]); $i++): ?>
                        <tr>
                            <td><?=$i+1?></td>
                            <td><input type="hidden" name="payment_date[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["schedule"][$i]; ?>" /><?= $c_payment_scheds["payment_breakdown"]["schedule"][$i]; ?></td>
                            <td><input type="hidden" name="payment_amount[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["amount"][$i]; ?>"/><?= $c_payment_scheds["payment_breakdown"]["amount"][$i]; ?></td>
                            <!-- <td><?= $c_payment_scheds["payment_breakdown"]["amount"][$i] - $c_payment_scheds["payment_breakdown"]["interest"][$i]; ?></td>
                            <td><input type="hidden" name="payment_interest[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["interest"][$i]; ?>"/><?= $c_payment_scheds["payment_breakdown"]["interest"][$i]; ?></td> -->
                            <td><input type="hidden" name="payment_balance[]" class="form-control" value="<?= $c_payment_scheds["payment_breakdown"]["balance"][$i]; ?>"/><?= $c_payment_scheds["payment_breakdown"]["balance"][$i]; ?></td>
                        </tr>
                    <?php endfor; ?>
                </table>
            <?php endif; ?>
            
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        $("#btn-loan-calculator").click(function(){
            
            if ( $("#start_date").val() == '' )
            {
                alertify.alert("Ingresar fecha de primer pago");
                return false;
            }
           
            var loan_amount = $("#amount1").val(); // prestamo
            var dividir = $("#flagDividir").val();
            var cuotas1 = $("#cuotas1").val();
            var cuotas2 = $("#cuotas2").val();
            var cuotas3 = $("#cuotas3").val();
            var cantidad1 = $("#cantidad1").val();
            var cantidad2 = $("#cantidad2").val();
            var cantidad3 = $("#cantidad3").val();

            if (cantidad3 == ""){
                cantidad3 = 0;
                cuotas3 = 0;
            }
            
            
            if( dividir == 1){
                var sumatotal = (parseInt(cantidad1)* parseInt(cuotas1)) + (parseInt(cantidad2) * parseInt(cuotas2)) + (parseInt(cantidad3) * parseInt(cuotas3));
               //window.alert("sumatotal = " + sumatotal+ " loan_amount " + loan_amount + " cantidad3 " + cantidad3);
                if ( sumatotal != loan_amount){
                alertify.alert("Error en cuotas o cantidades");
                return false;
                    }
            }

            
            

            var frequency = 1;
            var term = $("#term").val();
            var period = $("#term_period").val();     
            
            

            

            

            //window.alert(cuotas1 + " " + cantidad1 + " " + cuotas2 + " " + cantidad2 + " " + cuotas3 + " " + cantidad3);
            
            switch(period)
            {
                case "day":
                    frequency = 365;
                    break;
                case "week":
                    frequency = 52;
                    break;
                case "month":
                    frequency = 12;
                    break;
                case "year":
                    frequency = 1;
                    break;
            }
            
            
            var interest_rate = ($("#interest_rate").val() / 100) / frequency;
            
            var payment_amount = 0;
            
            var r = (1 + interest_rate) ;
            var pow = Math.pow(r, term);
            
            // anterior payment_amount = loan_amount * ( (interest_rate * pow)  / (pow - 1) );
            if ( dividir == 1){
               term = parseInt(cuotas1) + parseInt(cuotas2) + parseInt(cuotas3);
               payment_amount = parseInt(cantidad1);
               //window.alert(payment_amount);
            }else{
                payment_amount = loan_amount / term;
            }
                //payment_amount = loan_amount / term;
                //window.alert(term);
            
            
           
           

            //$("#loan-total-amount").html( addCommas( payment_amount.toFixed(2) ) );
            $("#loan-total-amount").html( addCommas(  payment_amount.toFixed(2) ) );
            //window.alert("AAAAAAA");
            var table_scheds = '<table class="table table-bordered">';
            
            table_scheds += '<tr>';
            //table_scheds += '<td style="text-align:center">#</td>';
            table_scheds += '<td style="text-align:center">Fecha</td>';
            table_scheds += '<td style="text-align:center">Mensualidad</td>';
            // table_scheds += '<td style="text-align:center">Principal Amount</td>';
            // table_scheds += '<td style="text-align:center">Interest Amount</td>';
            table_scheds += '<td style="text-align:center">Balance</td>';
            table_scheds += '</tr>';
            
            var total_amount = 0;
           
            var bandera_febrero = 0;
           
            for (var i=0; i < term; i++)
            {
               
                if(i == parseInt(cuotas1) && dividir == 1){
                    payment_amount = parseInt(cantidad2);
                    //window.alert(payment_amount);
                }
                if(i == (parseInt(cuotas1) + parseInt(cuotas2))  && dividir == 1){
                    payment_amount =parseInt(cantidad3);
                    //window.alert(payment_amount);
                }
                var compound_interest = (loan_amount * interest_rate);
                var principal_amount = (payment_amount - compound_interest).toFixed(2);
                //var balance_owed = (loan_amount - principal_amount).toFixed(2);
                var balance_owed = (loan_amount - payment_amount ).toFixed(2);
                total_amount += payment_amount;
                
                payment_date = new Date( reverseDate($("#start_date").val()) );
                fechai = new Date( reverseDate($("#start_date").val()));
                
               
                //window.alert("Periodo: " + $("#term_period").val());
                switch( $("#term_period").val() )
                {
                    case "day":
                        payment_date.setDate( payment_date.getDate() + (i+1) );
                        break;
                    case "week":
                        payment_date.setDate( payment_date.getDate() + ((i+1)*7) );
                        break;
                    case "month":

                      
                        fechai.setMonth(fechai.getMonth() + (i-1));
                        if(fechai.getMonth() === 0){
                            if(fechai.getDate() === 30){
                                
                                payment_date.setDate(28);

                            }
                           
                               
                        }

                        
                    
                       
                            payment_date.setMonth( payment_date.getMonth() + i );
                          
                       
                        
                        break;
                    case "year":
                        payment_date = new Date ( payment_date.getFullYear() + (i+1), payment_date.getMonth(), payment_date.getDate() );
                        break;
                        
                }
                
                
                   
                         var d_date = agregarCero(payment_date.getDate()) + "/" + agregarCero((payment_date.getMonth() + 1)) + "/" + payment_date.getFullYear();
                      
                
                
                
                var inputs = '<input type="hidden" name="payment_date[]" value="'+ d_date +'" />\n\
                           <input type="hidden" name="payment_balance[]" value="'+ balance_owed +'" />\n\
                           <input type="hidden" name="payment_interest[]" value="'+ compound_interest.toFixed(2) +'" />\n\
                           <input type="hidden" name="payment_amount[]" value="'+ payment_amount.toFixed(2) +'" />\n\
                            ';
                
                var pago_mensual = loan_amount / term;
                table_scheds += '<tr>';
                //table_scheds += '<td>' + ($i+1) + '</td>';
                table_scheds += '<td>' + inputs +  d_date + '</td>';
                table_scheds += '<td>' + addCommas(payment_amount.toFixed(2)) + '</td>';
                
                // table_scheds += '<td>' + addCommas(principal_amount) + '</td>';
                // table_scheds += '<td>' + addCommas(compound_interest.toFixed(2)) + '</td>';
                if (balance_owed < 0){
                    table_scheds += '<td>0.00</td>';
                }else{
                    table_scheds += '<td>' + addCommas(balance_owed) + '</td>';
                }
              
                table_scheds += '</tr>';
                
                loan_amount = balance_owed;
            }
            table_scheds += '</table>';
            
            $("#amount").val(total_amount);
            $("#sp-current-balance").html( addCommas(total_amount.toFixed(2)) );
            $("#current_balance").val( total_amount.toFixed(2) );
            
            $("#div-payment-scheds").html( table_scheds );
            
        });
    });
    
    function addCommas(nStr)
    {
        nStr += '';
        x = nStr.split('.');
        x1 = x[0];
        x2 = x.length > 1 ? '.' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + ',' + '$2');
        }
        return x1 + x2;
    }

    function reverseDate(str) {
    var newString = "";
         newString = str.substring(6,10) + "/" + str.substring(3,5) + "/" + str.substring(0,2);
    return newString;
}

   function agregarCero(str){
              
       if (str.toString().length == 1){
         str = "0" + str;

       }
       return str;
   }

    function dividir(obj){
        if(obj.checked){
           
            document.getElementById('cuotas1').style.display = "";
            document.getElementById('cuotas2').style.display = "";
            document.getElementById('cuotas3').style.display = "";
            document.getElementById('cantidad1').style.display = "";
            document.getElementById('cantidad2').style.display = "";
            document.getElementById('cantidad3').style.display = "";
            document.getElementById('flagDividir').value = "1";

        }else{
            document.getElementById('cuotas1').style.display = "none";
            document.getElementById('cuotas2').style.display = "none";
            document.getElementById('cuotas3').style.display = "none";
            document.getElementById('cantidad1').style.display = "none";
            document.getElementById('cantidad2').style.display = "none";
            document.getElementById('cantidad3').style.display = "none";
            document.getElementById('flagDividir').value = "0";
        }
    }
</script>