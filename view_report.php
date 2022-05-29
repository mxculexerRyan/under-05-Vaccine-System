<div class="container-fluid my-2">
    <div class="col-lg-12">
        <div class="row newPrivilegeBased">
            <div class="col-md-2 float-left link">
              <a href="index.php?page=expired_product" class="nav-item nav-expired_product" data-privilageRequired='ExpiredList'><span class='icon-field'><i class="fa fa-list" aria-hidden="true"></i></span> Expired List</a>
            </div>
            <div class="col-md-2 float-left " >
              <a href="index.php?page=supplier" class="nav-item nav-supplier" data-privilageRequired='SuppliersList'><span class='icon-field'><i class="fa fa-truck-loading" aria-hidden="true"></i></span> Supplier List</a>
            </div>
            <div class="col-md-2 float-left" >
              <a href="index.php?page=customer" class="nav-item nav-customer" data-privilageRequired='CustomersList'><span class='icon-field'><i class="fa fa-user-friends" aria-hidden="true"></i></span> Customer List</a>
            </div>
            <div class="col-md-3 float-left" >
              <a href="index.php?page=salesreport" class="nav-item nav-salesreport" data-privilageRequired='ElaborativesalesReport'><span class='icon-field'><i class="fa fa-user-friends" aria-hidden="true"></i></span> Sales Report</a>
            </div>
            <div class="col-md-3 float-left" >
              <a href="index.php?page=graphipresentation" class="nav-item nav-graphipresentation" data-privilageRequired='GraphicalPresentation'><span class='icon-field'><i class="fa fa-chart-line" aria-hidden="true"></i></span> Graphical Pesentation</a>
            </div>
        </div>
    </div>

    <div class="col-lg-12">
		<div class="row">
   
			<!-- FORM Panel -->
			<div class="col-md-12">
			<form action="index.php?page=report" name="reporttodate" method='POST'id="manage-reporttodate">
				<div class="card">
					<div class="card-header">
							filter
				  	</div>
					<div class="card-body">
						<div class="col-md-12">
                            <div class="row">
                                <input type="hidden" name="id">
                                <div class="form-group col-md-3">
                                    <label class="control-label">FROM</label>
                                    <input type="datetime-local" range='00:00-23:59' class="form-control" name="startdate">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">TO</label>
                                    <input type="datetime-local" class="form-control" name="enddate">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">MODE</label>
                                    <select name="mode" id="mode" class="form-control">
                                        <option value="1">All</option>
                                        <option value="2">Cash</option>
                                        <option value="3">Insurance</option>
                                    </select>                      
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label"></label>
                                    <input type="submit" class="form-control" value="LOAd" name="reporttodate">
                                </div>		
                            </div>
                        </div>
					</div>		
				</div>
			</form>
			</div>
			<!-- FORM Panel -->
            <div class="card col-md-12">
                <div class="card-header">
                
                </div>
                <div class="card-body">
                    <?php
                        if(isset($_POST['reporttodate'])):
                            if ($_POST["startdate"]!='' && $_POST["enddate"]!='') {
                                $first_date=$_POST["startdate"];
                                $f=date('Y-m-d H:i:s',strtotime($first_date));
                                $end_date=$_POST["enddate"];
                                $e=date('Y-m-d H:i:s',strtotime($end_date));
                                $scheme=$_POST["mode"];
                               if ($scheme == 2) {
                                    $payment_scheme_id = 'ss.payment_scheme_id = 1';
                                } else if ($scheme == 3) {
                                    $payment_scheme_id = 'ss.payment_scheme_id = 2';
                                }else {
                                    $payment_scheme_id = 'ss.payment_scheme_id = 1 OR ss.payment_scheme_id = 2';
                                }

                                // $e->add(new DateInterval('PT23H59M59S'));
  
                                // Getting the new date after addition
                                // $e->format('Y-m-d H:i:s');
                                // $e = date('Y-m-d H:i:s',strtotime('+23 hour +59 minutes +59 seconds',strtotime($e1)));
                            }
                            $product = $conn->query("SELECT * FROM product_list  order by name asc");
									while($row=$product->fetch_assoc()):
										$prod[$row['id']] = $row;
                                    endwhile;
                            $cat = $conn->query("SELECT * FROM item_units order by item_units_name asc");
                                    while($row=$cat->fetch_assoc()):
                                        $type_arr[$row['item_units_id']] = $row['item_units_name'];
                                    endwhile;      
                            $sales_list=mysqli_query($conn,"SELECT ss.*,ifnull(dos.total_amount,0) on_discount_total_amount,u.name,ifnull(dos.discount_amount,0) discount_amount ,ifnull(dos.payable_amount,0) payable_amount,dos.creator,dos.date_created,cu.customer_name,cu.folio_number,ps.payment_scheme_name FROM sales_list ss 
                                                            LEFT OUTER JOIN discount_on_sales dos ON dos.sales_invoice_number=ss.sales_invoice_number 
                                                            LEFT OUTER JOIN customers cu ON cu.customer_id=ss.customer_id
                                                            LEFT OUTER JOIN prescription pr ON pr.prescription_id=ss.prescription
                                                            INNER JOIN users u ON u.id=ss.creator AND u.id={$_SESSION['login_id']}
                                                            LEFT OUTER JOIN payment_scheme ps ON ps.payment_scheme_id=ss.payment_scheme_id WHERE ss.date_updated BETWEEN '$f' and '$e' AND {$payment_scheme_id } GROUP BY ss.ref_no");
                            // $total_sales_per_specific_date=mysqli_query($conn,"SELECT SUM(ss.total_amount) AS total_amount FROM sales_list ss WHERE ss.date_updated BETWEEN '{$f}' and '{$e}'");

                            if($sales_list):
                                ?>
                                <table  class="table table-condensed table-bordered table-hover">
                                <?php
                                $total=0;
                                while($row=$sales_list->fetch_assoc()):
                                    $transaction[]=$row;
                                    $total=$total+$row['total_amount'];
                                    ?>
                                     <tr style="font-size: 85%;">
                                    <td class="text-center"><?=$row["date_updated"]?></td>
                                        <td>
                                            <table  class="table table-bordered">
                                                <!-- <h4 align="center"><?=date('Ymd',strtotime($row["date_updated"]))."-".$row["ref_no"]?></h4> -->
                                                <thead>
                                                    <td colspan="3"> Sales # : <b> <?=$row["sales_invoice_number"]?> </b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="text-right">Billed By: <?=$row['name']?></span></td>
                                                    <td colspan="2">Custome Name: <b> <?=$row["customer_name"] ? $row["customer_name"] : 'N/A'?> </b></td>
                                                </thead>
                                                <thead>
                                                    <th>product name</th>
                                                    <th>units</th>
                                                    <th>quantity</th>
                                                    <th>rate price</th>
                                                    <th >Amount</th>
                                                </thead>
                                                <tbody>
                                                    
                                                    <?php
                                                    $sql=mysqli_query($conn,"SELECT * FROM pharmacy_stock_sales pss WHERE pss.product_sales_invoice_number like '%".$row["ref_no"]."%'");
                                                    if ($sql) {
                                                        //  $sales_list[]=$sql->fetch_assoc();
                                                        while($r=$sql->fetch_assoc()):
                                                            $sales_listI[$row['ref_no']][]=$r;
                                                        ?>
                                                        <tr>
                                                        <td><?=$r['product_name']?></td>
                                                        <td><?=$r['item_units_name'];?></td>
                                                        <td><?=$r["product_qty"]?></td>
                                                        <td><?=number_format($r["product_rate_price"],2)?></td>
                                                        <td ><?=number_format($r["product_total_amount"],2)?></td>
                                                        </tr>
                                                            <?php
                                                        endwhile;
                                                    ?>
                                                </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="3" class="text-right">Discount</td>
                                                    <td>Tsh.</td>
                                                    <td ><?=number_format($row["discount_amount"],2)?></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3" class="text-right">Total Amount</td>
                                                    <td>Tsh.</td>
                                                    <td ><?=number_format($row["total_amount"],2)?></td>
                                                </tr>
                                            </tfoot>
                                    </table>
                                    </td>
                                    </tr>
                                    <?php
                                     }
                                endwhile;
                                $alltransaction=array(
                                    "transaction"=>$transaction,
                                    "sales_list"=>$sales_listI
                                );
                                ?>
                                <tr>
                                    <td></td>
                                    <td class="text-right"><?php
                                    // echo $total_sales_per_specific_date->fetch_assoc()['total_amount'] ? $total_sales_per_specific_date->fetch_assoc()['total_amount'] : '0.00';
                                    // $sales = $conn->query("SELECT SUM(total_amount) as amount FROM sales_list ss where  {$payment_scheme_id } AND date(ss.date_updated)< '".$e."' and date(ss.date_updated)> '".$f."'");
									$sales = $conn->query("SELECT SUM(total_amount) as amount FROM sales_list ss where  {$payment_scheme_id} AND ss.date_updated BETWEEN '{$f}' and '{$e}'");
                                    // date(ss.date_updated) BETWEEN '{$f}' and '{$e}'
                                    echo "Total Collection   Tsh. \t\t\t\t\t\t\t";
                                    // echo "";
                                    echo number_format($total,2);
                                    // $sales->num_rows > 0 ? number_format($sales->fetch_array()['amount'],2) : "0.00";
   									// 	$total_sales=$sales->num_rows > 0 ? number_format($sales->fetch_array()['amount'],2) : "0.00";
                                           echo " /=";
                                    ?></td>
                                </tr>
                                </table>
                                <script>
                                    console.log(<?=json_encode($alltransaction)?>)
                                </script>
                                <?php
                            else:
                                echo 'Data Not Found';
                            endif;
                        endif;
                    ?>
                </div>
            </div>
		</div>
	</div>	