<?php 
include('db_connect.php');
if(isset($_GET['id'])){
    $product_id=$_GET['id'];
    function check_item_available_quantity_by_batch($product_id,$batch_no){
        include 'db_connect.php';
        $inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
        $inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
        $out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
        $out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
        $ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = '".$product_id."' and batch_no = '".$batch_no."'");
        $ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
        $available_by_batch = $inn - $out - $ex;
        
        return $available_by_batch;
    }
    $product = $conn->query("SELECT * FROM product_list r INNER JOIN price_list pl ON pl.product_id=r.id LEFT OUTER JOIN item_units iu ON iu.item_units_id = r.item_units_id WHERE pl.voided=0 order by r.name asc");
    while ($row=$product->fetch_array()) {
        $prod[$row['id']] = $row;
        $pprod[]=$row;
    }
    $batches = $conn->query("SELECT DISTINCT pbb.batch_no FROM product_list pl 
                    INNER JOIN product_by_batch pbb ON pl.id=pbb.product_id 
                WHERE pbb.expired_confirmed=0 and pbb.os_confirmed=0 and pbb.product_id=" . $_GET['id']);

}
?>
<div class="container-fluid">
	
	<form action="" id="manage-reconciliation">
        <table class="table table-bordered table-condensed table-striped">
            <colgroup>
				<col width="30%">
				<col width="10%">
				<col width="20%">
				<col width="20%">
				<col width="20%">
			</colgroup>
            <thead>
				<tr>
                    <th class="text-center">Item Name</th>
                    <th class="text-center">Batch No</th>
                    <th class="text-center">Expire Date</th>
                    <th class="text-center">Units</th>
                    <th class="text-center">System Count</th>
                    <th class="text-center">Physical Count</th>
				</tr>
			</thead>
            <tbody>
                <?php while($batch = $batches->fetch_array()):?>
                    <?php $on_batch_available = Check_item_available_quantity_by_batch($_GET['id'], $batch['batch_no']); ?>
                    <input type="hidden" name="product_id" value="<?php echo isset($product_id) ? $product_id: '' ?>">
                    <tr>
                        <td>
                            <p class="pname"><?php echo $prod[$_GET['id']]['name'] . ' ' . $prod[$_GET['id']]['measurement'] ?></p>
                        </td>
                        <td>
                            <input type="hidden" name="batch_no[]" class="text-right" value="<?php echo $batch["batch_no"] ? $batch["batch_no"] : '' ?>">
                            <p class="batch"> <?php echo $batch["batch_no"] ?></p>
                        </td>
                        <td>
                            <input type="hidden" name="item_units_id[]" class="text-right" value="<?php echo $prod[$_GET['id']]['item_units_id'] ? $prod[$_GET['id']]['item_units_id'] : '' ?>">
                            <p class="units"> <?php echo $prod[$_GET['id']]['item_units_name'] ?></p>
                        </td>
                        <td>
                            <p class="amountbatchavailable"><?php echo $on_batch_available ?></p>
                            <input type="hidden" name="scount[]" class="text-right" value="<?php echo $on_batch_available > 0 ? $on_batch_available : 0 ?>">
                        </td>
                        <td>
                            <input type="number" name="pcount[]" class="text-right">
                        </td>
                    </tr>
                <?php endwhile;?>
            </tbody>
        </table>
	</form>
</div>
<script>
    console.log(<?=json_encode($pprod);?>)
	$('.select2').select2({
		placeholder: "Please Select Role",
		width:"100%"
	})
	$('#manage-reconciliation').submit(function(e){
		e.preventDefault();
		start_load()
		$.ajax({
			url:'ajax.php?action=save_reconciliation',
			method:'POST',
            cache: false,
			contentType: false,
			processData: false,
			// data:$(this).serialize(),
            data:new FormData(this),
			success:function(resp){
				if(resp == 1){
					alert_toast("Successfully",'success')
                    console.log(resp)
					setTimeout(function(){
						location.reload()
					},1500)
				}else{
                    alert_toast("Data Unsuccessfully saved",'danger')
                    console.log(resp)
					setTimeout(function(){
						location.reload()
					},11500) 
                }
			}
		})
	})
</script>