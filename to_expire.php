
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
<?php
// session_start();
include 'db_connect.php';
?>
<div class="containe-fluid">

	<div class="row">
		<div class="col-lg-12">
			
		</div>
	</div>

	<div class="row mt-3 ml-3 mr-3">
			<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<div class="card-header">
							To Expire Product
						</div>
						<div class="card-body">
							<div class="container-fluid">
							<table class="table table-bordered table_to_expire" id="pager">
							<thead>
								<th class="text-center">#</th>
								<th class="text-center">Batch No</th>
								<th class="text-center">Item Name</th>
								<th class="text-center">Units</th>
								<th class="text-center">Qty</th>
								<th class="text-center">Expire date</th>
								<th class="text-center">Action</th>
							</thead>
							<tbody>
								<!-- <ul class="list-group"> -->
									<?php
									$d= (new DateTime('now'));
									$d=$d->format('Y-m-d');
									$date= new DateTime('now');
									$m=3;
									$month=new DateInterval('P'.$m.'M');
									$date->add($month);
									$d1=$date->format('Y-m-d') ;
									$i = 1; 
										$ex = $conn->query("SELECT i.*,iu.*,p.id,p.name,p.measurement,p.sku FROM inventory i inner join product_list p on p.id = i.product_id left outer join item_units iu on iu.item_units_id = p.item_units_id left outer join product_by_batch pbb on pbb.product_id=p.id where date(i.expiry_date) between '".$d."' and '".$d1."'  and i.expired_confirmed = 0 and pbb.expired_confirmed = 0 and pbb.os_confirmed = 0");
										while($row= $ex->fetch_array()):
											$inn = $conn->query("SELECT sum(qty) as inn FROM inventory where type = 1  AND batch_no = {$row['batch_no']} and product_id = ".$row['id']);
											$inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
											$out = $conn->query("SELECT sum(qty) as `out` FROM inventory where type = 2 AND batch_no = {$row['batch_no']} and product_id = ".$row['id']);
											$out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
											$available = $inn - $out;
									?>
										<tr>
										<td><?php echo $i++; ?></td>
										<td><?php echo $row['batch_no'] ;?></td>
										<td><?php echo $row['name']; ?></td>
										<td><?php echo $row['item_units_name']; ?></td>
										<td><?php echo $available; ?></td>
										<td><?php echo $row['expiry_date']; ?></td>
										<td><a  class="btn badge badge-primary float-right Confirm_expired" data-available="<?php echo $available; ?>" data-item_units_id="<?php echo $row['item_units_id'];?>" data-batch_no="<?php echo $row['batch_no']; ?>" data-product_id="<?php echo $row['id']; ?>" data-expire_date="<?php echo $row['expiry_date'] ;?>">Confirm Now</a></td>
										</tr>
									<?php endwhile; ?>
								<!-- </ul> -->
							</tbody>
							</table>
							</div>			
						</div>
						<div class="card-footer">
						<div id="pageNavPosition" class="pager-nav"></div>
						<script  src="./script.js"></script>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
			<div class="col-md-12">

			</div>
		</div>
			
		</div>
	</div>
	<div class="row">
		
	</div>

</div>
<script>
	$('.table_to_expire').dataTable(
		{
				"fixedHeader": false,
				"responsive": true,
				"searching": true,
				"paginate": false,
				"info": false,
				"ordering": false
			}
	);
	// $('#new_sales').click(function(){
	// 	location.href = "index.php?page=pos"
	// })
	// $('#new_wholesale_sales').click(function(){
	// 	location.href = "index.php?page=pos_wholesale"
	// })
	
	$('.Confirm_expired').click(function(){
		confirm_expired($(this).attr('data-product_id'),$(this).attr('data-item_units_id'),$(this).attr('data-batch_no'),$(this).attr('data-available'),$(this).attr('data-expire_date'));
		// _conf("Are you sure Item Batch expired?","confirm_expired",[$(this).attr('data-product_id'),$(this).attr('data-item_units_id'),$(this).attr('data-batch_no'),$(this).attr('data-available')])
	})
	function confirm_expired($product_id,$item_units_id,$batch_no,$available,$expire_date){
		
		start_load()
		$.ajax({
			url:'ajax.php?action=confirm_expired',
			method:'POST',
			data:{product_id:$product_id,item_units_id:$item_units_id,batch_no:$batch_no,available:$available,expire_date:$expire_date},
			success:function(resp){
			    resp = JSON.parse(resp)
				if(resp.response_code == 1){
					alert_toast("Data successfully deleted",'success')
					console.log(resp.response_data);
					setTimeout(function(){
						location.reload()
					},1500)
				}
				if(resp.response_code == 2){
					alert_toast("Data Not deleted",'danger')
					console.log(resp.response_code)
					console.log(resp.response_data)
					console.log(resp.response_data);
					setTimeout(function(){
						location.reload()
					},21500)
				}
				if(resp.response_code == 3){
					alert_toast("Fatal Error",'danger')
					console.log(resp.response_code)
					console.log(resp.response_data)
					setTimeout(function(){
						location.reload()
					},21500)
				}
			}
		});
	}
</script>
<?php
// include "Privilaege_on_Role.php";
?>