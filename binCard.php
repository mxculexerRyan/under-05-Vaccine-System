<?php 
include 'db_connect.php';
date_default_timezone_set("Africa/Nairobi");
if(isset($_GET['id'])){
	$sql_for_stock_movements=$conn->query("SELECT poh.*,rl.ref_no,tt.transaction_type_name,u.name FROM product_on_hand poh
                INNER JOIN users u ON poh.creator = u.id
                LEFT OUTER JOIN inventory i ON poh.inventory_id = i.id
                LEFT OUTER JOIN receiving_list rl ON rl.id=i.form_id
                LEFT OUTER JOIN sales_list sl ON poh.sales_list_id = sl.id
                LEFT OUTER JOIN  transaction_type tt ON poh.transaction_type = tt.transaction_type_id
            WHERE poh.product_id='".$_GET['id']."'order by poh.date_created");
}
$product = $conn->query("SELECT * FROM product_list pl
                INNER JOIN item_units iu ON pl.item_units_id = iu.item_units_id
                LEFT OUTER JOIN product_stock_levels psl ON pl.id = psl.product_id
            WHERE pl.id=".$_GET['id']);
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

		border: 1px solid black;
    }
	.class , .class1{
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
            <div class="col-md-3" style="float: left;">
				<img src="assets/img/1600415460_avatar2.jpg" alt="" height="90px" width="90px" srcset="" class="rounded-circle">
			</div>
			<div class="col-md-5" style="float: left;text-align:center;">
				<h2><?=strtoupper("Monaco Pharmacy")?></h2>
				<p>Dodoma ,mlezi Tanzania</p>
				<p>Contacts:+(255) 753 553 555</p>
				<p><i>Email:monacopharmacy@gmail.com</i></p>
				
			</div>
			<div class="col-md-4 text-right" style="float: left;">
				<p><h4 style="text-decoration-line: underline; text-decoration-style: dotted;">BIN CARD</h4></p>
			</div>
		</div>
        <div class="row"></div><br>
        <div class="row">
                <div class="col-md-8">
                    <span>INSTITUTION:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;">MONACO PHARAMACY</span>
                </div>
                <div class="col-md-4">
                <span>Item Code:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=$prod[$_GET['id']]['sku']?></span>
                </div>
        </div>
        <br>
        <div class="row">
                <div class="col-md-8">
                    <span>Name of Item:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=$prod[$_GET['id']]['name']?></span>
                </div>
                <div class="col-md-4">
                <span>Year:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=date('Y')?></span>
                </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-6">
                <span>Unit of issue:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=$prod[$_GET['id']]['item_units_name']?></span>
            </div>
            <div class="col-md-2">
                <span>Strength:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=$prod[$_GET['id']]['measurement']?></span>
            </div>
            <div class="col-md-4">
                <span>Dosage Form:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=$prod[$_GET['id']]['item_units_name']?></span>
            </div>
        </div>
        <br>
        <div class="row">
                <div class="col-md-8">
                    <span>Minimum stock level:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=$prod[$_GET['id']]['min_stock_level']?></span>
                </div>
                <div class="col-md-4">
                <span>Maximum stock level:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?=$prod[$_GET['id']]['max_stock_level']?></span>
                </div>
        </div>
        <br>
        <div class="row">
                <div class="col-md-8">
                    <span>Average month Consumption:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?="Average month Consumption"?></span>
                </div>
                <div class="col-md-4">
                <span>Re-order level:  </span><span style="text-decoration-line: underline; text-decoration-style: dotted;"><?='Re-order level'?></span>
                </div>
        </div>
        <br>
        <div class="row">
            <table class="table table-condensed table-hover column-bordered-table thead" id="plist">
                <colgroup>
                    <col width="10%">
                    <col width="10%">
                    <col width="20%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="20%">
                </colgroup>
                <thead bgcolor="#CCC9C9">
                    <tr>
                        <th rowspan="2">Date</th>
                        <th rowspan="2">Receipt/Issue Voucher</th>
                        <th rowspan="2">Receipt from/Issued to</th>
                        <th rowspan="2">Expire date</th>
                        <th colspan="3" class="text-center">Quantity</th>
                        <th rowspan="2" class="text-center">signature</th>
                    </tr>
                    <tr>
                        <th>Received</th>
                        <th>Issued</th>
                        <th>Balance</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    while ($bincard = $sql_for_stock_movements->fetch_assoc()) {
                        $bin[$bincard['product_id']][]=$bincard;
                        ?>
                            <tr>
                                <td><?=$bincard['date_created']?></td>
                                <td><?=$bincard['ref_no']?></td>
                                <td><?=$bincard['transaction_type_name']?></td>
                                <td><?=''?></td>
                                <?php
                                if ($bincard['transaction_type'] == 1) {
                                    ?>
                                    <td><?=$bincard['qty_consumed']?></td>
                                    <td><?=''?></td>
                                    <?php
                                }
                                if ($bincard['transaction_type'] == 2) {
                                    ?> 
                                    <td><?=''?></td>
                                    <td><?=$bincard['qty_consumed']?></td>
                                    <?php
                                }
                                if ($bincard['transaction_type'] == 3) {
                                    ?>
                                    <td><?=''?></td>
                                    <td><?=$bincard['qty_consumed']?></td>
                                    <?php
                                }
                                if ($bincard['transaction_type'] == 5) {
                                    ?>
                                    <td><?=''?></td>
                                    <td><?=''?></td>
                                    <?php
                                }
                                ?>
                                <td><?=$bincard['qty_after']?></td>
                                <td><?=$bincard['name']?></td>
                            </tr>
                        <?php
                    }
                    ?>
                </tbody> 
            </table>
            <script >
                console.log(<?=json_encode($bin)?>)
            </script>
        </div>
	</div>
</div>
<div class="modal-footer display">
	<div class="col-lg-12">
        <button class="btn btn-success float-right print" type="button" id="btnPrint" onclick="">Print</button>
		<button class="btn btn-secondary float-right closest" type="button" data-dismiss="modal" id="btnClose">Close</button>
	</div>
</div>
