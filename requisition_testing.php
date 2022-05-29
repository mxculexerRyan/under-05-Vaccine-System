<style>
	body {
    font-family: 'Roboto', sans-serif!important;
	margin:0;
	padding:0;
	box-sizing: border-box;
}



.card1 {
	width: 60rem;
    margin: auto;
    background: white;
    position:center;
    align-self: center;
    top: 50rem;
    border-radius: 1.5rem;
    box-shadow: 4px 3px 20px #3535358c;
    display:flex;
    flex-direction: row;
    
}

.leftside {
	background: #030303;
	width: 25rem;
	display: inline-flex;
    align-items: center;
    justify-content: center;
	border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}



.rightside {
    background-color: #ffffff;
	width: 35rem;
	border-bottom-right-radius: 1.5rem;
    border-top-right-radius: 1.5rem;
    padding: 1rem 2rem 3rem 3rem;
}

p{
    display:block;
    font-size: 1.1rem;
    font-weight: 400;
    margin: .8rem 0;
}

.inputbox
{
    color:#030303;
	width: 100%;
    padding: 0.5rem;
    border: none;
    border-bottom: 1.5px solid #ccc;
    margin-bottom: 1rem;
    border-radius: 0.3rem;
    font-family: 'Roboto', sans-serif;
    color: #615a5a;
    font-size: 1.1rem;
    font-weight: 500;
  outline:none;
}

.expcvv {
    display:flex;
    justify-content: space-between;
    padding-top: 0.6rem;
}

.expcvv_text{
    padding-right: 1rem;
}
.expcvv_text2{
    padding:0 1rem;
}

.button{
    background: linear-gradient(
135deg
, #753370 0%, #298096 100%);
    padding: 15px;
    border: none;
    border-radius: 50px;
    color: white;
    font-weight: 400;
    font-size: 1.2rem;
    margin-top: 10px;
    width:100%;
    letter-spacing: .11rem;
    outline:none;
}

.button:hover
{
	transform: scale(1.05) translateY(-3px);
    box-shadow: 3px 3px 6px #38373785;
}

@media only screen and (max-width: 1000px) {
    .card{
        flex-direction: column;
        width: auto;
      
    }

    .leftside{
        width: 100%;
        border-top-right-radius: 0;
        border-bottom-left-radius: 0;
      border-top-right-radius:0;
      border-radius:0;
    }

    .rightside{
        width:auto;
        border-bottom-left-radius: 1.5rem;
        padding:0.5rem 3rem 3rem 2rem;
      border-radius:0;
    }
}	
</style>
<?php include 'db_connect.php';
include_once 'callAPI.php';
if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM receiving_list where id=".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$$k = $val;
	}
	$inv = $conn->query("SELECT * FROM inventory where type=1 and form_id=".$_GET['id']);

}

// if(isset($_POST['manage_requisition'])){
// 	$resp = callAPI('POST','http://localhost/monaco/v1/api/testing/create.php',http_build_query($_POST));
// 	echo $resp;
// }

if(isset($_POST['manage_requisition'])){
	// $response=callAPI('POST','http://localhost/monaco/v1/api/testing/create.php',http_build_query($_POST, '', '&amp;'));
	$response=callAPI('POST','http://localhost/monaco/v1/api/testing/create.php',json_encode($_POST));
	echo $response;
}
?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<h4>Manage Receiving</h4>
			</div>
			<div class="card-body">
				<form action="index.php?page=requisition_testing" method="POST" role="form" id="manage-requisition" name="manage_requisition">
					<div class="col-md-12">
						<div class="row">
							<div class="form-group col-md-5">
								<label class="control-label">Requesting Store</label>
								<select name="Requesting_store" id="" class="custom-select browser-default select2">
									<option value=""></option>
								<?php 

								$supplier = $conn->query("SELECT * FROM inv_store where name like 'main%' order by name  asc");
								while($row=$supplier->fetch_assoc()):
								?>
									<option value="<?php echo $row['store_id'] ?>"><?php echo $row['name'] ?></option>
								<?php endwhile; ?>
								</select>
							</div>
							<div class="form-group col-md-2">
								<label class="control-label">Custom Req No.</label>
								<span><input type="checkbox" name="NewSupplier" id="NewSupplier"></span>
							</div>
							<div class="form-group col-md-5" id="EnterNewSupplier">
								<label class="control-label">Request Number</label>
								<input  name="CustomReqNo" type="text" class="form-control text-left inputbox" step="any" id="SupplierName" >
							</div>
						</div>
						<hr>
						<div class="row mb-3" id="receiving_product">
								<div class="col-md-4">
									<label class="control-label">Item <sup style="color: red;">*</sup></label>
									<select name="" id="product" class="custom-select browser-default select2 inputbox">
										<option value=""></option>
									<?php
									$cat = $conn->query("SELECT * FROM item_units order by item_units_name asc");
									while($row=$cat->fetch_assoc()):
										$type_arr[$row['item_units_id']] = $row['item_units_name'];
									endwhile;  
									$cat = $conn->query("SELECT * FROM drug_group order by drug_group_name asc");
									while($row=$cat->fetch_assoc()):
										$cat_arr[$row['drug_group_id']] = $row['drug_group_name'];
									endwhile;
									$product = $conn->query("SELECT * FROM product_list  order by name asc");
									while($row=$product->fetch_assoc()):
										$prod[$row['id']] = $row;
									?>
									<option value="<?php echo $row['id'] ?>" data-name="<?php echo $row['name'] ?>" data-measurement="<?php echo $row['measurement'] ?>" data-description="<?php echo $row['description'] ?>" data-item_units_id="<?php echo $row['item_units_id']; ?>"><?php echo $row['name'] . ' | ' . $type_arr[$row['item_units_id']] .' | '.$row['measurement'] .' | '.$row['description']?></option>
								<?php endwhile; ?>
									</select>
								</div>	
								<div class="form-group col-md-2">
									<label class="control-label">Item Units</label>
									<select name="units" id="units" class="form-control custom-select browser-default select2">
										<option></option>
									<?php 
									$cat = $conn->query("SELECT * FROM item_units order by item_units_name asc");
									while($row=$cat->fetch_assoc()):
										$type_arr[$row['item_units_id']] = $row['item_units_name'];
									?>
										<option value="<?php echo $row['item_units_id'] ?>" data-units_name="<?php echo $row['item_units_name']?>"><?php echo $row['item_units_name'] ?></option>
									<?php endwhile; ?>
									</select>
								</div>
								<div class="col-md-2">
									<label class="control-label">Qty <sup style="color: red;">*</sup></label>
									<input type="number" class="form-control text-right inputbox" step="any" id="qty" >
								</div>
								<div class="col-md-3">
									<label class="control-label">&nbsp</label>
									<button class="btn btn-block btn-sm btn-primary" type="button" id="add_list"><i class="fa fa-plus"></i> ADD ITEM</button>
								</div>


						</div>
						<div class="row">
							<table class="table table-bordered" id="list">
								<colgroup>
									<col width="35%">
									<col width="10%">
									<col width="13%">
									<col width="13%">
									<col width="13%">
									<col width="13%">
									<col width="3%">
								</colgroup>
								<thead>
									<!-- <tr>	
										<th class="text-center">Description Item</th>
										<th class="text-center">Units</th>
										<th class="text-center">Qty</th>
										<th class="text-center">Quantity Requested</th>
										<th class="text-center">Quantity Issued</th>
										<th class="text-center">Status</th>	
									</tr> -->
									<tr>
										<th rowspan="2">Description Item</th>
										<th rowspan="2">Units</th>
										<th colspan="2" class="text-center">Quantity</th>
										<th colspan="2" class="text-center">Ledger Folio</th>
										<th rowspan="2" class="text-center">Action</th>
									</tr>
									<tr>
										<th>Requested</th>
										<th>Issued</th>
										<th>Receiver</th>
										<th>Authorized</th>
									</tr>
								</thead>
								<tbody>
									
								</tbody>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-12">
								<input name="manage_requisition" type="submit" value="Process Request" class="btn btn-primary col-sm-3 btn-sm btn-block float-right .col-md-3">
								<!-- <button class="btn btn-primary col-sm-3 btn-sm btn-block float-right .col-md-3" type="submit">Process Request</button> -->
							</div>
						</div>
					</div>
				</form>
			</div>
			
		</div>
	</div>
</div>
<div id="tr_clone">
	<table>
	<tr class="item-row">
		
		<td>
			<!-- <input type="hidden" name="inv_id[]" value=""> -->
			<input type="hidden" name="product_id[]" value="">
			<p class="pname">Name: <b>product</b></p>
			<p class="pdesc"><small><i>Description: <b>Description</b></i></small></p>
		</td>
		<td>
			<p class="UnitsName"></p>
			<input type="hidden" min="1" step="any" name="units[]" value="" class="text-right">
		</td>
		<td>
			<input type="number" min="1" step="any" name="qty[]" value="" class="text-right">
		</td>		
		<td>
			
		</td>
		<td>
			
		</td>
		<td>
			
		</td>
		<td class="text-center">
			<buttob class="" onclick = "rem_list($(this))"><i class="fa fa-trash"></i></buttob>
		</td>
	</tr>
	</table>
</div>			
<style type="text/css">
	.select2-container .select2-selection--single{
    height:34px !important;
}
.select2-container--default .select2-selection--single{
	border-top-style: hidden;
  border-right-style: hidden;
  border-left-style: hidden;
         border:0px 0px 1px 0px solid #ccc !important; 
     	border-radius: 12px !important; 
}
	#tr_clone{
		display: none;
	}
	td{
		vertical-align: middle !important;
		justify-content: center;
	}
	td>input{
		margin:auto;
	}
	td p {
		margin: unset;
	}
	td input{
		height: calc(100%);
		width: calc(100%);
		border: unset;

	}
	td input:focus{
		border: unset;    
		outline-width: inherit;
	}
	input[type=number]::-webkit-inner-spin-button, 
	input[type=number]::-webkit-outer-spin-button { 
	  -webkit-appearance: none; 
	  margin: 0; 
	}
</style>
<script>
		$("#product").change(function(){
				var product = $(this).val();
                // var item_units_id=$(this).attr('data-name');
                // $('#units').val(item_units_id).trigger('change');
                // select_units();
                // console.log($(this).attr('data-name'));
				$.ajax({
					// url:'ajax.php?action=display_available_item_in_stock',
                    // method:'POST',
                    // data:{product:product},
					url:'ajax.php?action=chk_prod_availability_insurance',
					method:'POST',
					data:{id:product},
					// dataType:'JSON',
                    success:function(resp){
					// alert_toast('kuku'+resp+'')
					// alert_toast('resp')
					// console.log('hello'+JSON.parse(resp));
					resp = JSON.parse(resp);
					
					
					console.log(JSON.stringify(resp))
						$('#units').val(resp.item_units_id).trigger('change')
						// $('#receiving_product').find('#available').html(resp.available)
						$('[name="selling_price"]').val(resp.price)
						// $('#receiving_product').find('#nhif_price').html(formatNumber(resp.price_nhif))	
					}
				});

			});
	$(document).ready(function(){
		$('#EnterNewSupplier').hide()
        $('input[type="checkbox"]').click(function(){
            if($(this).prop("checked") == true){
                console.log("Checkbox is checked.");
				$('#EnterNewSupplier').show()
            }
            else if($(this).prop("checked") == false){
                console.log("Checkbox is unchecked.");
				$('#EnterNewSupplier').hide()
            }
        });
    });
	$('.select2').select2({
	 	placeholder:"Please select here",
	 	width:"100%"
	})
	function rem_list(_this){
		_this.closest('tr').remove()
		calculate_total()
	}
	$('#add_list').click(function(){
		var tr = $('#tr_clone tr.item-row').clone();
		var product = $('#product').val(),
			qty = $('#qty').val(),
			units=$('#units').val();
			if($('#list').find('tr[data-id="'+product+'"]').length > 0){
				alert_toast("Product already on the list",'danger')
				return false;
			}
			if(product == '' || qty == ''){
				alert_toast("Please complete the fields first",'danger')
				return false;
			}
		tr.attr('data-id',product)
		tr.find('.pname b').html($("#product option[value='"+product+"']").attr('data-name'))
		tr.find('.pdesc b').html($("#product option[value='"+product+"']").attr('data-description'))
		tr.find('.UnitsName').html($("#units option[value='"+units+"']").attr('data-units_name'))
		tr.find('[name="product_id[]"]').val(product)
		tr.find('[name="qty[]"]').val(qty)
		tr.find('[name="units[]"]').val(units)	
		$('#list tbody').append(tr)
		 $('#product').val('').select2({
		 	placeholder:"Please select here",
	 		width:"100%"
		 })
		 $('#units').val('').select2({
		 	placeholder:"Enter Units here",
	 		width:"100%"
		 })
			$('#qty').val('')		
	})
</script>