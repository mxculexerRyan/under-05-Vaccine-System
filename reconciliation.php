<style>
	tr.hide-table-padding td {
  padding: 0;
}

.expand-button {
	position: relative;
}

.accordion-toggle .expand-button:after
{
  position: absolute;
  left:.75rem;
  top: 50%;
  transform: translate(0, -50%);
  content: '-';
}
.accordion-toggle.collapsed .expand-button:after
{
  content: '+';
}
.hiddenRow {
    padding: 0 !important;
}
.pager-nav {
    margin: 16px 0;
}
.pager-nav span {
    display: inline-block;
    padding: 4px 8px;
    margin: 1px;
    cursor: pointer;
    font-size: 14px;
    background-color: #FFFFFF;
    border: 1px solid #e1e1e1;
    border-radius: 3px;
    box-shadow: 0 1px 1px rgba(0,0,0,.04);
}
.pager-nav span:hover,
.pager-nav .pg-selected {
    background-color: #f9f9f9;
    border: 1px solid #CCCCCC;
}
</style>
<?php include 'db_connect.php' ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4><b>RECONCILIATION</b></h4>
					</div>
					<div class="card-body">
						<table class="table table-bordered table-condensed table-striped table-sm" id="pager">
						<colgroup>
							<col width="4%">
							<col width="20%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="10%">
							<col width="4%">
						</colgroup>
							<thead>	
								<th class="text-center">#</th>
								<th class="text-center">Product Name</th>
								<th class="text-center">Stock In</th>
								<th class="text-center">Stock Out</th>
								<th class="text-center">Expired</th>
								<th class="text-center">System Stock Available</th> 
								<th class="text-center">Amount on Selling</th> 
								<th class="text-center">Physical Count</th>
								<th>Action</th>
							</thead>
							<tbody>
									<?php 
									$i = 0;
									$product = $conn->query("SELECT * FROM product_list r INNER JOIN price_list pl ON pl.product_id=r.id LEFT OUTER JOIN item_units iu ON iu.item_units_id = r.item_units_id WHERE pl.voided=0 order by r.name asc");
									while($row=$product->fetch_assoc()):
										$rows[]=$row;
										$inn = $conn->query("SELECT sum(qty) as inn FROM inventory where type = 1  AND batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$row['id']);
										$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
										$out = $conn->query("SELECT sum(qty) as `out` FROM inventory where type = 2 AND batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$row['id']);
										$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;

										$ex = $conn->query("SELECT sum(qty) as ex FROM expired_product where batch_no IN (SELECT batch_no FROM product_by_batch) and product_id = ".$row['id']);
										$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;

										$available = $inn - $out- $ex;
										$buying_amount=($available* $row["price_list_buying_pice"]);
										$selling_amount=($available* $row["price_list_selling_price"]);
										$data_target=$i++;
									?>
									 <tr>
									 	<td class="text-center"><?php echo $i++ ?></td>
										<td class=""><?php echo $row['name'].' '.$row['measurement'] ?> <sup><?php echo $row['item_units_name'] ?></sup></td>
										<td class="text-right"><?php echo $inn > 0 ? $inn : '-' ?></td>
										<td class="text-right"><?php echo $out > 0 ? $out : '-' ?></td>
										<td class="text-right"><?php echo $ex > 0 ? $ex : '-'?></td>
										<td class="text-right"><?php echo $available > 0 ? $available: 0 ?></td>
										<td class="text-right"><?php echo number_format($buying_amount) ?></td>
										<td class="text-right"><?php echo number_format($selling_amount) ?></td>
										<td>
										<a class="reconcile_data" href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" data-privilageRequired="DeleteSalesTransaction" style="padding: 6px;"><span class='icon-field'><i class="fa fa-cog"></i></span></a>
										</td>
									</tr>
									<?php endwhile;?>
							</tbody>
						</table>
						<div id="pageNavPosition" class="pager-nav"></div>
						<script  src="./script.js"></script>
						<script >
							console.log(<?php print_r(json_encode($rows)); ?>)
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
       
<script>
	$('table').dataTable(
			{
				"fixedHeader": false,
				"responsive": true,
				"searching": true,
				"paginate": false,
				"info": false,
				"ordering": false
			}
	)
	// $('table').dataTable({
	// 	// "fixedHeader": false,
    //     // "responsive": true,
    //     // "searching": true,
    //     // "paginate": true,
    //     // "info": false,
    //     // "ordering": true,
	// 	// "stateSave": true 
	// })

	$('.reconcile_data').click(function (e){
		uni_modal('Reconcile','manage_reconciliation.php?id='+$(this).attr('data-id'),'large')
	})
	// $('#normal').click(function(){
	// 	alert_toast('hellow you are about to reconsile')
	// 	_conf("You are Going to Change Stock level?","save_reconciliation",[$(this).attr('data-id')])
	// })
	// function save_reconciliation($id){
	// 	var idd='#ItemBatchReconciled'+$id;
	// 		$(idd).submit(function(e){
	// 		e.preventDefault()
	// 		start_load()
	// 		$.ajax({
	// 			url:'ajax.php?action=save_reconciliation',
	// 			method:'POST',
	// 			cache: false,
	// 			contentType: false,
	// 			processData: false,
	// 			data:new FormData(this),
	// 			success:function(resp){
	// 				if (resp == 1) {
	// 					alert_toast("Data successfully Uploaded",'success')
	// 					console.log(resp)
	// 					setTimeout(function(){
	// 						console.log(resp)
	// 						location.href = "index.php?page=reconciliation"
	// 					},15300)
	// 				}else{
	// 					alert_toast("Reconciliation Failed",'danger')
	// 					console.log(resp)
	// 					setTimeout(function(){
	// 						console.log(resp)
	// 						location.href = "index.php?page=reconciliation"
	// 					},15300)
	// 				}
	// 			},
	// 			error:function(resp){
	// 			}
	// 		})

	// 	})
	// }
</script>