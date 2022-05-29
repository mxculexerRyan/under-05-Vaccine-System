<?php
include_once("../uuid/UuidGenerator.php");
include("../../../includes/config.php");
$data = json_decode(file_get_contents("php://input"));
$ItemName=$data->ItemName;
$uom=$data->uom;
$stku=$data->stku;
$uuid=guidv4();
function ItemNameToFind($conn,$ItemNameToFind){
    // include("../../../includes/config.php");
    $query = "SELECT * FROM item_generic_names WHERE item_name = '".$ItemNameToFind."' ORDER BY item_name ASC";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $data = mysqli_fetch_all($result,MYSQLI_ASSOC);
        return array(true,$data['item_id']);
    }else {
        return array(false,null);
    }   
}
if (ItemNameToFind($conn,$ItemName)[0]) {
    $item_id=ItemNameToFind($conn,$ItemName)[1];
    // $saveItemGenericName=$conn->query("INSERT INTO item_generic_names SET".$item_generic_names);
    $item = "item_id = '$item_id' ";
        $item .= ", unit_id = '$uom' ";
        $item .= ", description = '$stku' ";
        $item .= ", item_name = '$ItemName' ";
        $item .= ", creator = '1' ";
        $item .= ", uuid  = '$uuid_generic_names' ";
        $saveItemName=$conn->query("INSERT INTO inv_item SET ".$item);
        if ($saveItemName) {
            $logedIn=1;
            $user_id=$item;
            $myUsername=$ItemName;
            $message="Item added Successfully";
            $icon="success";
            $title="Welcome! to Inventory";
        }else {
                $logedIn=0;
                $myUsername=$ItemName;
                $message=mysqli_error($conn);
                $icon="error";
                // $uuid=guidv4();
                $title="Incorect ";
            }
}else {
    $uuid_generic_names=guidv4();
    $item_generic_names = "item_name = '$ItemName' ";
    $item_generic_names .=", description = '$ItemName' ";
    $item_generic_names .=", creator = '1' ";
    $item_generic_names .=", uuid = '$uuid_generic_names' ";
    $saveItemGenericName=$conn->query("INSERT INTO item_generic_names SET ".$item_generic_names);
    $item_id=$conn->insert_id;
    if ($saveItemGenericName) {
        $item = "item_id = '$item_id' ";
        $item .= ", unit_id = '$uom' ";
        $item .= ", description = '$stku' ";
        $item .= ", item_name = '$ItemName' ";
        $item .= ", creator = '1' ";
        $item .= ", uuid  = '$uuid' ";
        $saveItemName=$conn->query("INSERT INTO inv_item SET ".$item);
        if ($saveItemName) {
            $logedIn=1;
            // $user_id=$item;
            $myUsername=$ItemName;
            $message="Item added Successfully";
            $icon="success";
            $title="Welcome! to Inventory";
        }else {
            $logedIn=0;
            $myUsername=$ItemName;
            $message=mysqli_error($conn);
            $icon="error";
            // $uuid=guidv4();
            $title="Incorect ";
        }
    }else {
        $logedIn=0;
        $myUsername=$ItemName;
        $message=mysqli_error($conn);
        $icon="error";
        // $uuid=guidv4();
        $title="Incorect ";
    }
}
$response = array(
    "logedIn"=>$logedIn,
    "myUsername"=>$myUsername,
    "message"=>$message,
    "icon"=>$icon,
    "uuid"=>$uuid,
    "title"=>$title,
    // "user_id"=>$user_id,
    "data"=>$data
);

echo json_encode($response);

?>