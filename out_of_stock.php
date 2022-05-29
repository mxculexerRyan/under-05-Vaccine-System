<?php include 'db_connect.php' ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<!-- <div class="card-header">
						<h4><b>Inventory</b></h4>
					</div> -->
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<th class="text-center">#</th>
								<th class="text-center">Product Name</th>
								<th class="text-center">Units</th>
								<th class="text-center">Stock In</th>
								<th class="text-center">Stock Out</th>
								<th class="text-center">Expired</th>
								<th class="text-center">Stock Available</th>
								<th class="text-center">Amount on Purchace</th>
								<th class="text-center">Amount on Selling</th>
							</thead>
							<tbody>
							<?php
							function check_stock_level($product_id,$item_units_id){
								include ("db_connect.php");
								$inn = $conn->query("SELECT sum(qty) as inn FROM inventory where type = 1 and item_units_id={$item_units_id} and product_id = ".$product_id);
								$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
								
								$out = $conn->query("SELECT sum(qty) as `out` FROM inventory where type = 2 and item_units_id={$item_units_id} and product_id = ".$product_id);
								$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;

								$ex = $conn->query("SELECT sum(qty) as ex FROM expired_product where item_units_id={$item_units_id} and product_id = ".$product_id);
								$ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;

								$available = $inn - $out- $ex;
								// $buying_amount=($available* $row["price_list_buying_pice"]);
								// $selling_amount=($available* $row["price_list_selling_price"]);
								$data["inn"]=$inn;
								$data["out"]=$out;
								$data["ex"]=$ex;
								$data["available"]=$available;
								// $data["buying_amount"]=$buying_amount;
								// $data["selling_amount"]=$selling_amount;
								return $data;
							} 
								$i = 1;
								$prod = $conn->query("SELECT * FROM product_stock_levels psl 
											INNER JOIN product_list p ON psl.product_id=p.id
											INNER JOIN item_categories c on c.item_category_id=p.item_category_id
											INNER JOIN drug_group d on d.drug_group_id=p.drug_group_id
											INNER JOIN item_units u on u.item_units_id=p.item_units_id
											INNER JOIN item_units u2 ON psl.item_units_id = u2.item_units_id
											INNER JOIN price_list pl ON pl.product_id=p.id WHERE pl.voided=0
										order by p.id asc");
								$product = $conn->query("SELECT * FROM product_list r INNER JOIN price_list pl ON pl.product_id=r.id WHERE pl.voided=0 order by r.name asc");
								while($row=$prod->fetch_assoc()):
									$fromfunction=check_stock_level($row['product_id'],$row['item_units_id']);
									$available=$fromfunction['available'];
									$inn=$fromfunction['inn'];
									$out=$fromfunction['out'];
									$ex=$fromfunction['ex'];
									$buying_amount=($available* $row["price_list_buying_pice"]);
								    $selling_amount=($available* $row["price_list_selling_price"]);
									?>
									<tr>
										<?php
										if ($available <= $row["min_stock_level"]) {
										?>
										<td class="text-center"><?php echo $i++ ?></td>
										<td class=""><?php echo $row['name'] ?> <sup><?php echo $row['measurement'] ?></sup></td>
										<td class="text-right"><?php echo  $row['item_units_name']?></td>
										<td class="text-right"><?php echo $inn > 0 ? $inn : '-' ?></td>
										<td class="text-right"><?php echo $out > 0 ? $out : '-' ?></td>
										<td class="text-right"><?php echo $ex > 0 ? $ex : '-'?></td>
										<td class="text-right"><?php echo $available > 0 ? $available: 0 ?></td>
										<td class="text-right"><?php echo number_format($buying_amount) ?></td>
										<td class="text-right"><?php echo number_format($selling_amount) ?></td>
										<?php 
										}else {
										?>
										No data available
									</tr>
									<?php
								}
								endwhile; 
								?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	$('table').dataTable()
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