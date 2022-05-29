<?php
include_once("../../../includes/config.php");
function getItem($conn , $term){ 
    $query = "SELECT * FROM item_generic_names WHERE item_name LIKE '%".$term."%' ORDER BY item_name ASC";
    $result = mysqli_query($conn, $query); 
    $data = mysqli_fetch_all($result,MYSQLI_ASSOC);
    return $data; 
   }
   if (isset($_GET['term'])) {
    $getItem = getItem($conn, $_GET['term']);
    $itemList = array();
    foreach($getItem as $item){
    $itemList[] = $item['item_name'];
    }
    echo json_encode($itemList);
   }
?>