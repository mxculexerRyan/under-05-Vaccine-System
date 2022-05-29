<?php
include "db_connect.php";

if (isset($_GET['id'])) {
    $row['id']=$_GET['id'];
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
    ?>
    <div>

        <table class="table table-striped">
            <thead>
                <tr class="info">
                    <th>Item Name</th>
                    <th>Batch No</th>
                    <th>Units</th>
                    <th>System Count</th>
                    <th>Physical Count</th>
                    <th>Reconsile</th>
                </tr>
            </thead>
            <tbody>
                <form action="index.php?page=save_reconsiliation&ItemBatchReconciled=<?= $data_target ?>">
                    <input type="hidden" name="product_id" value="<?= $row['id'] ?>">
                    <?php
                    $product = $conn->query("SELECT * FROM product_list r INNER JOIN price_list pl ON pl.product_id=r.id LEFT OUTER JOIN item_units iu ON iu.item_units_id = r.item_units_id WHERE pl.voided=0 order by r.name asc");
                    while ($row=$product->fetch_array()) {
                        // $prod[$row['']]=$row[''];
                    }
                    $batches = $conn->query("SELECT DISTINCT pbb.batch_no FROM product_list pl 
                                                            INNER JOIN product_by_batch pbb ON pl.id=pbb.product_id 
                                                            WHERE pbb.expired_confirmed=0 and pbb.os_confirmed=0 and pbb.product_id=" . $_GET['id']);

                    while ($batch = $batches->fetch_array()) {
                        $batchs[] = $batch;

                        $on_batch_available = Check_item_available_quantity_by_batch($_GET['id'], $batch['batch_no'])
                    ?>
                        <tr>
                            <td>
                                <?= $row['name'] . ' ' . $row['measurement'] ?>
                            </td>
                            <td><?= $batch["batch_no"] ?></td>
                            <td><?= $row['item_units_name'] ?></td>
                            <td>
                                <input type="hidden" name="scount[]" value="<?php echo $on_batch_available > 0 ? $on_batch_available : 0 ?>">
                                <?= $on_batch_available ?>
                            </td>
                            <td><input type="number" name="pcount[]" id=""></td>
                            <td>
                                <a href="#" class="btn btn-default btn-sm">
                                    <i class="fa fa-cog"></i>
                                </a>
                            </td>
                        </tr>
                    <?php
                    }
                    $arraybatch[] = array($row['id'] => $batchs);
                    ?>
                    <tr>
                        <td colspan="5"></td>
                        <td>
                            <input type="submit" value="Reconsile">
                            <!-- <button class="reconcile_to" data-id="<?php echo $data_target ?>"><span class="btn btn-secondary">reconsiliation</span></button> -->
                        </td>
                    </tr>
            </tbody>
        </table>
        </form>
        </div>
    <?php
}
?>
