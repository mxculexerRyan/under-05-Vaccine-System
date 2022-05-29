<?php include 'db_connect.php';

if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM sales_list where id=".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$$k = $val;
	}
	$inv = $conn->query("SELECT * FROM inventory where type=2 and form_id=".$_GET['id']);

}

?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-header">
				<h4>Sales</h4>
			</div>
			<div class="card-body">
				<form action="" id="manage-sales">
					<input type="hidden" name="id" value="<?php echo isset($_GET['id']) ? $_GET['id'] : '' ?>">
					<input type="hidden" name="ref_no" value="<?php echo isset($ref_no) ? $ref_no : '' ?>">
					<div class="col-md-12">
						<div class="row propersales">
							<div class="form-group col-md-5">
								<label class="control-label">Customer</label>
                                <input type="text" name="customer_name" id="customer_name" step="any" class="form-control text-left" >
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="form-group col-md-5">
								<!-- <label class="control-label">PAYMENT SCHEAM</label>
								<select name="scheme" id="scheme" class="custom-select browser-default select2">
									<option value="0" selected=""></option>
								<?php 

								$customer = $conn->query("SELECT * FROM payment_scheme order by payment_scheme_name asc");
								while($row=$customer->fetch_assoc()):
								?>
									<option value="<?php echo $row['payment_scheme_id'] ?>"><?php echo $row['payment_scheme_name'] ?></option>
								<?php endwhile; ?>
								</select> -->
							</div>
							<div class="col-md-4 form-group insurance">
									<!-- <label  class="control-label">FOLIO NUMBER</label>
									<input type="text" name="folio_number" id="folio_number" step="any" class="form-control text-left" > -->
							</div>
							<div class="col-md-3" id='qty_available_and_price' style="float: right;font-family: georgia,garamond,serif;font-size: 16px;font-style:oblique;">
								<label for="" class="control-label" >Available :</label><span class="btn-success" id='available' style="font-size: 20px;"></span><br>
								<label for="" class="control-label" >Cash Price :</label><span class="btn-secondary" id='price' style="font-size: 20px;"></span><br>
								<label for="" class="control-label" >NHIF Price :</label><span class="btn-secondary" id='nhif_price' style="font-size: 20px;"></span><br>
							</div>
						</div>
						<div class="row mb-3 propersales">
								<div class="col-md-4">
									<label class="control-label">Product</label>
									<select name="" id="product" class=" form-control custom-select browser-default select2">
										<option value=""></option>
									<?php 
									$cat = $conn->query("SELECT * FROM item_units WHERE item_units_id IN(SELECT item_units_id FROM product_list pl WHERE pl.description IS NOT NULL )  order by item_units_name asc");
									while($row=$cat->fetch_assoc()):
										$type_arr[$row['item_units_id']] = $row['item_units_name'];
									endwhile; 
									$cat = $conn->query("SELECT * FROM drug_group order by drug_group_name asc");
										while($row=$cat->fetch_assoc()):
											$cat_arr[$row['drug_group_id']] = $row['drug_group_name'];
										endwhile;
										// function chk_available_for_sales_transaction($product_id){
										// 	include "db_connect.php";
										// $inn = $conn->query("SELECT sum(qty) as inn FROM inventory where type = 1  AND batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$product_id);
										// $inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
										// $out = $conn->query("SELECT sum(qty) as `out` FROM inventory where type = 2 AND batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$product_id);
										// $out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;

										// $ex = $conn->query("SELECT sum(qty) as ex FROM expired_product where batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$product_id);
										// $ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;

										// $available = $inn - $out- $ex;
										// return $available;
										// }
									$product = $conn->query("SELECT * FROM product_list  order by name asc");
									while($row=$product->fetch_assoc()):
										$prod[$row['id']] = $row;
									?>
										<option value="<?php echo $row['id'] ?>" data-item_units_id="<?php echo $row['item_units_id'] ?>" data-name="<?php echo $row['name'] ?>" data-measurement="<?php echo $row['measurement'] ?>" data-description="<?php echo $row['description'] ?>" data-prescription="<?=$row["prescription"]?>"><?php echo $row['name'] . ' | ' . $type_arr[$row['item_units_id']].' | '.$row['description'].' |'.$row['measurement']. ' | Tsh. ' . $row['price'].' /='.' | ' ?></option>
									<?php endwhile; ?>
									</select>
									<small><a href="javascript:void(0)" id="search_prod">Search product in details.</a></small>
								</div>
								<div class="col-md-2">
									<label class="control-label">Qty</label>
									<input type="number" class="form-control text-right" step="any" id="qty" >
								</div>
								<div class="form-group">
									<label class="control-label">Item Units</label>
									<select name="units" id="units" class="form-control custom-select browser-default select2">
										<option></option>
									<?php 
									$cat = $conn->query("SELECT * FROM item_units WHERE item_units_id IN(SELECT item_units_id FROM product_list pl WHERE pl.description IS NOT NULL )  order by item_units_name asc");
									while($row=$cat->fetch_assoc()):
										$type_arr[$row['item_units_id']] = $row['item_units_name'];
									?>
										<option value="<?php echo $row['item_units_id'] ?>" data-units_name="<?php echo $row['item_units_name']?>"><?php echo $row['item_units_name'] ?></option>
									<?php endwhile; ?>
									</select>
								</div>
								<div class="col-md-3">
									<label class="control-label">&nbsp</label>
									<button class="btn btn-block btn-sm btn-primary" type="button" id="add_list"><i class="fa fa-plus"></i> Add to List</button>
								</div>
						</div>
						<div class="row">
							<table class="table table-bordered" id="list">
								<colgroup>
									<col width="30%">
									<col width="10%">
									<col width="20%">
									<col width="10%">
									<col width="20%">
									<col width="10%">
								</colgroup>
								<thead>
									<tr>
										<th class="text-center">Product</th>
										<th class="text-center">Qty</th>
										<th class="text-center">Dosage Form</th>
										<th class="text-center">Price</th>
										<th class="text-center">Amount</th>
										<th class="text-center"></th>
									</tr>
								</thead>
								<tbody>
									<?php 
									if(isset($id)):
									while($row = $inv->fetch_assoc()): 
										foreach(json_decode($row['other_details']) as $k=>$v){
											$row[$k] = $v;
										}
									?>
										<tr class="item-row">
											<td>
												<input type="hidden" name="inv_id[]" value="<?php echo $row['id'] ?>">
												<input type="hidden" name="product_id[]" value="<?php echo $row['product_id'] ?>">
												<p class="pname">Name: <b><?php echo $prod[$row['product_id']]['name'] ?></b></p>
												<p class="pdesc"><small><i>Description: <b><?php echo $prod[$row['product_id']]['description'] ?></b></i></small></p>
											</td>
											<td>
												<input type="number" min="1" step="any" name="qty[]" value="<?php echo $row['qty'] ?>" class="text-right" readonly>
											</td>
											<td>
												<p class="UnitsName"><?php echo $type_arr[$row['item_units_id']]?></p>
												<input type="hidden" min="1" step="any" name="units[]" value="<?php echo $prod[$row['product_id']]['item_units_id'] ?>" class="text-right" readonly>
											</td>
											<td>
												<input type="hidden" min="1" step="any" name="price[]" value="<?php echo $row['price'] ?>" class="text-right">
												<p class="text-right"><?php echo $row['price'] ?></p>
											</td>
											<td>
												<p class="amount text-right"></p>
											</td>
											<td class="text-center">
												<!-- <buttob class="btn btn-sm btn-danger" onclick = "rem_list($(this))"><i class="fa fa-trash"></i></buttob> -->
											</td>
										</tr>
									<?php endwhile; ?>
									<?php endif; ?>
								</tbody>
								<tfoot>
									<tr>
										<th class="text-right" colspan="4">Total</th>
										<th class="text-right tamount"></th>
										<th></th>
									</tr>
								</tfoot>
							</table>
						</div>
						<div class="row">
							<div class="col-lg-12">
							<?php if(isset($id)):?>
								<script >
									$('.propersales div').hide()
								</script>
							<?php else:?>
								<script >
									$('.propersales div').show()
								</script>
								<button class="btn btn-primary col-sm-3 btn-sm btn-block float-right " type="button" id="pay">Pay</button>
							<?php endif?>
							</div>
						</div>
					</div>
					<div class="modal fade" id="prescriber_modal" role='dialog'>
					    <div class="modal-dialog modal-md" role="document">
					      <div class="modal-content">
					        <div class="modal-header">
					        <h5 class="modal-title"></h5>
					      </div>
					      <div class="modal-body">
					      	<div class="container-fluid">
					      		<div class="form-group">
					      			<label for="" class="control-label">Prescription Source</label>
					      			<input type="text" name="source_of_prescription"  class="form-control text-right">
					      		</div>
					      		<div class="form-group">
					      			<label for="" class="control-label">Prescriber Name</label>
					      			<input type="text" name="name_of_prescriber"  class="form-control text-right" >
					      		</div>
					      		<div class="form-group">
					      			<label for="" class="control-label">Prescription Date</label>
					      			<input type="date" name="prescribed_date"  class="form-control text-right" >
					      		</div>
					      	</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" id='Gotopay' onclick="$('#Gotopay').onclick()">Save</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Skip</button>
					      </div>
					      </div>
					    </div>
					  </div>
					<div class="modal fade" id="pay_modal" role='dialog'>
					    <div class="modal-dialog modal-md" role="document">
					      <div class="modal-content">
					        <div class="modal-header">
					        <h5 class="modal-title"></h5>
					      </div>
					      <div class="modal-body">
					      	<div class="container-fluid">
							  <div class="form-group">
					      			<label for="" class="control-label">Payment Menthod</label>
					      			<!-- <input type="text" name="tamount" value="" class="form-control text-right" readonly=""> -->
									<select name="paymethod" id="paymethod" class="form-control custom-select browser-default select2">
										<option></option>
										<?php 
										$cat = $conn->query("SELECT * FROM payment_method order by payment_method_name asc");
										while($row=$cat->fetch_assoc()):
											$payment[$row['payment_method_id']] = $row['payment_method_name'];
										?>
										<option value="<?php echo $row['payment_method_id'] ?>" data-payment_method="<?php echo $row['payment_method_name']?>" <?php echo $row['payment_method_id'] &&  $row['payment_method_id'] == 1 ? 'selected' :'' ?>><?php echo $row['payment_method_name'] ?></option>
										<?php endwhile; ?>
									</select>
					      		</div>
					      		<div class="form-group">
					      			<label for="" class="control-label">Total Amount</label>
					      			<input type="text" name="tamount" value="" class="form-control text-right" readonly="">
					      		</div>
					      		<div class="form-group">
					      			<label for="" class="control-label">Amount Tendered</label>
					      			<input type="number" name="amount_tendered" value="0" min="0" class="form-control text-right" >
					      		</div>
								<div class="form-group">
					      			<label for="" class="control-label">Discount</label>
					      			<input type="number" name="amount_discounted" value="" min="0" class="form-control text-right" >
					      		</div>
					      		<div class="form-group">
					      			<label for="" class="control-label">Change</label>
					      			<input type="number" name="change" value="0" min="0" class="form-control text-right" readonly="">
					      		</div>
					      	</div>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-primary" id='submit' onclick="$('#manage-sales').submit()">Pay</button>
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
					      </div>
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
			<input type="hidden" name="inv_id[]" value="">
			<input type="hidden" name="product_id[]" value="">
			<input type="number" name="prescription_id[]" value="" hidden>
			<p class="pname">Name: <b>product</b></p>
			<p class="pdesc"><small><i>Description: <b>Description</b></i></small></p>
		</td>
		<td>
			<input type="number" min="1" step="any" name="qty[]" value="" class="text-right">
		</td>
		<td>
			<p class="UnitsName"></p>
			<input type="hidden" min="1" step="any" name="units[]" value="" class="text-right">
		</td>
		<td>
			<input type="hidden" min="1" step="any" name="price[]" value="" class="text-right" readonly="">
			<p class="price text-right">0</p>
		</td>
		<td>
			<p class="amount text-right"></p>
		</td>
		<td class="text-center">
			<buttob class="btn btn-sm btn-danger" onclick = "rem_list($(this))"><i class="fa fa-trash"></i></buttob>
		</td>
	</tr>
	</table>
</div>
<style type="text/css">
	#tr_clone{
		display: none;
	}
	td{
		vertical-align: middle;
	}
	td p {
		margin: unset;
	}
	td input[type='number']{
		height: calc(100%);
		width: calc(100%);

	}
	input[type=number]::-webkit-inner-spin-button, 
	input[type=number]::-webkit-outer-spin-button { 
	  -webkit-appearance: none; 
	  margin: 0; 
	}
</style>
<script>
	function formatNumber(num) {
		return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
	}
	// dept_collector
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
						$('#qty_available_and_price').find('#available').html(resp.available)
						$('#qty_available_and_price').find('#price').html(formatNumber(resp.price))
						$('#qty_available_and_price').find('#nhif_price').html(formatNumber(resp.price_nhif))	
					}
				});

			});
			$("#product").on('change',function(){
				$('#qty_available_and_price span').empty()
			});
	$('.select2').select2({
	 	placeholder:"Please select here",
	 	width:"100%"
	})
	
	$('#pay').click(function(){
		
		if($("#list .item-row").length <= 0){
			alert_toast("Please insert atleast 1 item first.",'danger');
			end_load();
			return false;
		}
		var pp=document.getElementsByName('prescription_id[]');
		// $('[name="prescription_id[]"]').val();
		var myp=[];
		myp.push(pp);
		
		if($('#list').find('tr[data-prescibe="'+1+'"]').length > 0){
			$('#prescriber_modal').modal('show')
			}
		else{
			$('#pay_modal').modal('show')
		}
		$('#Gotopay').click(function(){
			$('#pay_modal').modal('show')
		})	
	})
	
	$('#search_prod').click(function(){
		uni_modal("Find Available Product.","find_product.php?work=pos","large")
	})
	$(document).ready(function(){
        calculate_total()
		if('<?php echo isset($customer_id) ?>' == 1){
			$('[name="customer_name"]').val('<?php echo isset($customer_name) ? $customer_name :'' ?>').select2({
				placeholder:"Please select here",
	 			width:"100%"
			})
			calculate_total()
		}
	})
	function rem_list(_this){
		_this.closest('tr').remove()
		calculate_total()
	}
	function select_prod($id){
		start_load()
		$('#product').val($id).trigger('change')
        $('#units').val($id).trigger('change')
		end_load();
		$('.modal').modal('hide')
	}
    function select_units($id){
        start_load()
        $('#units').val($id).trigger('change')
		end_load();
		$('.modal').modal('hide')
    }
	$('#add_list').click(function(){
		var tr = $('#tr_clone tr.item-row').clone();
		var product = $('#product').val(),
			qty = $('#qty').val(),
			units=$('#units').val(),
			price = $('#price').val();
			if($('#list').find('tr[data-id="'+product+'"]').length > 0){
				alert_toast("Product already on the list",'danger')
				return false;
			}
			if(product == '' || qty == ''){
				alert_toast("Please complete the fields first",'danger')
				return false;
			}
			$.ajax({
				url:'ajax.php?action=chk_prod_availability',
				method:'POST',
				data:{id:product},
				success:function(resp){
					resp = JSON.parse(resp);
					if(resp.available >= qty){						
						tr.attr('data-id',product)
						tr.find('.pname b').html($("#product option[value='"+product+"']").attr('data-name')+"<sup>"+$("#product option[value='"+product+"']").attr('data-measurement')+"</sup>")
						tr.find('.pdesc b').html($("#product option[value='"+product+"']").attr('data-description'))
						tr.find('.UnitsName').html($("#units option[value='"+units+"']").attr('data-units_name'))
						tr.find('.price').html(resp.price)
						tr.find('[name="product_id[]"]').val(product)
						tr.find('[name="prescription_id[]"]').val(resp.prescribe)
						tr.find('[name="qty[]"]').val(qty)
						tr.find('[name="units[]"]').val(units)
						tr.find('[name="price[]"]').val(resp.price)
						if (resp.prescribe==1) {
							tr.attr('data-prescibe',1)
						}
						var amount = parseFloat(price) * parseFloat(qty);
						tr.find('.amount').html(parseFloat(amount).toLocaleString('en-US',{style:'decimal',maximumFractionDigits:2,minimumFractionDigits:2}))
						$('#list tbody').append(tr)
						console.log(product);
						calculate_total()
						$('[name="qty[]"],[name="price[]"]').keyup(function(){
							calculate_total()
						})
						 $('#product').val('').select2({
						 	placeholder:"Please select here",
					 		width:"100%"
						 })
						 $('#units').val('').select2({
								placeholder:"Enter Units here",
								width:"100%"
							})
							$('#qty').val('')
							$('#price').val('')
					}else{
						alert_toast("Product quantity is greater than available stock \n available stock is."+resp.available,'danger')
					}
				}
			})
		
	})
	function calculate_total(){
		var total = 0;
		$('#list tbody').find('.item-row').each(function(){
			var _this = $(this).closest('tr')
		var amount = parseFloat(_this.find('[name="qty[]"]').val()) * parseFloat(_this.find('[name="price[]"]').val());
		amount = amount > 0 ? amount :0;
		_this.find('p.amount').html(parseFloat(amount).toLocaleString('en-US',{style:'decimal',maximumFractionDigits:2,minimumFractionDigits:2}))
		total+=parseFloat(amount);
		})
		$('[name="tamount"]').val(total)
		$('#list .tamount').html(parseFloat(total).toLocaleString('en-US',{style:'decimal',maximumFractionDigits:2,minimumFractionDigits:2}))
	}
	$('[name="amount_tendered"]').keyup(function(){
		var tendered = $(this).val();
		var tamount = $('[name="tamount"]').val();
		$('[name="change"]').val(parseFloat(tendered) - parseFloat(tamount));
		$('[name="amount_discounted"]').keyup(function(){
			var discount = $('[name="amount_discounted"]').val();
			var amount_tendered = $('[name="amount_tendered"]').val();
			// $('[name="change"]').val('');
			$('[name="change"]').val(parseFloat(tamount) - (parseFloat(amount_tendered) + parseFloat(discount)));
	})
		if ($('[name="change"]').val()<0) {
			alert_toast("The required amount is "+tamount+"",'danger');
			return false;
		}
	})
	$('#manage-sales').submit(function(e){
		e.preventDefault()
		start_load()
		if($("#list .item-row").length <= 0){
			alert_toast("Please insert atleast 1 item first.",'danger');
			end_load();
			return false;
		}
		if ($('[name="change"]').val()<0) {
			// alert_toast("The required amount is "+tamount+"",'danger');
			// $('[name="amount_tendered"]').val(tamount)
			// $('[name="change"]').val('0')
			end_load();
			return false;
		}		
		$.ajax({
			url:'ajax.php?action=save_sales',
		    method: 'POST',
		    data: $(this).serialize(),
			success:function(resp){
				if(resp > 0){
					end_load()
					alert_toast("Data successfully submitted",'success')
					// var nw = window.open("print_sales.php?id="+resp,"_blank","height=700,width=900")
					// 	nw.print()
					// 	setTimeout(function(){
					// 		nw.close()
					// 		location.reload()
					// 	},700)
					uni_modal("Sales Receipt","print_sales.php?id="+resp,"large")
				}else{
					console.log(resp);
				}
			}
		})
	})
</script>