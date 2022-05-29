<?php include 'db_connect.php';

if (isset($_GET['id'])) {
	$qry = $conn->query("SELECT * FROM profroma_invoice where invoice_number=" . $_GET['id'])->fetch_array();
	foreach ($qry as $k => $val) {
		$k = $val;
	}
	$inv = $conn->query("SELECT * FROM wholesale_invoices where invoice_number=" . $_GET['id']);
	$amount = $conn->query("SELECT sum(s.total_amount) as amount FROM `wholesale_invoices` s WHERE s.invoice_number=" . $_GET['id']);
	while ($row = $amount->fetch_assoc()) :
		$total_amount = $row["amount"];
	endwhile;
}
$product = $conn->query("SELECT * FROM product_list  order by name asc");
while ($row = $product->fetch_assoc()) :
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
			<!-- <div class="form-group col-md-4 ofsset-md-4">
				<small>Seach for product</small>
				<input type="text" class="input-sm form-control" id="search">
			</div> -->
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
                <th style="border: 1px; border-color:blanchedalmond;" class="text-right">Invoice #: <?php echo date('Ymd',strtotime($qry["date_created"]))."-".$qry["invoice_number"]?></th>
			   </thead>
                <tbody>
				<tr>
                    <td class="class"><?php echo $qry["profroma_invoice_to"] ?></td>
                    <td class="text-right" style="border: 1px; border-color:blanchedalmond;">Proforam date:<?php echo date('d-M-Y',strtotime($qry["date_created"]))?></td>
                </tr>
				</tbody>
            </table>
        </div>
	<div class="row">
		<table class="table table-condensed table-hover column-bordered-table thead" id="plist">
                <colgroup>
                    <col width="50%">
                    <col width="10%">
                    <col width="20%">
                    <col width="20%">
                </colgroup>
				<thead bgcolor="#CCC9C9">
                    <th class="class">Description</th>
                    <th class="class">Qty</th>
                    <th class="class">Rate</th>
                    <th class="class">Amount</th>
				</thead>
				<tbody>
                    <?php
                    while ($row = $inv->fetch_assoc()) :
                        ?>
                        <tr>
                            <td><?php echo $prod[$row['product_id']]['name'] ?></td>
                            <td><?php echo $row['item_quantity'] ?></td>
                            <td><?php echo number_format($row['rate_price'],2) ?></td>
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
</div>
<div class="modal-footer display">
	<div class="col-lg-12">
        <button class="btn btn-success float-right print" type="button" id="btnPrint" onclick="">Print</button>
		<button class="btn btn-secondary float-right" type="button" data-dismiss="modal">Close</button>
	</div>
</div>