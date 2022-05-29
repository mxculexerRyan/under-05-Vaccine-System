<?php
include_once 'callAPI.php';
$response=callAPI('GET','http://localhost/monaco/v1/api/testing/multipleview.php',false);
// echo $response;
// var_dump(json_decode($response, true));
$response_data1 = json_decode($response);
$response_data = $response_data1->requests;
// echo count($response_data);
?>
<style>
	.expand-collapse-icon {
  font-size: 15px;
  width: 1em;
  height: 1em;
  position: relative;
  display: inline-block;
 
}

.expand-collapse-icon::before, .expand-collapse-icon::after {
  content: "";
  position: absolute;
  width: 1em;
  height: .16em;
  top: calc( (1em / 2 ) - .08em );
  background-color: green;
  transition: 0.3s ease-in-out all;
  border-radius: 0.03em;
}

.expand-collapse-icon::after {
  transform: rotate(90deg);
}

.collapsed.expand-collapse-icon::after {
  transform: rotate(180deg);
}


.collapsed.expand-collapse-icon::before {
  transform: rotate(90deg) scale(0);
}
</style>

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
							<button class="col-md-2 float-right btn btn-primary btn-sm" id="new_Requisition"><i class="fa fa-plus"></i> New Requisition</button>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<thead>
								<tr>	
										<th class="text-center">#</th>
										<th class="text-center">Request no.</th>
										<th class="text-center">Store</th>
										<th class="text-center">Requested by</th>
										<th class="text-center">Status</th>	
									</tr>
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
								$invoice = $conn->query("select ir.request_id,irn.value as request_no,i.name as store,u.name as requested_by,ir.completed from  inv_request ir
														inner join inv_request_number irn on ir.request_id = irn.request
														inner join inv_store i on ir.source_store = i.store_id
														inner join inv_store i2 on i2.store_id=ir.destination_store
														inner join users u on ir.creator = u.id
														inner join inv_request_number_source irns on irn.source = irns.source_id and irn.source=1");
								foreach($response_data as $row):
									$rows[]=$row;
							?>
								<tr>
									<td class="text-center"><a class='expand-collapse-icon' href='#'></a><?="  "?>&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $i++ ?></td>
									<td class=""><?php echo $row->request_no?></td>
									<td class=""><?php echo $row->store?></td>
									<td class=""><?php echo $row->requested_by ?></td>
									<td><?php
										if ($row->completed == 0) {
											echo 'New';
										}else {
											echo 'Completed';
										}
									?></td>
								</tr>
							<?php endforeach; ?>
							</tbody>
						</table>
						<script >
    						console.log('response',<?php echo json_encode($response_data1)?>)
							// console.log(<?php echo json_encode($rows) ?>)
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>

	$('table').dataTable({
		dom: 'Bfrtip',
        buttons: [
            'copy',
            {
                extend: 'excel',
                messageTop: 'The information in this table is copyright to Sirius Cybernetics Corp.'
            },
            {
                extend: 'pdf',
                messageBottom: null
            },
            {
                extend: 'print',
                messageTop: function () {
                    printCounter++;
 
                    if ( printCounter === 1 ) {
                        return 'This is the first time you have printed this document.';
                    }
                    else {
                        return 'You have printed this document '+printCounter+' times';
                    }
                },
                // messageBottom: null
            }
        ]
	});
	$('#new_Requisition').click(function(){
		location.href = "index.php?page=stock_requisition"
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
	jQuery(document).ready(function() {
 
			jQuery('.expand-collapse-icon').click(function() {
			
				jQuery(this).toggleClass('collapsed');    
			
			});

		});
</script>