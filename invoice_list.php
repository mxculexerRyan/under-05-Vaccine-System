<?php include 'db_connect.php' ?>
<div class="container-fluid">
	<div class="col-lg-12">
		<div class="row">
			
		</div>
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<b>Proforma Invoice List</b>
							<button class="col-md-2 float-right btn btn-primary btn-sm" id="new_invoice"><i class="fa fa-plus"></i> New invoice</button>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<th class="text-center">#</th>
								<th class="text-center">Date</th>
								<th class="text-center">Invoice #</th>
								<th class="text-center">Receiver</th>
								<th class="text-center">Amount</th>
								<th class="text-center">Action</th>
							</thead>
							<tbody>
							<?php 
								$supplier = $conn->query("SELECT * FROM profroma_invoice order by invoice_number asc");
								while($row=$supplier->fetch_assoc()):
									$invoice_arr[$row['invoice_number']] = $row['profroma_invoice_to'];
									// $incoice_total_arr[$row['invoice_number']] = $row['profroma_invoice_to'];
								endwhile;
								$amount = $conn->query("SELECT invoice_number,COUNT(product_id) as idadi,sum(total_amount) as total_amount FROM wholesale_invoices group by invoice_number");
								while($row=$amount->fetch_assoc()):
									// $invoice_arr[$row['invoice_number']] = $row['profroma_invoice_to'];
									$incoice_total_arr[$row['invoice_number']] = $row['total_amount'];
								endwhile;
								$i = 1;
								$invoice = $conn->query("SELECT * FROM wholesale_invoices r group by invoice_number order by date(date_created) desc");
								while($row=$invoice->fetch_assoc()):
									$rows[]=$row;
							?>
								<tr>
									<td class="text-center"><?php echo $i++ ?></td>
									<td class=""><?php echo date("M d, Y",strtotime($row['date_created'])) ?></td>
									<td class=""><?php echo $row['invoice_number'] ?></td>
									<td class=""><?php echo isset($invoice_arr[$row['invoice_number']])? $invoice_arr[$row['invoice_number']] :'N/A' ?></td>
									<td><?=$incoice_total_arr[$row["invoice_number"]]?></td>
									<td class="text-center">
										<a class="btn btn-sm btn-primary" href="index.php?page=invoice&id=<?php echo $row['invoice_number'] ?>">View</a>
										<a class="btn btn-sm btn-danger delete_invoice" href="javascript:void(0)" data-id="<?php echo $row['invoice_number'] ?>">Delete</a>
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
		</div>
	</div>
</div>


<script>
	$('table').dataTable()
	$('#new_invoice').click(function(){
		location.href = "index.php?page=invoice"
	})
	$('.delete_invoice').click(function(){
		_conf("Are you sure to delete this data?","delete_invoice",[$(this).attr('data-id')])
	})
	function delete_invoice($id){
		start_load()
		$.ajax({
			url:'ajax.php?action=delete_invoice',
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