<?php 
include 'db_connect.php';
if(isset($_GET['id'])){
	// $ref_no=$_GET['id'];
	$qry = $conn->query("SELECT sl.*,dos.discount_amount as discount_amount FROM sales_list sl LEFT OUTER JOIN discount_on_sales dos on sl.sales_invoice_number=dos.sales_invoice_number WHERE sl.id=".$_GET['id'])->fetch_array();
	foreach($qry as $k => $val){
		$$k = $val;
	}
	// $discount=$conn->query('');
	$inv = $conn->query("SELECT * FROM inventory where type=2 and form_id=".$_GET['id']);
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
				<p><h4>Sales Receipt</h4></p>
			</div>
		</div>
        <div class="row">
            <table class="table table-condensed table-hover">
               <thead>
			   	<th  class="class1">Costomer Name:</th>
                <th style="border: 1px; border-color:blanchedalmond;" class="text-right">Bill No. #:   <?php echo date('Ymd',strtotime($date_updated))."-".$ref_no ?></th>
			   </thead>
                <tbody>
				<tr>
                    <td class="class"><?php echo ucwords($cname) ?></td>
                    <td class="text-right" style="border: 1px; border-color:blanchedalmond;">Sales Date:   <?php echo date("Y-m-d h:m:s",strtotime($date_updated)) ?></td>
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
						foreach(json_decode($row['other_details']) as $k=>$v){
							$row[$k] = $v;
						}
                        ?>
                        <tr>
                            <td><?php echo $prod[$row['product_id']]['name'] ?></td>
                            <td><?php echo $row['qty'] ?></td>
                            <td><?php echo number_format($row['price'],2) ?></td>
                            <td><?php echo number_format($row['price'] * $row['qty'],2) ?></td>
                        </tr>
                     <?php
                    endwhile;
                     ?>
				</tbody>
                <tfoot>
					<tr>
                        <td colspan="3" class="text-right">Discount Amount</td>
                        <td><?php echo number_format($discount_amount, 2) ?></td>
                    </tr>
                    <tr>
                        <td colspan="3" class="text-right">Total amount paid</td>
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
		<button class="btn btn-secondary float-right closest" type="button" data-dismiss="modal" id="btnClose">Close</button>
	</div>
</div>
