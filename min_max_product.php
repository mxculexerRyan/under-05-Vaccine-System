<?php include('db_connect.php');
	// $sku = mt_rand(1,99999999);
	// $sku = sprintf("%'08d\n", $sku);
	// $i = 1;
	// while($i == 1){
	// 	$chk = $conn->query("SELECT * FROM product_list where sku ='$sku'")->num_rows;
	// 	if($chk > 0){
	// 		$sku = mt_rand(1,99999999);
	// 		$sku = sprintf("%'08d\n", $sku);
	// 	}else{
	// 		$i=0;
	// 	}
	// }
?>
<style>
	input[type=checkbox]
		{
		  /* Double-sized Checkboxes */
		  -ms-transform: scale(1.5); /* IE */
		  -moz-transform: scale(1.5); /* FF */
		  -webkit-transform: scale(1.5); /* Safari and Chrome */
		  -o-transform: scale(1.5); /* Opera */
		  transform: scale(1.5);
		  padding: 10px;
		}
</style>
<div class="container-fluid">
	
	<div class="col-lg-12">
		<div class="row">
			<!-- FORM Panel -->
			<div class="col-lg-4">
			<form action="" id="manage-min-max-product-stock-level">
				<div class="card">
					<div class="card-header">
						    Minimum and Maximum stock level form
				  	</div>
					<div class="card-body">
							<input type="hidden" name="product_stock_levels_id" id="product_stock_levels_id">
							<div class="form-group">
									<label class="control-label">Product</label>
									<select name="product" id="product" class="custom-select browser-default select2">
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
										<option value="<?php echo $row['id'] ?>" data-name="<?php echo $row['name'] ?>" data-measurement="<?php echo $row['measurement'] ?>" data-description="<?php echo $row['description'] ?>" data-prescription="<?=$row["prescription"]?>"><?php echo $row['name'] . ' | ' . $type_arr[$row['item_units_id']] ?></option>
									<?php endwhile; ?>
									</select>
									<small><a href="javascript:void(0)" id="search_prod">Search product in details.</a></small>
								</div>	
						<div class="form-group">
							<label class="control-label">Item Units</label>
							<select name="units" id="units" class="custom-select browser-default select2">
                                <option></option>
                                <?php 
                                $cat = $conn->query("SELECT * FROM item_units order by item_units_name asc");
                                while($row=$cat->fetch_assoc()):
                                    $type_arr[$row['item_units_id']] = $row['item_units_name'];
                                ?>
                                <option value="<?php echo $row['item_units_id'] ?>"><?php echo $row['item_units_name'] ?></option>
                                <?php endwhile; ?>
							</select>
						</div>
						<div class="form-group">
							<label class="control-label">Minimun stock level</label>
							<input type="number" step="any" class="form-control" value="" name="minlevel" min="1" id="minlevel" required="">
						</div>
                        <div class="form-group">
							<label class="control-label">Maximum stock level</label>
							<input type="number" step="any" class="form-control" value="" name="maxlevel" min="1" id="maxlevel" required="">
						</div>	
					</div>
					<div class="card-footer">
						<div class="row">
							<div class="col-md-12">
								<button type="submit" class="btn btn-sm btn-primary col-sm-3 offset-md-3"> Save</button>
								<button class="btn btn-sm btn-default col-sm-3" type="button" onclick="frm_reset()"> Cancel</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			</div>
			<!-- FORM Panel -->

			<!-- Table Panel -->
			<div class="col-lg-8">
				<div class="card">
					<div class="card-header">
						<b> Minimum and Maximum stock level</b>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-hover" style="width: auto;" >
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="text-center">Item Name</th>
									<th class="text-center">Units</th>
									<th class="text-center">Minimun stock level</th>
									<th class="text-center">Maximum stock level</th>
                                    <th class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>
								<?php 
								$i = 1;
								$prod = $conn->query("SELECT * FROM product_stock_levels psl 
										INNER JOIN product_list p ON psl.product_id=p.id
										INNER JOIN item_categories c on c.item_category_id=p.item_category_id
										INNER JOIN drug_group d on d.drug_group_id=p.drug_group_id
										INNER JOIN item_units u on u.item_units_id=p.item_units_id
										INNER JOIN item_units u2 ON psl.item_units_id = u2.item_units_id
									order by p.id asc");
								while($row=$prod->fetch_assoc()):
									$rows[]=$row;
									$cat  = '';
									$carr = explode(",", $row['item_category_id']);
									foreach($carr as $k => $v){
										if(empty($cat)){
											$cat = $cat_arr[$v];
										}else{
											$cat .= ', '.$cat_arr[$v];
										}
									}
								?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class="">
										<p><small><b><?php echo $row['name'] ?></b></small></p>
									</td>
									<td>
										<p><small><b><?php echo $type_arr[$row['item_units_id']] ?></b></small></p>
										
									</td>
									<td class="text-right">
										<p><small><b><?php echo $row['min_stock_level'] ?></b></small></p>	
									</td>
									<td class="text-right">
										<p><small><b><?php echo $row['max_stock_level'] ?></b></small></p>	
									</td>
									<td class="text-center">
										<a class="edit_min_max_stock_level" type="button" data-product_stock_levels_id="<?php echo $row['product_stock_levels_id'] ?>" data-min_stock_level="<?=$row["min_stock_level"]?>" data-max_stock_level="<?=$row["max_stock_level"]?>" data-product="<?php echo $row['product_id'] ?>" data-name="<?php echo $row['name'] ?>" data-item_units="<?php echo $row['item_units_id']?>" data-item_categories="<?=$row['item_category_id']?>" data-drug_group="<?=$row['drug_group_id']?>"><span class="icon-field"><i class="fa fa-edit"></i></span></a>
										<a class="delete_product" type="button" data-product_stock_levels_id="<?php echo $row['product_stock_levels_id'] ?>"><span class="icon-field"><i class="fa fa-trash"></i></span></a>
									</td>
								</tr>
								<?php endwhile; ?>
							</tbody>
						</table>
						<script >
							console.log(<?php echo json_encode($rows) ?>)
						</script>
					</div>
				</div>
			</div>
			<!-- Table Panel -->
		</div>
	</div>	

</div>
<style>
	
	td{
		vertical-align: middle !important;
	}
	td p{
		margin:unset;
	}
</style>
<script>
	$('.select2').select2({
	 	placeholder:"Please select here",
	 	width:"100%"
	})
    $('#search_prod').click(function(){
		uni_modal("Find Available Product.","find_product.php?work=pos","large")
	})
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
	$('.invoo').attr('hidden',true);
	$('.select2').select2({
		placeholder: "Please Select here",
		width:"100%"
	})
	function frm_reset(){
		$('#manage-min-max-product-stock-level input, #manage-min-max-product-stock-level select, #manage-min-max-product-stock-level textarea').val('')
		$('#manage-min-max-product-stock-level input, #manage-min-max-product-stock-level select, #manage-min-max-product-stock-level textarea').trigger('change')
	}
	$('.edit_min_max_stock_level').click(function(){
		start_load()
		var cat = $('#manage-min-max-product-stock-level')
		cat.get(0).reset()
		
		cat.find("[name='product_stock_levels_id']").val($(this).attr('data-product_stock_levels_id'))
		cat.find("[name='product']").val($(this).attr('data-product'))
		cat.find("[name='units']").val($(this).attr('data-item_units'))
		cat.find("[name='minlevel']").val($(this).attr('data-min_stock_level'))
		cat.find("[name='maxlevel']").val($(this).attr('data-max_stock_level'))
		console.log(JSON.stringify({product_id:$(this).attr('data-product')}))
		// $('.select2').trigger('change')
		end_load()
		$('.select2').trigger('change')
	})
	console.log($("[name='product']").val())
	$('#manage-min-max-product-stock-level').submit(function(e){
		e.preventDefault()
		start_load()
		// alert("hello");
		// console.log(JSON.stringify({aaa:new FormData($(this)[0])}))
		$.ajax({
			url:'ajax.php?action=save_min_max_stock_product',
			data: new FormData($(this)[0]),
			// data: $(this).serialize(),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully added",'success')
					console.log(resp)
					setTimeout(function(){
						location.reload()
					},1500)
				}
				else if(resp==2){
					alert_toast("Data successfully updated",'success')
					console.log(JSON.stringify({resp}))
					setTimeout(function(){
						location.reload()
					},1500)
				}
				else{
					alert_toast("Data Unsuccessfully Entered",'danger')
					console.log(resp)
					console.log(JSON.stringify({resp}))
					setTimeout(function(){
						location.reload()
						
					},1500)
				}
			}
		})
	})
	$('.delete_product').click(function(){
		_conf("Are you sure to delete this product?","delete_product",[$(this).attr('data-product_stock_levels_id')])
	})
	function delete_product($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_min_max_stock_product',
			method:'POST',
			data:{product_stock_levels_id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)

				}
			}
		})
	}
	$('table').dataTable()
</script>