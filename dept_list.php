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
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4><b>WITH HELD DEPT</b></h4>
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
								<th class="text-center">Date Created</th>
								<th class="text-center">Deptor Name</th>
								<th class="text-center">Phone no.</th>
								<th class="text-center">Dept amount</th>
								<th class="text-center">Paid Amount</th> 
								<th class="text-center">Due Date</th> 
								<th class="text-center">Creator</th>
								<th>Action</th>
							</thead>
							<tbody>
									<?php 
									$i = 0;
									$product = $conn->query("select dp.date_created, dp.deptor_name,dp.deptor_phone_no,dp.sales_invoice_number,dp.dept_amount,sl.total_amount,dp.dept_due_date,u.name from dept_pay dp inner  join sales_list sl on dp.sales_invoice_number = sl.sales_invoice_number inner  join users u on dp.creator = u.id");
									while($row=$product->fetch_assoc()):
										$rows[]=$row;
                                        $dept_sold_lines=$conn->query("SELECT concat(pl.name,' ',pl.measurement,' ','(',pl.description,')') as product_name,iu.item_units_name,posl.qty,posl.rate_price,posl.total_amount  from product_on_sales_lists posl
                                                                inner join product_list pl on pl.id=posl.product_id
                                                                inner join item_units iu on pl.item_units_id = iu.item_units_id
                                                            where posl.sales_invoice_number='".$row['sales_invoice_number']."'");
                                        // while ($dept_lines_of_sales = $dept_sold_lines->fetch_assoc()) {
                                        //     $dept[$row['sales_invoice_number']]=$dept_lines_of_sales;
                                        // }
									?>
									
									 <tr>
										
									 	<td class="text-center"><span class='expand-collapse-icon' href='#' data-toggle="collapse" data-target="#demo<?php echo $row['sales_invoice_number']; ?>" class="accordion-toggle"></span><?="  "?>&nbsp;&nbsp;&nbsp;&nbsp;</td>
										<td class=""><?php echo $row['date_created'] ?></td>
										<td class="text-right"><?php echo $row['deptor_name'] ?></td>
										<td class="text-right"><?php echo $row['deptor_phone_no'] ?></td>
										<td class="text-right"><?php echo number_format($row['dept_amount'],2)?></td>
										<td class="text-right"><?php echo number_format($row['total_amount'],2) ?></td>
										<td class="text-right"><?php echo $row['dept_due_date'] ?></td>
										<td class="text-right"><?php echo$row['name'] ?></td>
										<td>
										<a class="reconcile_data" href="javascript:void(0)" data-id="<?php echo $row['sales_invoice_number'] ?>" data-privilageRequired="DeleteSalesTransaction" style="padding: 6px;"><span class='icon-field'><i class="fa fa-cog"></i></span></a>
										</td>
									</tr>
									<tr>
									<td colspan="12" class="hiddenRow">
											<div class="accordian-body collapse" id="demo<?php echo $row['sales_invoice_number'] ?>">
											<div class="row"></div>	
											<table class="table table-striped" >
													<colgroup>
														<col width="30%">
														<col width="15%">
														<col width="20%">
														<col width="15%">
														<col width="20%">
														<!-- <col width="10%"> -->
													</colgroup>
													<thead>
														<!--  -->
														<tr>
															<th class="text-center">Product</th>
															<th class="text-center">Item Units</th>
															<th class="text-center">Qty</th>
															<th class="text-center">@Price</th>
															<th class="text-center">Amount</th>
															<!-- <th class="text-center"></th> -->
														</tr>
													</thead>

													<tbody>
														<?php
													while($dept_lines_of_sales = $dept_sold_lines->fetch_assoc()): 
														$dept[$row['sales_invoice_number']]=$dept_lines_of_sales;
													
												?>
													<tr class="item-row">
														<td>
															<p class="pname"><?php echo $dept_lines_of_sales['product_name'] ?></p>
															
														</td>
														<td>
															
															<p><?php echo $dept_lines_of_sales['item_units_name'] ?></p>
														</td>
														<td>
															<p class="text-right"><?php echo  $dept_lines_of_sales['qty'] ?></p>
														</td>
														<td>
															
															<p class="text-right"><?php echo $dept_lines_of_sales['rate_price'] ?></p>
														</td>
														<td>
															<p class="amount text-right"> <?php echo $dept_lines_of_sales['total_amount'] ?></p>
														</td>
														
													</tr>
												<?php endwhile; ?>
													</tbody>
												</table>
											</div>
										</td>
									</tr>
									<?php endwhile;?>
							</tbody>
						</table>
						<!-- <div id="pageNavPosition" class="pager-nav"></div>
						<script  src="./script.js"></script> -->
						<script >
							console.log(<?php printf(json_encode($rows)); ?>)
                            console.log('DEPT',<?php printf(json_encode($dept)); ?>)
                            
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
       
<script>
$('.reconcile_data').click(function (e){
			uni_modal('Reconcile','manage_reconciliation.php?id='+$(this).attr('data-id'),'large')
		});
	jQuery(document).ready(function() {
		$('table').dataTable({
				"fixedHeader": false,
				"responsive": true,
				"searching": true,
				"paginate": false,
				"info": false,
				"ordering": false
			});
		// $('.reconcile_data').click(function (e){
		// 	uni_modal('Reconcile','manage_reconciliation.php?id='+$(this).attr('data-id'),'large')
		// });
		jQuery('.expand-collapse-icon').click(function() {
		
			jQuery(this).toggleClass('collapsed');    
		
		});

});
</script>