  <?php
  include 'db_connect.php';
  ?>
  <div class="container-fluid">
    <div class="col-lg-12">
        <div class="row">
            <div class="col-md-2 float-left link">
              <a href="index.php?page=expired_product" class="nav-item nav-expired_product"><span class='icon-field'><i class="fa fa-list"></i></span> Expired List</a>
            </div>
            <div class="col-md-2 float-left " >
              <a href="index.php?page=supplier" class="nav-item nav-supplier"><span class='icon-field'><i class="fa fa-truck-loading"></i></span> Supplier List</a>
            </div>
            <div class="col-md-2 float-left" >
              <a href="index.php?page=customer" class="nav-item nav-customer"><span class='icon-field'><i class="fa fa-user-friends"></i></span> Customer List</a>
            </div>
            <div class="col-md-2 float-left" >
              <a href="index.php?page=salesreport" class="nav-item nav-salesrepor"><span class='icon-field'><i class="fa fa-user-friends"></i></span> Sales Report</a>
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
					<!-- <div class="card-footer">
						<div class="row">
							<div class="col-md-12">
								<button class="btn btn-sm btn-primary col-sm-3 offset-md-3"> Save</button>
								<button class="btn btn-sm btn-default col-sm-3" type="button" onclick="$('#manage-reporttodate').get(0).reset()"> Cancel</button>
							</div>
						</div>
					</div> -->
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
                                $e=$_POST["enddate"];
                            }
                            $product = $conn->query("SELECT * FROM product_list  order by name asc");
									while($row=$product->fetch_assoc()):
										$prod[$row['id']] = $row;
                                    endwhile;
                            $sales_list=mysqli_query($conn,"SELECT *FROM sales_list ss WHERE ss.date_updated BETWEEN '$f' and '$e' GROUP BY ss.ref_no");
                            if($sales_list):
                                ?><table  class="table table-condensed table-bordered table-hover">
                                <?php
                                while($row=$sales_list->fetch_array()):
                                    // $transaction[]=$row;
                                    ?>
                                     <tr>
                                    <td class="text-center"><?=$row["date_updated"]?></td>
                                        <td>
                                            <table  class="table table-bordered">
                                                <h4 align="center"><?=date('Ymd',strtotime($row["date_updated"]))."-".$row["ref_no"]?></h4>
                                                <thead>
                                                    <th>product name</th>
                                                    <th>quantity</th>
                                                    <th>rate price</th>
                                                    <th class="cal">Amount</th>
                                                </thead>
                                    <?php
                                    $sql=mysqli_query($conn,"SELECT i.product_id,i.qty,i.price,(i.qty*i.price) as amount,s.ref_no,s.customer_id from inventory i INNER JOIN sales_list s ON i.remarks LIKE concat('%','".$row["ref_no"]."','%') WHERE i.type=2 and stock_from='Sales' and i.date_updated BETWEEN '$f' and '$e'" );
                                    if ($sql) {
                                        // $p=$sql->fetch_array();
                                        while($r=$sql->fetch_array()):
                                            // $sales_list=$r;
                                           ?>
                                            <tbody>
                                                <tr>
                                                    <td><?=$prod[$r['product_id']]['name']?></td>
                                                    <td><?=$r["qty"]?></td>
                                                    <td><?=$r["price"]?></td>
                                                    <td class="cal2"><?=number_format($r["amount"],2)?></td>
                                                </tr>
                                            </tbody>
                                            <?php
                                        endwhile;	
                                    }
                                    
                                    ?>
                                    <tfoot>
                                        <tr>
                                            <td colspan="3" class="text-right">Total Amount</td>
                                            <td class="cal1"></td>
                                        </tr>
                                    </tfoot>
                                    </table>
                                    </td>
                                    </tr>
                                    <?php
                                endwhile;
                                // $alltransaction=array(
                                //     "transaction"=>$transaction,
                                //     "sales_list"=>$sales_list
                                // );
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