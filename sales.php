<?php include 'db_connect.php'; ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row">
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header newPrivilegeBased">
						<b>Sales List</b>
						
						<a class="col-md-2 float-right btn btn-success btn-sm" id="new_wholesale_sales" data-privilageRequired="PerformWholeSaleTransaction"><i class="fa fa-plus"></i>New Wholesale Sales</a>
						<a class="col-md-2 float-right btn btn-primary btn-sm" id="new_sales" data-privilageRequired="PerformNormalSaleTransaction"><i class="fa fa-plus"></i>&nbsp;New Sales</a>
						<a href="javascript:void(0)" id="dlbtn" style="display: none;">
							<button type="button" id="mine">Export</button>
						</a>
					</div>
					<div class="newPrivilegeBased">
					<a class="col-md-2 float-left btn btn-success btn-sm" id="csv_template_Download" title="Download Price template" data-privilageRequired="DownloadPriceTemplate"><i class="fa fa-plus"></i> Download CSV</a>
					<a class="col-md-2 float-right btn btn-primary btn-sm" id="upload_template" title="Upload price for Items" data-privilageRequired="UploadItemPrice"><i class="fa fa-upload"></i>Upload</a>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-sm">
							<thead>
								<th class="text-center">#</th>
								<th></th>
								<th class="text-center">Date</th>
								<th class="text-center">Reference #</th>
								<th class="text-center">Customer</th>
								<th class="text-center">Amount</th>
								<th class="text-center">Action</th>
							</thead>
							<tbody>
							<?php 
							$cat = $conn->query("SELECT * FROM item_units WHERE item_units_id IN(SELECT item_units_id FROM product_list pl WHERE pl.description IS NOT NULL )  order by item_units_name asc");
							while($row=$cat->fetch_assoc()):
								$type_arr[$row['item_units_id']] = $row['item_units_name'];
							endwhile; 
							$cat1 = $conn->query("SELECT * FROM drug_group order by drug_group_name asc");
								while($row=$cat1->fetch_assoc()):
									$cat_arr[$row['drug_group_id']] = $row['drug_group_name'];
								endwhile;
							$product = $conn->query("SELECT * FROM product_list  order by name asc");
							while($row=$product->fetch_assoc()):
								$prod[$row['id']] = $row;
							endwhile;
							// $cat = $conn->query("SELECT * FROM item_units WHERE item_units_id IN(SELECT item_units_id FROM product_list pl WHERE pl.description IS NOT NULL )  order by item_units_name asc");
							// while($row=$cat->fetch_assoc()):
							// 	$type_arr[$row['item_units_id']] = $row['item_units_name'];
							// endwhile;
								$customer = $conn->query("SELECT * FROM customers order by customer_name asc");
								while($row=$customer->fetch_assoc()):
									$cus_arr[$row['customer_id']] = $row['customer_name'];
								endwhile;
									$cus_arr[0] = "GUEST";

								$i = 1;
								$sales = $conn->query("SELECT * FROM sales_list  order by date_updated desc");
								while($row=$sales->fetch_assoc()):
									$inv = $conn->query("SELECT * FROM inventory where type=2 and form_id=".$row['id']);
									$qry = $conn->query("SELECT sl.*,dos.discount_amount as discount_amount FROM sales_list sl LEFT OUTER JOIN discount_on_sales dos on sl.sales_invoice_number=dos.sales_invoice_number WHERE sl.id=".$row['id'])->fetch_array();
									foreach($qry as $k => $val){
										$$k = $val;
									}
							?>
								<tr>
									<td>
									<a class="" data-toggle="collapse" data-target="#demo<?php echo $row['id']; ?>" class="accordion-toggle"><span class='icon-field'><i class="fa fa-eye"></i></span></a>
									<!-- <button class="btn btn-default btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button></td>	 -->
									<td class="text-center"><?php echo $i++ ?></td>
									<td class=""><?php echo date("M d, Y",strtotime($row['date_updated'])) ?></td>
									<td class=""><?php echo $row['ref_no'] ?></td>
									<td class=""><?php echo isset($cus_arr[$row['customer_id']])? $cus_arr[$row['customer_id']] :'N/A' ?></td>
									<td class=""><?php echo $row['amount_tendered'] ?></td>
									<td class="newPrivilegeBased">
										<a class="" href="index.php?page=pos&id=<?php echo $row['id'] ?>" data-privilageRequired="ViewSalesTransactionOnDetails" style="padding: 6px;"><span class='icon-field'><i class="fa fa-eye"></i></span></a>
										<a class="" href="index.php?page=pos&id=<?php echo $row['id'] ?>" data-privilageRequired="EditSalesTransactionOnDetails" style="padding: 6px;"><span class='icon-field'><i class="fa fa-edit"></i></span></a>
										<a class="delete_sales" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" data-privilageRequired="DeleteSalesTransaction" style="padding: 6px;"><span class='icon-field'><i class="fa fa-trash"></i></span></a>
									</td>
								</tr>
								<tr>
                            <td colspan="12" class="hiddenRow">
                                <div class="accordian-body collapse" id="demo<?php echo $row['id'] ?>">
                                    <table class="table table-striped" id="list">
										<colgroup>
											<col width="30%">
											<col width="15%">
											<col width="20%">
											<col width="15%">
											<col width="20%">
											<!-- <col width="10%"> -->
										</colgroup>
										<thead>
											<tr style="height: 7px;">
												<th colspan="4" style="height: 7px;"></th>
												<th style="height: 7px;"><a href="javascript:void(0)" data-sale_id="<?php echo $row['id'] ?>" class="btn btn-success btn-sm print_sales_id">PRINT</a></th>
											</tr>
											<tr>
												<th class="text-center">Product</th>
												<th class="text-center">Qty</th>
												<th class="text-center">Dosage Form</th>
												<th class="text-center">Price</th>
												<th class="text-center">Amount</th>
												<!-- <th class="text-center"></th> -->
											</tr>
										</thead>

                                        <tbody>
											<?php
										while($rowchild = $inv->fetch_assoc()): 
										foreach(json_decode($rowchild['other_details']) as $k=>$v){
											$rowchild[$k] = $v;
										}
									?>
										<tr class="item-row">
											<td>
												<p class="pname">Name: <b><?php echo $prod[$rowchild['product_id']]['name'] ?></b></p>
												<p class="pdesc"><small><i>Description: <b><?php echo $prod[$rowchild['product_id']]['description'] ?></b></i></small></p>
											</td>
											<td>
												<input type="hidden" min="1" step="any" name="qty[]" value="<?php echo $rowchild['qty'] ?>" class="text-right" readonly>
												<p><?php echo $rowchild['qty'] ?></p>
											</td>
											<td>
												<p class="text-right"><?php echo  $type_arr[$rowchild['item_units_id']] ?></p>
											</td>
											<td>
												<input type="hidden" min="1" step="any" name="price[]" value="<?php echo $rowchild['price'] ?>" class="text-right">
												<p class="text-right"><?php echo $rowchild['price'] ?></p>
											</td>
											<td>
												<p class="amount text-right"></p>
											</td>
											
										</tr>
									<?php endwhile; ?>
                                        </tbody>
										<tfoot>
											<tr>
												<!-- <td></td> -->
												<td colspan="4" class="text-right">Discount</td>
												<td class="text-right"><?=number_format($discount_amount, 2)?></td>
											</tr>
											<tr>
												<!-- <td></td> -->
												<td colspan="4" class="text-right">Total amount</td>
												<td class="text-right"><?= $row['amount_tendered']?></td>
											</tr>
										</tfoot>
                                    </table>

                                </div>
                            </td>
                        </tr>
							<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="modal fade" id="template_csv_Upload" role='dialog'>
					    <div class="modal-dialog modal-md" role="document">
					     <!-- <form action="" id="manage-receiving-csv" enctype="multipart/form-data" action="import.php" method="post"> -->
						 <form enctype="multipart/form-data" id="manage-csv-price">
						 	<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Upload Price File</h5>
								</div>
							<div class="modal-body">
								<div class="container-fluid">
									<div class="form-group">
										<label for="" class="control-label">Choose File to Upload</label>
										<!-- <input type="file" name="csv_file_to_Upload" value="" > -->
										<input type="file" name="file" class="form-control"/>
									</div>
								</div>
							</div>
							<div class="modal-footer">
								<!-- <button type="button" class="btn btn-primary" name="import" >Upload</button> -->
								<input type="submit" class="btn btn-primary" name="import_data" value="Upload" id='upload_csv'>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
							</div>
							</div>
						 </form>
					    </div>
					  </div>
	</div>
</div>


<script>
	$(document).ready(function(){
        calculate_total();
	
	// $('table').dataTable();
	$('#new_sales').click(function(){
		location.href = "index.php?page=pos"
	});
	$('#upload_template').click(function(){
			$('#template_csv_Upload').modal('show')
	});
	$('#new_wholesale_sales').click(function(){
		location.href = "index.php?page=pos_wholesale"
	});
	$('#csv_template_Download').click(function(){
		// console.log('resp_template_result')
		var csv = "csv";
		<?php
		function generateRandomString($length = 16) {
			$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
			$charactersLength = strlen($characters);
			$randomString = '';
			for ($i = 0; $i < $length; $i++) {
				$randomString .= $characters[rand(0, $charactersLength - 1)];
			}
			return $randomString;
		}
		date_default_timezone_set("Africa/Nairobi");
		$date=date("y-m-d h:i:sa");
		$downloadTime=date("y-m-d");
		?>
		$.ajax({
			type: 'POST',
			url: 'DownloadPriceTemplate.php',
			data: {csv:csv},
			success: function(resp_template_result) {
			console.log(JSON.parse(JSON.stringify(resp_template_result)));
			alert_toast("Product Price CSV Template Downloaded Seccessfull",'success')
			setTimeout(function() {
					var dlbtn = document.getElementById("dlbtn");
					var file = new Blob([resp_template_result], {type: 'text/csv'});
					dlbtn.href = URL.createObjectURL(file);
					dlbtn.download = 'Template-Price-Download-<?=$downloadTime."_".generateRandomString();?>.csv';
					$( "#mine").click();
					}, 2000);
			},
			error:function(resp_template_result){
				   console.log(resp_template_result)
			}
		});
	});
	$('.delete_sales').click(function(){
		_conf("Are you sure to delete this data?","delete_sales",[$(this).attr('data-id')])
	});
	// confirm_expired($(this).attr('data-product_id'))
	$('.print_sales_id').click(function(){
		// var sales_id=$(this).attr('data-sale_id')
		uni_modal("Sales Receipt","print_sales.php?id="+$(this).attr('data-sale_id'),"large")
	})
	$('#manage-csv-price').submit(function(e){
		e.preventDefault()
		start_load()
		$.ajax({
			url:'ajax.php?action=import_item_price',
			method:'POST',
			cache: false,
			contentType: false,
			processData: false,
			data:new FormData(this),
			success:function(resp){
				if (resp == '?import_status=success') {
					alert_toast("Data successfully Uploaded",'success')
					setTimeout(function(){
						console.log(resp)
						location.href = "index.php?page=manage_receiving"
					},15300)
				}
				else if(resp == '?import_status=error') {
					alert_toast("Data successfully Unsuccessfully",'danger')
					console.log('value from database is: '+resp)
					console.log(resp)
					setTimeout(function(){
						console.log(resp)
						location.href = "index.php?page=manage_receiving"
					},15300)
				}
				else if(resp == '?import_status=invalid_file') {
					alert_toast("Data successfully Unsuccessfully",'danger')
					console.log('value from database is: '+resp)
					console.log(resp)
					setTimeout(function(){
						console.log(resp)
						location.href = "index.php?page=manage_receiving"
					},15300)
				}
				else{
					alert_toast("Data successfully Unsuccessfully",'success')
					console.log('value from database is: '+resp)
					console.log(resp)
					setTimeout(function(){
						console.log(resp)
						location.href = "index.php?page=manage_receiving"
					},55300)
				}
			},
			error:function(resp){
				console.log(resp)
			}
		})
	});
});
	function delete_sales($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_sales',
			method:'POST',
			data:{id:$id},
			success:function(resp){
				if(resp==1){
					alert_toast("Data successfully deleted",'success')
					setTimeout(function(){
						location.reload()
					},1500)
				}
			}
		});
	}
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
</script>
<?php
include "Privilaege_on_Role.php";
?>