<?php
include_once("../../uuid/UuidGenerator.php");
include("../../../../includes/config.php");
$data = json_decode(file_get_contents("php://input"));

$Requesting_store = $data->Requesting_store;
if (isset($data->CustomReqNo)) {
    $CustomReqNo = $data->CustomReqNo;
}
$creator=1;
$uuid=guidv4();
$qty= $data->qty;
$units = $data->units;
$description=$data->Description;
$product_id = $data->product_id;


function request_number(){
    include("../../../../includes/config.php");
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
$data .=", uuid = '$uuid' ";
$save_to_inv_request=$conn->query("INSERT INTO inv_request set ".$data);
$request =$conn->insert_id;
foreach($product_id as $k => $v):
    $data = " request_item_id = '' ";
    $data .= ", request = '$request' ";
    $data .= ", item_id = '$product_id[$k]' ";
    $data .= ", description = '$description[$k]' ";
    $data .= ", item_units_id = '$units[$k]' ";
    $data .= ", quantity = '$qty[$k]' ";
    $data .= ", equivalent_quantity = '$qty[$k]' ";
    $data .= ", creator = '$creator' ";
    $data .= ", uuid = '$uuid' ";
    $save_inv_request_item=$conn->query("INSERT INTO inv_request_item  set ".$data);
    // $save_inv_request_item = $conn->query("INSERT INTO inv_request_item(request_item_id,request, item_id, description,item_units_id,, quantity, equivalent_quantity,creator,uuid) VALUES ('','".$request."','".$product_id[$k]."','".$description[$k]."','".$units[$k]."','".$qty[$k]."','".$qty[$k]."','".$creator."','".$uuid."')");
    
endforeach;
if ($save_to_inv_request) {
    $req_number=request_number();
    $uuid_source=guidv4();
    if (empty($CustomReqNo)) {
        $data = "source = '1'";
        $data .= ", request = '$request' ";
        $data .= ", value = '$req_number' ";
        $data .= ", creator = '$creator' ";
        $data .= ", uuid = '$uuid' ";
        $save_inv_request_number=$conn->query("INSERT INTO inv_request_number set ".$data);
    }else {
        $data = "source = '1'";
        $data .= ", request = '$request' ";
        $data .= ", value = '$req_number' ";
        $data .= ", creator = '$creator' ";
        $data .= ", uuid = '$uuid' ";
        $save_inv_request_number1=$conn->query("INSERT INTO inv_request_number set ".$data);
        $data = "source = '2'";
        $data .= ", request = '$request' ";
        $data .= ", value = '$CustomReqNo' ";
        $data .= ", creator = '$creator' ";
        $data .= ", uuid = '$uuid_source' ";
        $save_inv_request_number2=$conn->query("INSERT INTO inv_request_number set ".$data);
    }
if ($save_inv_request_item) {
        $logedIn=1;
        $user_id=$req_number;
        $myUsername=$ItemName;
        $message="Item added Successfully";
        $icon="success";
        $title="Welcome! to Inventory";
}else{
    $logedIn=0;
    $user_id=[];
    $myUsername=$ItemName;
    $message=mysqli_error($conn);
    $icon="error";
    $title="Incorect ";
}
}else {
    $logedIn=0;
    $user_id=[];
    $myUsername=$ItemName;
    $message=mysqli_error($conn);
    $icon="error";
    $title="Incorect ";
}
$response = array(
    "logedIn"=>$logedIn,
    "myUsername"=>$myUsername,
    "message"=>$message,
    "user_id"=>$user_id,
    "icon"=>$icon,
    "uuid"=>$uuid,
    "title"=>$title,
    "data"=>$data
);
echo json_encode($response);

?>