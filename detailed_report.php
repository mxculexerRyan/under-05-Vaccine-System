<!-- 
<?php
    echo $_GET['name']; echo "<br>";
    echo $_GET['fromdate'];echo "<br>";
    echo $_GET['todate'];echo "<br>";
    echo $_GET['mode'];echo "<br>";

    echo date('Y-m-d H:i:s',strtotime($_GET['fromdate']));echo "<br>";



?> -->
<?php
    if( $_GET['mode'] == 3) {
        ?>
        
<style>
    /* Style the header with a grey background and some padding */
.header {
  overflow: hidden;
  background-color: #f1f1f1;
  padding: 20px 10px;
}

/* Style the header links */
.header a {
  float: left;
  color: black;
  text-align: center;
  padding: 12px;
  text-decoration: none;
  font-size: 18px;
  line-height: 25px;
  border-radius: 4px;
}

/* Style the logo link (notice that we set the same value of line-height and font-size to prevent the header to increase when the font gets bigger */
.header a.logo {
  font-size: 25px;
  font-weight: bold;
}

/* Change the background color on mouse-over */
.header a:hover {
  background-color: #ddd;
  color: black;
}

/* Style the active/current link*/
.header a.active {
  background-color: dodgerblue;
  color: white;
}

/* Float the link section to the right */
.header-right {
  float: right;
}

/* Add media queries for responsiveness - when the screen is 500px wide or less, stack the links on top of each other */
@media screen and (max-width: 500px) {
  .header a {
    float: none;
    display: block;
    text-align: left;
  }
  .header-right {
    float: none;
  }
}
</style>
<?php include 'db_connect.php' ?>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-8"></div>
        <div class="col-md-4">
            <button id="btnExport" class="btn btn-secondary" onclick="createPDF('headerTable');"> PDF </button>    
            <button id="btnExport" class="btn btn-success" onclick="fnExcelReport();"> EXPORT </button>
            <button id="export" class="btn btn-success">CSV</button>
            <input id='jsonString' type='hidden'/>
        </div>
    </div>
	<div class="col-lg-12" >
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<table class="display table table-bordered table-sm headerTable" id='headerTable'>
                            <thead>
                                <th colspan="6">
                                <div class="row" >
                                        <div class="col-md-5"></div>
                                        <div class="col-md-3">
                                            <img src="assets/img/1600415460_avatar2.jpg" alt="" height="130px" width="120px" srcset="" class="rounded-circle">
                                        </div>
                                        <div class="col-md-4"></div>     
                                    </div>
                                <div class="row" >
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6" style="text-align: center;">
                                    <h2><?=strtoupper("Monaco Pharmacy")?></h2>
                                            <p>Dodoma ,Hazina Tanzania</p>
                                            <!-- <p>Contacts:+(255) 753 553 555</p> -->
                                            <!-- <p><i>Email:monacopharmacy@gmail.com</i></p> -->
                                            <p><?php
                                                if ($_GET['mode'] == 3) {
                                                    ?>
                                                    Sales By Collector: <?="<b>".$_GET['name']."</b>"?> 
                                                    <?php
                                                }if ($_GET['mode'] ==2) {
                                                    ?>
                                                    Sales By Category: <?="<b>".$_GET['name']."</b>"?>
                                                    <?php
                                                }
                                                if ($_GET['mode'] ==1)  {
                                                    ?>
                                                    Sales By Item: <?="<b>".$_GET['name']."</b>"?>
                                                    <?php
                                                }
                                                
                                            ?></p>
                                            <p><?=date('Y-m-d H:i:s',strtotime($_GET['fromdate']))." ". "<b>Mpaka</b>" ." ".date('Y-m-d H:i:s',strtotime($_GET['todate']))?></p>
                                    </div>
                                    <div class="col-md-3"></div>     
                                </div> 
                                </th>
                            </thead>
							<thead>
								<!-- <th class="text-center">#</th> -->
                                <th class="text-center">Date</th>
								<th class="text-center">Description</th>
								<th class="text-center">Units</th>
								<th class="text-center">Qty</th>
								<th class="text-center">@Price</th>
								<th class="text-center">Amount</th>
							</thead>
							<tbody>
							<?php
								$i = 1;
								$prod = $conn->query("(SELECT pss.product_sales_date_created AS flow_time,pss.product_name AS 'Category',pss.item_units_name as item_units,
                                                        SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
                                                        SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
                                                         pss.product_rate_price  AS 'Profit'
                                                        FROM pharmacy_stock_sales pss WHERE pss.product_sales_creator='".$_GET['name']."' and pss.product_sales_date_created<='".date('Y-m-d H:i:s',strtotime($_GET['todate']))."' AND  pss.product_sales_date_created>='".date('Y-m-d H:i:s',strtotime($_GET['fromdate']))."' 
                                                        GROUP BY pss.product_sales_product_id ORDER BY pss.product_name ASC) 
                                                        UNION ALL
                                                        (SELECT '' AS flow_time,'Total' AS 'Category','' as item_units,
                                                        SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_qty ELSE 0 END, 0)) AS 'Total_quantity_sold',
                                                        SUM(COALESCE(CASE WHEN pss.product_sales_product_id THEN pss.product_total_amount ELSE 0 END, 0)) AS 'Amount',
                                                         '' AS 'Profit'
                                                        FROM pharmacy_stock_sales pss WHERE pss.product_sales_creator='".$_GET['name']."' and pss.product_sales_date_created<='".date('Y-m-d H:i:s',strtotime($_GET['todate']))."' AND  pss.product_sales_date_created>='".date('Y-m-d H:i:s',strtotime($_GET['fromdate']))."')");
								$product = $conn->query("SELECT * FROM product_list r INNER JOIN price_list pl ON pl.product_id=r.id WHERE pl.voided=0 order by r.name asc");
								$i=0;
                                while($row=$prod->fetch_assoc()):
                                    $i++;
									?>
									<tr>
										<?php
										// if ($available > $row["max_stock_level"]) {
										?>
										<!-- <td class="text-center"><?php echo $i++ ?></td> -->
                                        <td class="text-right"><?php echo  $row['flow_time']?></td>
										<td class=""><?php echo $row['Category'] ?></td>
										<td class="text-right"><?php echo  $row['item_units']?></td>
										<td class="text-right"><?php echo $row['Total_quantity_sold'] ?></td>
										<td class="text-right"><?php echo $row['Profit'] ?></td>
										<td class="text-right"><?php echo $row['Amount']?></td>
										<?php 
										// }else {
										?>
                                       <!-- <td colspan="9"> No data available</td> -->
									</tr>
                                    </tbody>
									<?php
								// }
								endwhile; 
								?>
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

        <?php
    }
?>

<script>
    $('#export').unbind().on('click', function (){
    csvExport.util.convertTableToJson.convert('.headerTable', []);
    
    var headers = ["Export Date: " + new Date().toLocaleString().replace(',', ' ')];
    
    csvExport.util.convertTableToJson.exportExcel($("#jsonString").val(), "Title of Export", headers, true);
});
	// $('table').dataTable();
    function createPDF(id) {
        // var sTable = document.getElementById('headerTable').innerHTML;
    var pp=document.getElementById(id);
    var pa=window.open('','','width=900,height=650');
    pa.document.write(pp.outerHTML);
    pa.document.close();
    pa.focus();
    pa.print();
    pa.close();
    }
    function fnExcelReport()
{
    var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
    var textRange; var j=0;
    tab = document.getElementById('headerTable'); // id of table

    for(j = 0 ; j < tab.rows.length ; j++) 
    {     
        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
        //tab_text=tab_text+"</tr>";
    }

    tab_text=tab_text+"</table>";
    // tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
    // tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
    // tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE "); 

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
    {
        txtArea1.document.open("txt/html","replace");
        txtArea1.document.write(tab_text);
        txtArea1.document.close();
        txtArea1.focus(); 
        sa=txtArea1.document.execCommand("SaveAs",true,"Say Thanks to Sumit.xlsx");
    }  
    else                 //other browser not tested on IE 11
        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

    return (sa);
}
function exportTableToCSV($table, filename) {

var $rows = $table.find('tr:has(td)'),

    // Temporary delimiter characters unlikely to be typed by keyboard
    // This is to avoid accidentally splitting the actual contents
    tmpColDelim = String.fromCharCode(11), // vertical tab character
    tmpRowDelim = String.fromCharCode(0), // null character

    // actual delimiter characters for CSV format
    colDelim = '","',
    rowDelim = '"\r\n"',

    // Grab text from table into CSV formatted string
    csv = '"' + $rows.map(function (i, row) {
        var $row = $(row),
            $cols = $row.find('td');

        return $cols.map(function (j, col) {
            var $col = $(col),
                text = $col.text();

            return text.replace(/"/g, '""'); // escape double quotes

        }).get().join(tmpColDelim);

    }).get().join(tmpRowDelim)
        .split(tmpRowDelim).join(rowDelim)
        .split(tmpColDelim).join(colDelim) + '"';

        // Deliberate 'false', see comment below
if (false && window.navigator.msSaveBlob) {

                var blob = new Blob([decodeURIComponent(csv)], {
          type: 'text/csv;charset=utf8'
    });
    
    // Crashes in IE 10, IE 11 and Microsoft Edge
    // See MS Edge Issue #10396033: https://goo.gl/AEiSjJ
    // Hence, the deliberate 'false'
    // This is here just for completeness
    // Remove the 'false' at your own risk
    window.navigator.msSaveBlob(blob, filename);
    
} else if (window.Blob && window.URL) {
                // HTML5 Blob        
    var blob = new Blob([csv], { type: 'text/csv;charset=utf8' });
    var csvUrl = URL.createObjectURL(blob);

    $(this)
            .attr({
                'download': filename,
                'href': csvUrl
            });
        } else {
    // Data URI
    var csvData = 'data:application/csv;charset=utf-8,' + encodeURIComponent(csv);

                $(this)
        .attr({
                 'download': filename,
            'href': csvData,
            'target': '_blank'
            });
}
}

// This must be a hyperlink
$(".export").on('click', function (event) {
// CSV
var args = [$('#headerTable>table'), 'export.csv'];

exportTableToCSV.apply(this, args);

// If CSV, don't do event.preventDefault() or return false
// We actually need this to be a typical hyperlink
});
</script>