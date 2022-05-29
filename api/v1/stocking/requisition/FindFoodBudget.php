<?php
include("../../../../includes/config.php");
function getBudgetItem($conn , $uuid){ 
    $query_budget_id=mysqli_query($conn,"SELECT ifb.* FROM inv_food_budjet ifb WHERE ifb.uuid='".$uuid."'");
    
    while ($row = mysqli_fetch_assoc($query_budget_id)) {
        $food_budjet[]=$row;
        $food_budjet_id=$row['food_budjet_id'];
    }
    // $food_budjet_id=['food_budjet_id'];
    $query_budget_number=$conn->query("SELECT ifbn.* from inv_food_budjet_number ifbn WHERE ifbn.food_budget_id=".$food_budjet_id);
    while ($row=mysqli_fetch_assoc($query_budget_number)) {
        $query_budget_number_data[]=$row;
    }
    $query_budget_item=$conn->query("SELECT ifbi.*,concat(ifnull(up.first_name,''), ' ' ,ifnull(up.middle_name,''),' ',ifnull(up.last_name,'')) as item_creator,ii.inv_item_id item_inv_item_id,ii.item_id item_item_id,ii.unit_id item_unit_id,ii.item_name item_item_name,ii.description item_description,ii.date_created item_date_created,ii.uuid item_uuid,uom.unit_name from inv_food_budjet_item ifbi INNER JOIN inv_item ii ON ifbi.inv_item=ii.inv_item_id INNER JOIN units_of_measure uom ON uom.unit_id=ii.unit_id INNER JOIN users u ON u.user_id=ifbi.creator INNER JOIN user_profiles up on up.id=u.profiles_id WHERE ifbi.food_budjet=".$food_budjet_id);
    while ($row=mysqli_fetch_assoc($query_budget_item)) {
        $query_budget_item_data[]=$row;
    }
    
    $query_budget_item_data=array("query_budget_item_data"=>$query_budget_item_data);
    $food_budjet=array("food_budjet"=>$food_budjet);
    $query_budget_number_data=array("query_budget_number_data"=>$query_budget_number_data);
    $mana=[];
    $mana=array_merge($query_budget_number_data,$query_budget_item_data,$food_budjet);
    $data=array(
        "data"=>$mana
    );
    return $data; 
   }
  $response = getBudgetItem($conn,$_GET['uuid']);
    echo json_encode($response);
   
?>