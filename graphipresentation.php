  <div class="container-fluid">
    <div class="col-lg-12">
        <form action="" method="post" role="form" id="tospecific">
           <div class="row">
           <div class="form-group col-md-3">
                <label class="control-label">FROM</label>
                <input type="date" class="form-control" name="fromdate" id="fromdate">
            </div>
            <div class="form-group col-md-3">
                <label class="control-label">TO</label>
                <input type="date" class="form-control" name="todate" id="todate">
            </div>
            <div class="form-group col-md-3">
                <label for="">Select Report</label>
                <div class="form-group">
                    <select name="reportType" id="reportType" class="form-control">
                        <option value="">........</option>
                        <option value="">Total sales Presentation</option>
                        <option value="1">Sales on Profit</option>
                        <option value="2">Transaction Trends</option>
                    </select>
                </div>
            </div>
            <div class="form-group" style="padding: 13px 0px 0px 10px;">
                                <label for="" class="control-label"></label>
                                <button id="load" class="btn-sm btn-block btn-wave col-md-12 btn-primary" class="form-control">LOAD</button>
                            </div>
           </div>
        </form>
    </div>
    <div class="chart-container">
        <canvas id="salesanalytic11"></canvas>
    </div>
</div>  
<script src="assets/js/canvasjs.min.js"></script>
<script>
 $("#tospecific").submit(function(e){
    e.preventDefault()
    var fromdate = $('#fromdate').val();
    var todate = $('#todate').val();
    var reportType=$("#reportType").val();
    if (fromdate=='' && todate=='') {
        return false;
    }
   var d= $.ajax({
        url:"ajax.php?action=report_presentation",
        type:"POST",
        data:{fromdate:fromdate,todate:todate,reportType:reportType},
        success:function(data){
            console.log(data);
            if (data[0].reportType==1) {
                var dd={
                Total_quantity_sold:[],
                Amount:[],
                date_created:[],
                Profit:[]
            };
            var len = data.length;
            for (var i = 0; i < len; i++) {
                    dd.date_created.push(data[i].date_created);
                    dd.Total_quantity_sold.push(data[i].Total_quantity_sold);
                    dd.Amount.push(data[i].Amount);
                    dd.Profit.push(data[i].Profit);
                }
                var ctx = $("#salesanalytic11");
                var data = {
                    // labels : ["Medical Aids","Drug","Cosmetics"],
                    labels : dd.date_created,
                    datasets : [
                    {
                        label : "Total_quantity_sold ",
                        data : dd.Total_quantity_sold,
                        backgroundColor : "blue",
                        borderColor : "lightblue",
                        fill : false,
                        lineTension : 0,
                        pointRadius : 5
                    },
                    {
                        label : "Amount Earned",
                        data : dd.Amount,
                        backgroundColor : "green",
                        borderColor : "lightgreen",
                        fill : false,
                        lineTension : 0,
                        pointRadius : 5
                    },
                    {
                        label : "Profit earned",
                        data : dd.Profit,
                        backgroundColor : "yellow",
                        borderColor : "lightgreen",
                        fill : false,
                        lineTension : 0,
                        pointRadius : 5
                    }
                    ]
                };
                var options = {
                    title : {
                    display : true,
                    position : "top",
                    text : "Line Graph",
                    fontSize : 18,
                    fontColor : "#111"
                    },
                    legend : {
                    display : true,
                    position : "bottom"
                    }
                };
            }else{
                var dd={
                Total_quantity_sold:[],
                Amount:[],
                date_created:[],
                Profit:[]
            };
            var len = data.length;
            for (var i = 0; i < len; i++) {
                    dd.date_created.push(data[i].date_created);
                    dd.Total_quantity_sold.push(data[i].Total_quantity_sold);
                    dd.Amount.push(data[i].Amount);
                    dd.Profit.push(data[i].Profit);
                }
                var ctx = $("#salesanalytic11");
                var data = {
                    labels : dd.date_created,
                    datasets : [
                    {
                        label : "Total Number Of transaction ",
                        data : dd.Total_quantity_sold,
                        backgroundColor : "blue",
                        borderColor : "lightblue",
                        fill : false,
                        lineTension : 0,
                        pointRadius : 5
                    }
                    ]
                };
                var options = {
                    title : {
                    display : true,
                    position : "top",
                    text : "Line Graph",
                    fontSize : 18,
                    fontColor : "#111"
                    },
                    legend : {
                    display : true,
                    position : "bottom"
                    }
                };
            }
                var chart = new Chart( ctx, {
                    type : "line",
                    data : data,
                    options : options
                } );
                console.log(dd);
                // console.log(dd.Category);
                // console.log(data);
         },
        error:function(data){
            console.log(data);
        }
    });
    $('select').on('change',function(){
        d.ajax.reload();
        }); 
});
</script>