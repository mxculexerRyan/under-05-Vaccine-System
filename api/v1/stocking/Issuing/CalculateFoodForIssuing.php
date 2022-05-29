<?php
include_once("../../uuid/UuidGenerator.php");
include("../../../../includes/config.php");
include("Function.php");
$data = json_decode(file_get_contents("php://input"));
$data_body = $data;
$Issuing_point = $data->Issuing_point;
$bedstate = $data->bedstate;
$mydate = date('Y-m-d');
$creator = 1;
$Buffer_Qty = 50;
$uuid_request = guidv4();
$dateDay = date('l', strtotime($mydate));
// $weekDayId = $conn->query('SELECT * FROM week_day wd WHERE wd.name=' . $dateDay)->fetch_array()['week_day_id'];
$weedDayFood = $conn->query('select * from week_day_food wdf inner  join item_food if2 on wdf.item_food = if2.item_food_id inner  join week_day wd on wdf.week_day = wd.week_day_id inner join inv_item ii on if2.inv_item_id = ii.inv_item_id where wd.name="' . $dateDay . '"');
if ($weedDayFood) {
    $data = "source_store= '$Issuing_point'  ";
    $data .= ", destination_store = '1'";
    $data .= ", creator = '$creator' ";
    $data .= ", uuid = '$uuid_request' ";
    $save_virtual_request_food = $conn->query("INSERT INTO inv_request set " . $data);
    $virtual_request_id = $conn->insert_id;
    while ($row = $weedDayFood->fetch_assoc()) {

        if (IsIssued($conn, $row['day_food_id'])[0]) {
            $uuid_item = guidv4();
            $inv_item_id = $row['inv_item_id'];
            $NumberOfMeals = NumberOfMeals($conn, $row['day_food_id'])[1];
            $FoodDayRatio = FoodDayRatio($conn, $row['day_food_id'])[1];
            $isIssued = IsIssued($conn, $row['day_food_id'])[0];
            $AffectedByBedState = AffectedByBedState($conn, $row['day_food_id'])[0];
            $inv_item_food_id = InvItem($conn, $row['item_food'])[1];
            if (AffectedByBedState($conn, $row['day_food_id'])[0]) {
                if ($row['item_name'] == "UNGA") {
                    $qty = ($bedstate * $FoodDayRatio * $NumberOfMeals) + ($Buffer_Qty);
                } else {
                    $qty = $bedstate * $FoodDayRatio * $NumberOfMeals;
                }
            } else {
                $qty = $FoodDayRatio * $NumberOfMeals;
            }
            $data = " request_item_id = '' ";
            $data .= ", request = '$virtual_request_id' ";
            $data .= ", item_id = '" . $row['inv_item_id'] . "' ";
            $data .= ", description = '' ";
            $data .= ", item_units_id = '" . $row['unit_id'] . "' ";
            $data .= ", quantity = '$qty' ";
            $data .= ", equivalent_quantity = '$qty' ";
            $data .= ", creator = '$creator' ";
            $data .= ", uuid = '$uuid_item' ";
            $save_inv_request_item = $conn->query("INSERT INTO inv_request_item  set " . $data);
            
        }
    }
}
echo json_encode($data_body);
echo "\n" . food_budget_number($conn);
