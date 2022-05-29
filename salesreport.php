<?php
  include 'db_connect.php';
  ?>
  <div class="container-fluid">
    <div class="col-lg-12">
        <!-- <div class="row">
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
        </div> -->
    </div>
	<div class="col-lg-12">
			<!-- FORM Panel -->
            <div class="card col-md-12">
                <div class="card-header"> 
                    <form action="" role="form" id="form-report">
                        <div class="row">
                            <div class="form-group">
                                <label for="">FROM</label>
                                <input type="datetime-local" range='00:00-23:59' name="fromdate" id="fromdate" class="form-control">
                            </div>
                            <div class="form-group" style="padding-left: 5px;">
                                <label for="">TO</label>
                                <input type="datetime-local" range='00:00-23:59' name="todate" id="todate"  class="form-control">
                            </div>
                            <div class="form-group" style="padding-left: 5px;">
                                <label class="control-label">MODE</label>
                                <select name="mode" id="mode" class="form-control ">
                                    <option value="1">By Item Name</option>
                                    <option value="2">By Category</option>
                                    <option value="3">By Collector</option>
                                </select>
                            </div>
                            <div class="form-group" style="padding: 13px 0px 0px 10px;">
                                <label for="" class="control-label"></label>
                                <button id="load" class="btn-sm btn-block btn-wave col-md-12 btn-primary" class="form-control">LOAD</button>
                            </div>
                        </div>
                    </form>   
                </div>
                <div class="card-body">
                <div class="row">
                    <div class="col-md-8"></div>
                    <div class="col-md-4">
                        <button id="btnExport" class="btn btn-secondary" onclick="createPDF('printed_empTable');"> PDF </button>    
                        <button id="btnExport" class="btn btn-success" onclick="fnExcelReport();"> EXPORT </button>
                        <button id="export" class="btn btn-success">CSV</button>
                        <input id='jsonString' type='hidden'/>
                    </div>
                </div>
                <div  id="printed_empTable">
                <table class="empTable">
                <tr colspan="5">
                    <div id="header">
                                <div class="row " ">
                                        <div class="col-md-5"></div>
                                        <div class="col-md-3" align="center">
                                            <img src="assets/img/1600415460_avatar2.jpg" alt="" height="130px" width="120px" srcset="" class="rounded-circle">
                                        </div>
                                        <div class="col-md-4"></div>     
                                    </div>
                                <div class="row " >
                                    <div class="col-md-3"></div>
                                    <div class="col-md-6" style="text-align: center;">
                                    <h2><?=strtoupper("Monaco Pharmacy")?></h2>
                                            <p>Dodoma ,Hazina Tanzania</p>
                                            <!-- <p>Contacts:+(255) 753 553 555</p> -->
                                            <!-- <p><i>Email:monacopharmacy@gmail.com</i></p> -->
                                            <h2 id="addon">
                                                <p id="report_means"></p>
                                                <p><span id="first"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>MPAKA</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span id="last"></span></p>
                                            </h2>    
                                    </div>
                                    <div class="col-md-3"></div>     
                                </div> 
                                </div>
                            </tr>
                </table>
                    <table id='empTable' class='display table empTable' >
                        <thead>
                            <tr>
                                <th>ITEM NAME / CATEGORY / COLLECTOR</th>
                                <th>Flow Time</th>
                                <th>QUANTITY</th>
                                <th>CASH</th>
                                <th>INSURANCE</th>  
                            </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    
                    </table>
                </div>
                </div>
            </div>
		</div>
	</div>	

</div>
<script>
    // $('.select2').select2({
	//  	// placeholder:"Please select here",
	//  	width:"100%"
	// })
    $('#header').hide()
    $('#addon').hide();
   $("#form-report").submit(function(e){
    e.preventDefault()
    var fromdate = $('#fromdate').val();
    var todate = $('#todate').val();
    var mode=$("#mode").val();
    if (fromdate=='' && todate=='') {
        return false;
    }
    $('#header').show()
    $('#addon').show()
    var dataTable = $('#empTable').DataTable({
                'processing': true,
                'serverSide': true,
                "responsive": true,
                "paginate": false,
                "info": false,
                'serverMethod': 'post',
                'searching': false, // Remove default Search Control
                'filtering':false,
                // 'dom': 'Bfrtip',
                // 'buttons': [
                //     'print','csv','pdf'
                // ],
                'ajax': {
                    'url':'ajax.php?action=datesalesreport',
                    'data': function(data){
                        // Read values
                        var fromdate = $('#fromdate').val();
                        var todate = $('#todate').val();
                        var mode=$("#mode").val();

                        // Append to data
                        data.fromdate = fromdate;
                        data.todate = todate;
                        data.mode = mode;
                    }
                },
                // 'columns': [
                //     { data: 'Category' },
                //     { data: 'flow_time' },
                //     { data: 'Total_quantity_sold' },
                //     { data: 'Amount' },
                //     { data: 'Profit' },  
                // ]
                'columns': [
                    { data: 'Category' },
                    { data: 'flow_time' },
                    { data: 'Total_quantity_sold' },
                    { data: 'CASH' },
                    { data: 'INSURANCE' },  
                ]
                
            });
            console.log(dataTable)
            $('select').on('change',function(){
                mode=$("#mode").val();
            dataTable.ajax.reload();
            if (mode ==1) {
                $('#addon').find('#report_means').html('Report By Item')
            }if (mode ==2) {
                $('#addon').find('#report_means').html('Report By Category')
            }if (mode ==3) {
                $('#addon').find('#report_means').html('Report By Collectors')
            }    
        });
        if (mode ==1) {
                $('#addon').find('#report_means').html('Report By Item')
            }if (mode ==2) {
                $('#addon').find('#report_means').html('Report By Category')
            }if (mode ==3) {
                $('#addon').find('#report_means').html('Report By Collectors')
            } 
    $('#addon').find('#first').html(fromdate)
    $('#addon').find('#last').html(todate)
        $('#empTable').on('click', 'tbody td', function() {

        //get textContent of the TD
            console.log('TD cell textContent : ', this.textContent)
            var name = this.textContent;
            // document.location.target= '_blank';
            // document.location.pathname='_blank';
            // document.location.href = '?page=detailed_report&name=' + name + '&fromdate=' +fromdate + '&todate=' +todate + '&mode=' +mode
            document.location.href ='?page=detailed_report&name=' + name + '&fromdate=' +fromdate + '&todate=' +todate + '&mode=' +mode
            //get the value of the TD using the API 
            
            console.log('value by API : ', dataTable.cell({ row: this.parentNode.rowIndex, column : this.cellIndex }).data());
        })  
   });
   $('#export').unbind().on('click', function (){
    csvExport.util.convertTableToJson.convert('#empTable', []);
    
    var headers = ["Export Date: " + new Date().toLocaleString().replace(',', ' ')];
    
    csvExport.util.convertTableToJson.exportExcel($("#jsonString").val(), "Title of Export", headers, true);
});
	// $('table').dataTable();
    function createPDF(id) {
        // var sTable = document.getElementById('headerTable').innerHTML;
        var pp=document.getElementById(id);
        htmlToPrint = '' +
            '<style type="text/css">' +
            'table th, table td {' +
            'border:1px solid #000;' +
            'padding:0.5em;' +
            '}' +
            'table th tr div {' +
            'display:block;' +
            'padding:0.5em;' +
            '}' +
            '</style>';
            htmlToPrint += pp.outerHTML;
        var pa=window.open('','','width=900,height=650');
        pa.document.write(htmlToPrint);
        pa.document.close();
        pa.focus();
        pa.print();
        pa.close();
    }
    function fnExcelReport()
{
    var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
    var textRange; var j=0;
    tab = document.getElementById('empTable'); // id of table

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
var args = [$('#empTable > table'), 'export.csv'];

exportTableToCSV.apply(this, args);

// If CSV, don't do event.preventDefault() or return false
// We actually need this to be a typical hyperlink
});
</script>