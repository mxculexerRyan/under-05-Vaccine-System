<?php
include '../../../db_connect.php';
// $data = file_get_contents("php://input");
$data = json_decode(file_get_contents("php://input"));
// echo var_dump($data);
// echo $data->Requesting_store;
// echo $data->CustomReqNo;
// echo $data->NewSupplier;
$units=$data->units;
foreach ($units as $key => $value) {
    echo $units[$key]."\n";
}

// extract($data);
// echo $data->product_id;
// $parameters= json_encode($data);
// echo $parameters;
// echo $parameters->manage_requisition;
// echo json_encode($_POST);
// if (isset($_POST['Requesting_store'])) {
//     echo json_encode (array($_POST['Requesting_store']));
// }
// // echo array($data->qty);
$Requesting_store = $data->Requesting_store;
if (isset($data->CustomReqNo)) {
    $CustomReqNo = $data->CustomReqNo;
}
// var_dump($data->product_id);
$qty= $data->qty;
$units = $data->units;
$product_id = $data->product_id;
// // extract($$data);
// // extract($_GET);
function request_number(){
    include '../../../db_connect.php';
    $_query=mysqli_query($conn,'SELECT irn.value as value from inv_request_number irn where source=1 order by irn.request_number_id desc limit 1')->fetch_array()['value'];
    $values = explode("/",$_query);
    if ($values[2] >= 999) {
        $new_middle_number=sprintf("%'03d", ($values[1]+1));
        $new_last_number=substr(sprintf("%'03d", ($values[2]+2)),-3);
        $new_first_string=$values[0];
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }else{
        $new_middle_number=sprintf("%'03d", ($values[1]));
        $new_last_number=sprintf("%'03d", ($values[2]+1));
        $new_first_string=$values[0];
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }
    return $request_number;
}
$creator=1;
$data = "source_store = '2'";
$data .= ", destination_store = '$Requesting_store' ";
$data .= ", creator = '$creator' ";
$save_to_inv_request=$conn->query("INSERT INTO inv_request set ".$data);
$request =$conn->insert_id;
foreach($product_id as $k => $v):
    $data = " request_item_id = '' ";
    $data .= ", request = '$request' ";
    $data .= ", product_id = '$product_id[$k]' ";
    $data .= ", item_units_id = '$units[$k]' ";
    $data .= ", quantity = '$qty[$k]' ";
    $data .= ", equivalent_quantity = '$qty[$k]' ";
    // $data .= ", rejected = '0' ";
    // $data .= ", completed = '0' ";
    // $data .= ", voided = '0' ";
    $data .= ", creator = '$creator' ";
    // $sql_mm="INSERT INTO `inv_request_item`(`request_item_id`, `request`, `product_id`, `item_units_id`, `quantity`, `equivalent_quantity`, `rejected`, `date_rejected`, `rejected_by`, `reject_reason`, `completed`, `completed_by`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `date_voided`, `voided_by`, `void_reason`) VALUES ('','".$request."','".$product_id[$k]."','".$units[$k]."','".$qty[$k]."','".$qty[$k]."','0',null,null,null,'0',null,'".$creator."','',null,null,'0',null,null,null)";
    $save_inv_request_item = $conn->query("INSERT INTO inv_request_item(request_item_id,request, product_id, item_units_id, quantity, equivalent_quantity,creator) VALUES ('','".$request."','".$product_id[$k]."','".$units[$k]."','".$qty[$k]."','".$qty[$k]."','".$creator."')");
    // $save_inv_request_item = $conn->query("INSERT INTO `inv_request_item`(`request_item_id`, `request`, `product_id`, `item_units_id`, `quantity`, `equivalent_quantity`, `rejected`, `date_rejected`, `rejected_by`, `reject_reason`, `completed`, `completed_by`, `creator`, `date_created`, `changed_by`, `date_changed`, `voided`, `date_voided`, `voided_by`, `void_reason`) VALUES ('','".$request."','".$product_id[$k]."','".$units[$k]."','".$qty[$k]."','".$qty[$k]."','0',null,null,null,'0',null,'".$creator."','',null,null,'0',null,null,null)");
endforeach;
if ($save_to_inv_request) {
    $req_number=request_number();
    if (empty($CustomReqNo)) {
        $data = "source = '1'";
        $data .= ", request = '$request' ";
        $data .= ", value = '$req_number' ";
        $data .= ", creator = '$creator' ";
        $save_inv_request_number=$conn->query("INSERT INTO inv_request_number set ".$data);
    }else {
        $data = "source = '1'";
        $data .= ", request = '$request' ";
        $data .= ", value = '$req_number' ";
        $data .= ", creator = '$creator' ";
        $save_inv_request_number1=$conn->query("INSERT INTO inv_request_number set ".$data);
        $data = "source = '2'";
        $data .= ", request = '$request' ";
        $data .= ", value = '$CustomReqNo' ";
        $data .= ", creator = '$creator' ";
        $save_inv_request_number2=$conn->query("INSERT INTO inv_request_number set ".$data);
    }
if ($save_inv_request_item) {
    $resp="success";
    echo $resp;
}else{
    return mysqli_error($conn);
}
}
?>