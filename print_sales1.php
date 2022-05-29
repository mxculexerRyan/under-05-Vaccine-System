<?php include 'db_connect.php';

if (isset($_GET['id'])) {
	$qry = $conn->query("SELECT * FROM sales_list where id=".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$$k = $val;
	}
	$inv = $conn->query("SELECT posl.product_id,sl.total_amount stotal_amount,posl.qty qty,posl.rate_price rate_price,posl.total_amount total_amount,sl.ref_no as ref_no FROM product_on_sales_lists posl INNER JOIN sales_list sl on sl.sales_invoice_number=posl.sales_invoice_number WHERE sl.id=".$_GET['id']);

    // $amount = $conn->query("SELECT sum(s.total_amount) as amount FROM `wholesale_invoices` s WHERE s.invoice_number=" . $_GET['id']);
	// while ($row = $amount->fetch_assoc()) :
	// 	$total_amount = $row["amount"];
	// endwhile;
	if($customer_id > 0){
		$cname = $conn->query("SELECT * FROM customers where customer_id = $customer_id ");
		$cname = $cname->num_rows > 0 ? $cname->fetch_array()['customer_name']: "Guest";
	}else{
		$cname = "Guest";
	}
}
$product = $conn->query("SELECT * FROM product_list  order by name asc");
	while($row=$product->fetch_assoc()):
		$prod[$row['id']] = $row;
	endwhile;
?>

<div class="container-fluid" id="printSection">
<style>
	table.table-hover tr{
		cursor: pointer !important;
	}
    table thead .class1{
        background-color: #CCC9C9;
		border: 1px solid black;
    }
	table thead .class{
        /* background-color: #CCC9C9; */
		border: 1px solid black;
    }
	.class , .class1{
        /* background-color: #CCC9C9; */
		border: 1px solid black;
    }
	#uni_modal .modal-footer{
		display: none;
	}
	#uni_modal .modal-footer.display{
		display: block;
	}
.column-bordered-table thead td {
    border-left: 1px solid #c3c3c3;
    border-right: 1px solid #c3c3c3;
}

.column-bordered-table td {
    border-left: 1px solid #c3c3c3;
    border-right: 1px solid #c3c3c3;
}

.column-bordered-table tfoot tr {
    border-top: 1px solid #c3c3c3;
    border-bottom: 1px solid #c3c3c3;
}
</style>
	<div class="col-lg-12">
		<div class="row">
            <div class="col-md-4" style="float: left;">
				<img src="assets/img/1600415460_avatar2.jpg" alt="" height="90px" width="90px" srcset="" class="rounded-circle">
			</div>
			<div class="col-md-4" style="float: left;">
				<h3>Monaco Pharmacy</h3>
				<p>Dodoma ,mlezi Tanzania</p>
				<p>Contacts:+(255) 753 553 555</p>
				<p><i>Email:monacopharmacy@gmail.com</i></p>
				
			</div>
			<div class="col-md-4 text-right" style="float: left;">
				<p>PROFORMA INVOICE</p>
			</div>
		</div>
        <div class="row">
            <table class="table table-condensed table-hover">
               <thead>
			   	<th  class="class1">Billing To</th>
                <th style="border: 1px; border-color:blanchedalmond;" class="text-right">Invoice #: <?php echo $sales_invoice_number; ?></th>
			   </thead>
                <tbody>
				<tr>
                    <td class="class"><?php echo $cname ?></td>
                    <td class="text-right" style="border: 1px; border-color:blanchedalmond;">Invoice Date:<?php echo $date_updated;?></td>
                </tr>
				</tbody>
            </table>
        </div>
	<div class="row">
		<table class="table table-condensed table-hover column-bordered-table thead" id="plist">
                <colgroup>
                    <col width="50%">
                    <col width="20%">
                    <col width="20%">
                    <!-- <col width="20%"> -->
                </colgroup>
				<thead bgcolor="#CCC9C9">
                    <th class="class">Item Name</th>
                    <th class="class">Rate</th>
                    <th class="class">Amount</th>
				</thead>
				<tbody>
                    <?php
                    while ($row = $inv->fetch_assoc()) :
                        ?>
                        <tr>
                            <td><?php echo $prod[$row['product_id']]['name'] ?></td>
                            <td><?php echo number_format($row['rate_price'],2) ?></td>
                            <td><?php echo number_format($row['total_amount'], 2) ?></td>
                        </tr>
                     <?php
                    endwhile;
                     ?>
				</tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="text-right">TOTAL</td>
                        <td><?php echo number_format($total_amount, 2) ?></td>
                    </tr>
		        </tfoot>
		</table>
	</div>
	</div>
</div>
<div class="modal-footer display">
	<div class="col-lg-12">
        <button class="btn btn-success float-right print" type="button" id="btnPrint" onclick="">Print</button>
		<button class="btn btn-secondary float-right" type="button" data-dismiss="modal">Close</button>
	</div>
</div>