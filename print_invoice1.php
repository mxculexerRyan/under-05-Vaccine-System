<?php
include 'db_connect.php';
include 'db_connect.php';
if(isset($_GET['id'])){
	$qry = $conn->query("SELECT * FROM sales_list where id=".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$$k = $val;
	}
	$inv = $conn->query("SELECT * FROM inventory where type=2 and form_id=".$_GET['id']);
	if($customer_id > 0){
		$cname = $conn->query("SELECT * FROM customer_list where id = $customer_id ");
		$cname = $cname->num_rows > 0 ? $cname->fetch_array()['name']: "Guest";
	}else{
		$cname = "Guest";
	}
}
$product = $conn->query("SELECT * FROM product_list  order by name asc");
	while($row=$product->fetch_assoc()):
		$prod[$row['id']] = $row;
	endwhile;


?>
<div class="container-fluid" id="printincvoice">
	<style>
		@media screen {
  #printSection {
      display: none;
  }
}

@media print {
  body * {
    visibility:hidden;
  }
  #printSection, #printSection * {
    visibility:visible;
  }
  #printSection {
    position:absolute;
    left:0;
    top:0;
  }
}
		body * {
			font-size: 14px
		}

		table {
			border-collapse: collapse;
		}

		.bbottom {
			border-bottom: 1px solid black
		}
		.wborder{
			border-right: 1px solid black;
			border-left: 1px solid black; 
		}
		td p,
		th p {
			margin: unset
		}

		.text-center {
			text-align: center
		}

		.text-right {
			text-align: right
		}

		.text-left {
			text-align: left
		}

		.clear {
			padding: 10px
		}

		#uni_modal .modal-footer {
			display: none;
		}
	</style>
	<div class="modal-header display">
		<div class="col-lg-12">
			<button class="btn btn-secondary float-right" type="button" data-dismiss="modal">Close</button>
			<button class="btn btn-success float-right print" type="button" id="btnPrint" onclick="">Print</button>
		</div>
	</div>
	<div class="row display modal-body" style="padding-top: 90px;" id="printSection">
		<div class="col-md-12">
			<div class="col-md-4" style="float: left;">
				<img src="assets/img/1600415460_avatar2.png" alt="" height="90px" width="90px" srcset="" class="rounded-circle">
			</div>
			<div class="col-md-4" style="float: left;">
				<h1>Monaco Pharmacy</h1>
				<p>Dodoma ,mlezi Tanzania</p>
				<p>Contacts</p>
				<p>Email:</p>
				
			</div>
			<div class="col-md-4" style="float: left;">
				<p>PROFORMA INVOICE</p>
			</div>
		</div>
	<div class="row">
		<div class="col-md-4">
			<table class="table table-condensed table-hover">
				<tbody>
					<tr>
						<td>Billing To </td>	
					</tr>
					<tr>
						<td><?php echo $qry["profroma_invoice_to"] ?></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<table class="table table-bordered table-borderd-stripped">
		<colgroup>
			<col width="50%">
			<col width="10%">
			<col width="20%">
			<col width="20%">
			<!-- <col width="10%"> -->
		</colgroup>
		<thead>
			<tr>
				<th>Description</th>
				<th>Qty</th>
				<th>Rate</th>
				<th>Amount</th>
			</tr>
		</thead>
		<tbody>
			<?php
				while ($row = $inv->fetch_assoc()) :
					?>
					<tr>
						<td><?php echo $prod[$row['product_id']]['name'] ?></td>
						<td><?php echo $row['item_quantity'] ?></td>
						<td><?php echo $row['rate_price'] ?></td>
						<td><?php echo number_format($row['rate_price'] * $row['item_quantity'], 2) ?></td>
					</tr>
			<?php
				endwhile;
			?>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="3" class="text-right">TOTAL</td>
				<td><?php echo number_format($total_amount, 2) ?></td>
			</tr>
		</tfoot>
	</table>
	</div>
</div>

<!-- 
<script>
	$('.btnPrint').click(function(){
	 var nw = window.open("print_invoice.php?id=<?php echo $_GET['id']?>","_blank","height=700,width=900")
		 nw.print()
		 setTimeout(function(){	
			nw.close()
			location.reload()
			},
			700)	
	})
</script> -->