<?php
function food_budget_number($conn){
    date_default_timezone_set("Africa/Nairobi");
    $date=date("Y-m-d H:i:sa");
    $number=date('ym',strtotime(date("y-m-d h:i:sa")));
    $_query=mysqli_query($conn,'SELECT ivn.value as value from inv_voucher_number ivn where source=1 order by ivn.voucher_number_id desc limit 1')->fetch_array()['value'];
   if ($_query) {
    $values = explode("/",$_query);
    $OnfirstValue=explode(".", $values[0]);
    if ($values[2] >= 999) {
        $new_middle_number=sprintf("%'03d", ($values[1]+1));
        $new_last_number=substr(sprintf("%'03d", ($values[2]+2)),-3);
        if ($OnfirstValue[1] == $number) {
            $new_first_string=$values[0];
        } else {
            $new_first_string="VC.".$number;
        }
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }else{
        $new_middle_number=sprintf("%'03d", ($values[1]));
        $new_last_number=sprintf("%'03d", ($values[2]+1));
        if ($OnfirstValue[1] == $number) {
            $new_first_string=$values[0];
        } else {
            $new_first_string="VC.".$number;
        }
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }
   }else{
    $new_first_string="VC.".$number;
    $new_middle_number=substr(sprintf("%'03d", (99999+2)),-3);
    $new_last_number=substr(sprintf("%'03d", (99999+2)),-3);
    $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;

   }
    return $request_number;
}
function request_number($conn){
    // include("../../../../includes/config.php");
    date_default_timezone_set("Africa/Nairobi");
    $date=date("Y-m-d H:i:sa");
    $number=date('ym',strtotime(date("y-m-d h:i:sa")));
    $_query=mysqli_query($conn,'SELECT irn.value as value from inv_request_number irn where source=1 order by irn.request_number_id desc limit 1')->fetch_array()['value'];
    if($_query){
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
    }else{
    $new_first_string="RQ.".$number;
    $new_middle_number=substr(sprintf("%'03d", (99999+2)),-3);
    $new_last_number=substr(sprintf("%'03d", (99999+2)),-3);
    $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }
    return $request_number;
}

function IsIssued($conn,$weedDayFoodID){
    $query = "SELECT * FROM week_day_configuration wdc INNER JOIN week_day_food wdf ON wdc.week_day_food=wdf.day_food_id AND wdf.day_food_id='".$weedDayFoodID."' WHERE wdc.day_configuration_type=1";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}
function NumberOfMeals($conn,$weedDayFoodID){
    $query = "SELECT * FROM week_day_configuration wdc INNER JOIN week_day_food wdf ON wdc.week_day_food=wdf.day_food_id AND wdf.day_food_id='".$weedDayFoodID."' WHERE wdc.day_configuration_type=2";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}
function FoodDayRatio($conn,$weedDayFoodID){
    $query = "SELECT * FROM week_day_configuration wdc INNER JOIN week_day_food wdf ON wdc.week_day_food=wdf.day_food_id AND wdf.day_food_id='".$weedDayFoodID."' WHERE wdc.day_configuration_type=3";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}
function AffectedByBedState($conn,$weedDayFoodID){
    $query = "SELECT * FROM week_day_configuration wdc INNER JOIN week_day_food wdf ON wdc.week_day_food=wdf.day_food_id AND wdf.day_food_id='".$weedDayFoodID."' WHERE wdc.day_configuration_type=4";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}

function InvItem($conn,$itemFood){
    # code..SELECT iff.inv_item_id FROM week_day_food wdf INNER JOIN item_food iff ON wdf.item_food=iff.item_food_id and iff.item_food_id=3
    $query = "SELECT iff.inv_item_id FROM week_day_food wdf INNER JOIN item_food iff ON wdf.item_food=iff.item_food_id and iff.item_food_id='".$itemFood."'";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['inv_item_id']);
    }else {
        return array(false,null);
    } 
}

?>