<style>
   /* #salesTotal{
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: fixed;
	background-size: cover;
	background-image: url('assets/img/Totalamount.jpg');
   } */
</style>

<div class="containe-fluid">

	<div class="row">
		<div class="col-lg-12">
			
		</div>
	</div>

	<div class="row mt-3 ml-3 mr-3">
			<div class="col-lg-12">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-sm-4 offset-sm-2" >
							<div class="card bg-primary"id="salesTotal">
								<div class="card-body text-white">
									<p><b><large>Total Sales To</large></b></p>
									<hr>
									<img src="assets/img/Totalamount1.png" alt="Total Sales To" height="90" width="90" srcset="">
									<p class="text-right"><span class="icon-field"><i class="fa fa-money"></span></i><b><large><?php 
									include 'db_connect.php';
									$sales = $conn->query("SELECT SUM(total_amount) as amount FROM sales_list where date(date_updated)< '".date('Y-m-d')."'");
									echo $sales->num_rows > 0 ? number_format($sales->fetch_array()['amount'],2) : "0.00";
									 ?></large></b></p>
								</div>
							</div>
						</div>
						<div class="col-sm-4">
							<div class="card bg-success">
								<div class="card-body text-white">
									<p><b><large>Total Count of Transaction </large></b></p>
									<hr>
									<p class="text-right"><b><large><?php 
									include 'db_connect.php';
									$sales = $conn->query("SELECT * FROM sales_list where date(date_updated)< '".date('Y-m-d')."'");
									echo $sales->num_rows > 0 ? number_format($sales->num_rows) : "0";

									 ?></large></b></p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-8">
					<div class="card">
						<div class="card-body">
						<?php echo "Welcome back ".$_SESSION['login_name']."!"  ?>				
						</div>
						<hr>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<div class="card-header">
							Expired Product
						</div>
						<div class="card-body">
							<div class="container-fluid">
								<ul class="list-group">
									<?php 
										$ex = $conn->query("SELECT i.*,p.name,p.measurement,p.sku FROM inventory i inner join product_list p on p.id = i.product_id where date(i.expiry_date) <= '".date('Y-m-d')."' and i.expired_confirmed = 0 ");
										while($row= $ex->fetch_array()):
									?>
									<li class="list-group-item bg-danger text-white">
										<?php echo $row['name'] ?> <sup><?php echo $row['measurement'] ?></sup>
										<small>Batch No : <b><?php echo $row['batch_no'] ?></b></small>
										<small>Qty : <b><?php echo $row['qty'] ?></b></small>
										<hr>
										<a href="index.php?page=manage_expired&iid=<?php echo $row['id'] ?>" class="btn badge badge-primary float-right">Confirm Now</a>
									</li>
									<?php endwhile; ?>
								</ul>
							</div>			
						</div>
					</div>
				</div>
			
			</div>
			<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header newPrivilegeBased">
						<b>Sales List</b>
						<a class="col-md-2 float-right btn btn-success btn-sm" id="new_wholesale_sales" data-privilageRequired="PerformWholeSaleTransaction"><i class="fa fa-plus"></i>New Wholesale Sales</a>
						<a class="col-md-2 float-right btn btn-primary btn-sm" id="new_sales" data-privilageRequired="PerformNormalSaleTransaction"><i class="fa fa-plus"></i>New Sales</a>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<th class="text-center">#</th>
								<th class="text-center">Date</th>
								<th class="text-center">Reference #</th>
								<th class="text-center">Customer</th>
								<th class="text-center">Amount</th>
								<th class="text-center">Action</th>
							</thead>
							<tbody>
							<?php 
								$customer = $conn->query("SELECT * FROM customer_list order by name asc");
								while($row=$customer->fetch_assoc()):
									$cus_arr[$row['id']] = $row['name'];
								endwhile;
									$cus_arr[0] = "GUEST";

								$i = 1;
								$sales = $conn->query("SELECT * FROM sales_list  order by date(date_updated) desc");
								while($row=$sales->fetch_assoc()):
							?>
								<tr>
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
							<?php endwhile; ?>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
			
		</div>
	</div>
	<div class="row">
		
	</div>

</div>
<script>
	$('table').dataTable()
	$('#new_sales').click(function(){
		location.href = "index.php?page=pos"
	})
	$('#new_wholesale_sales').click(function(){
		location.href = "index.php?page=pos_wholesale"
	})
	$('.delete_sales').click(function(){
		_conf("Are you sure to delete this data?","delete_sales",[$(this).attr('data-id')])
	})
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
		})
	}
</script>
<?php
include "Privilaege_on_Role.php";
?>