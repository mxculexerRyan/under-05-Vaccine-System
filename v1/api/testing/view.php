<?php
// include_once '';
include '../../../db_connect.php';
$invoice = $conn->query("select ir.request_id,irn.value as request_no,i.name as store,u.name as requested_by,ir.completed from  inv_request ir
														inner join inv_request_number irn on ir.request_id = irn.request
														inner join inv_store i on ir.source_store = i.store_id
														inner join inv_store i2 on i2.store_id=ir.destination_store
														inner join users u on ir.creator = u.id
														inner join inv_request_number_source irns on irn.source = irns.source_id and irn.source=1");
// echo json_encode(mysqli_fetch_array($invoice));
// echo json_encode(mysqli_fetch_array($invoice));
while($row=$invoice->fetch_assoc()):
    $rows[]=$row;
endwhile;
echo json_encode($rows);
?>