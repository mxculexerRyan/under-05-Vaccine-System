<?php
  include 'db_connect.php';
  ?>
  <div class="container-fluid">
    <div class="col-lg-12">
        <div class="row">
            <div class="col-md-2 float-left link">
              <a href="index.php?page=expired_product" class="nav-item nav-expired_product"><span class='icon-field'><i class="fa fa-list" aria-hidden="true"></i></span> Expired List</a>
            </div>
            <div class="col-md-2 float-left " >
              <a href="index.php?page=supplier" class="nav-item nav-supplier"><span class='icon-field'><i class="fa fa-truck-loading" aria-hidden="true"></i></span> Supplier List</a>
            </div>
            <div class="col-md-3 float-left" >
              <a href="index.php?page=customer" class="nav-item nav-customer"><span class='icon-field'><i class="fa fa-user-friends" aria-hidden="true"></i></span> Customer List</a>
            </div>
            <div class="col-md-2 float-left" >
              <a href="index.php?page=salesreport" class="nav-item nav-salesreport"><span class='icon-field'><i class="fa fa-user-friends" aria-hidden="true"></i></span> Sales Report</a>
            </div>
            <div class="col-md-3 float-left" >
              <a href="index.php?page=graphipresentation" class="nav-item nav-graphipresentation"><span class='icon-field'><i class="fa fa-chart-line" aria-hidden="true"></i></span> Graphical Pesentation</a>
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
                                    <input type="date" class="form-control" name="startdate">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">TO</label>
                                    <input type="date" class="form-control" name="enddate">
                                </div>
                                <div class="form-group col-md-3">
                                    <label class="control-label">MODE</label>
                                    <select name="mode" id="mode" class="form-control">
                                        <option value="1">All</option>
                                        <option value="2">By Collectors</option>
                                        <option value="3">Cash</option>
                                        <option value="4">Insurance</option>
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
                                $f=$_POST["startdate"];
                                $e1=date($_POST["enddate"]);
                                // $e->add(new DateInterval('PT23H59M59S'));
  
                                // Getting the new date after addition
                                // $e->format('Y-m-d H:i:s');
                                $e = date('Y-m-d H:i:s',strtotime('+23 hour +59 minutes +59 seconds',strtotime($e1)));
                            }
                            $product = $conn->query("SELECT * FROM product_list  order by name asc");
									while($row=$product->fetch_assoc()):
										$prod[$row['id']] = $row;
                                    endwhile;
                            $cat = $conn->query("SELECT * FROM item_units order by item_units_name asc");
                                    while($row=$cat->fetch_assoc()):
                                        $type_arr[$row['item_units_id']] = $row['item_units_name'];
                                    endwhile;      
                            $sales_list=mysqli_query($conn,"SELECT * FROM sales_list ss WHERE ss.date_updated BETWEEN '$f' and '$e' GROUP BY ss.ref_no");
                            if($sales_list):
                                ?><table  class="table table-condensed table-bordered table-hover">
                                <?php
                                while($row=$sales_list->fetch_assoc()):
                                    $transaction[]=$row;
                                    ?>
                                     <tr>
                                    <td class="text-center"><?=$row["date_updated"]?></td>
                                        <td>
                                            <table  class="table table-bordered">
                                                <h4 align="center"><?=date('Ymd',strtotime($row["date_updated"]))."-".$row["ref_no"]?></h4>
                                                <thead>
                                                    <th>product name</th>
                                                    <th>units</th>
                                                    <th>quantity</th>
                                                    <th>rate price</th>
                                                    <th >Amount</th>
                                                </thead>
                                                <tbody>
                                                    
                                                    <?php
                                                    $sql=mysqli_query($conn,"SELECT distinct i.product_id,i.item_units_id,i.qty,i.price,(i.qty*i.price) as amount,s.ref_no,s.customer_id from inventory i inner JOIN sales_list s ON i.form_id={$row["id"]} WHERE i.type=2 and i.stock_from='Sales' and i.remarks LIKE concat('%','".$row["ref_no"]."','%')" );
                                                    if ($sql) {
                                                        //  $sales_list[]=$sql->fetch_assoc();
                                                        while($r=$sql->fetch_assoc()):
                                                            $sales_listI[$row['ref_no']][]=$r;
                                                        ?>
                                                        <tr>
                                                        <td><?=$prod[$r['product_id']]['name']?></td>
                                                        <td><?=$type_arr[$r['item_units_id']];?></td>
                                                        <td><?=$r["qty"]?></td>
                                                        <td><?=number_format($r["price"],2)?></td>
                                                        <td ><?=number_format($r["amount"],2)?></td>
                                                        </tr>
                                                            <?php
                                                        endwhile;
                                                    ?>
                                                </tbody>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="4" class="text-right">Total Amount</td>
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

</div>
<script>
        $(document).ready(function() {
            $('.cal').each(function(i) {
                calculateColumn(i);
            });
        });
        $("#hi").hide();
        function calculateColumn(index) {
            var total = 0;
            $('table tr').each(function() {
                var value = parseInt($('.cal2', this).eq(index).text());
                if (!isNaN(value)) {
                    total += value;
                }
            });
            function currencyFormat(num) {
                return  num.toFixed(2).replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
            }
            $('.cal1').eq(index).text('Tsh.  ' + currencyFormat(total)+' /=');
        }
    </script>
  <!-- <script>
  $('#salesreporttodate').submit(function (e){
  
    e.preventDefault()
	
    var fromdate=$('#startdate').val(),
        todate=$('#enddate').val(),
        mode=$('#mode').val();
        if(fromdate == '' || todate == ''){
			    alert_toast("Please complete the fields first",'danger')
				return false;
			}
    $.ajax({
        url:'ajax.php?action=datesalesreport',
        data: new FormData($(this)[0]),
		cache: false,
		contentType: false,
		processData: false,
		method: 'POST',
		type: 'POST',
		// method:'POST',
        // data:{startdate:fromdate,enddate:todate,mode:mode},
        success:function(data){
            if (data) {
                $('#table22').html(data)
            }
        }
      })
  })
  $('#manage-reporttodate').submit(function(e){
		e.preventDefault()
		start_load()
        
		$.ajax({
			url:'ajax.php?action=datesalesreport',
			data: new FormData($(this)[0]),
		    cache: false,
		    contentType: false,
		    processData: false,
		    method: 'POST',
		    type: 'POST',
			success:function(resp){
                if (resp) {
                    resp = JSON.parse(resp);
                    location.reload();
                    $('#table22').html(resp)
                }
			}
		})
       
	})
  </script> -->