<?php include 'db_connect.php' ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4><b>Inventory</b></h4>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<th class="text-center">#</th>
								<th class="text-center">Product Name</th>
								<th class="text-center">Stock In</th>
								<th class="text-center">Stock Out</th>
								<th class="text-center">Expired</th>
								<th class="text-center">Stock Available</th>
								<th class="text-center">Amount on Purchace</th>
								<th class="text-center">Amount on Selling</th>
							</thead>
							<tbody>
							<?php 
								$i = 1;
								$product = $conn->query("SELECT * FROM product_list r INNER JOIN price_list pl ON pl.product_id=r.id LEFT OUTER JOIN item_units iu ON iu.item_units_id = r.item_units_id WHERE pl.voided=0 order by r.name asc");
								while($row=$product->fetch_assoc()):
									$rows[]=$row;
								$inn = $conn->query("SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = ".$row['id']);
								$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
								$out = $conn->query("SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = ".$row['id']);
								$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;

								$ex = $conn->query("SELECT sum(qty) as ex FROM expired_product where product_id = ".$row['id']);
								$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;

								$available = $inn - $out- $ex;
								$buying_amount=($available* $row["price_list_buying_pice"]);
								$selling_amount=($available* $row["price_list_selling_price"]);
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
		</div>
	</div>
</div>


<script>
	$('table').dataTable(
		{
			"responsive": true, "lengthChange": false, "autoWidth": false,
      "buttons": ["copy", "csv", "excel", "pdf", "print", "colvis"]
		}
	)
	$('#new_receiving').click(function(){
		location.href = "index.php?page=manage_receiving"
	})
	$('.delete_receiving').click(function(){
		_conf("Are you sure to delete this data?","delete_receiving",[$(this).attr('data-id')])
	})
	function delete_receiving($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_receiving',
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
		})
	}
</script>