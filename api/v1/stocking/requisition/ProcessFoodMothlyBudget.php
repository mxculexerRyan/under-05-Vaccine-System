<?php
include_once("../../uuid/UuidGenerator.php");
include("../../../../includes/config.php");
$data = json_decode(file_get_contents("php://input"));
$data_body=$data;
$ItemName=$data->ItemName;
$UnitsName=$data->UnitsName;
$ItemStockStatus=$data->ItemStockStatus;
$BufferDays=7;
$NoOfPatiet=390;
$ConstantUji=50;
$uuid=guidv4();
function food_budget_number($conn){
    // include("../../../../includes/config.php");
    date_default_timezone_set("Africa/Nairobi");
    $date=date("Y-m-d H:i:sa");
    $number=date('ym',strtotime(date("y-m-d h:i:sa")));
    $_query=mysqli_query($conn,'SELECT ifbn.value as value from inv_food_budjet_number ifbn where source=1 order by ifbn.budjet_number_id desc limit 1')->fetch_array()['value'];
    $values = explode("/",$_query);
    $OnfirstValue=explode(".", $values[0]);
    if ($values[2] >= 999) {
        $new_middle_number=sprintf("%'03d", ($values[1]+1));
        $new_last_number=substr(sprintf("%'03d", ($values[2]+2)),-3);
        if ($OnfirstValue[1] == $number) {
            $new_first_string=$values[0];
        } else {
            $new_first_string="FB.".$number;
        }
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }else{
        $new_middle_number=sprintf("%'03d", ($values[1]));
        $new_last_number=sprintf("%'03d", ($values[2]+1));
        if ($OnfirstValue[1] == $number) {
            $new_first_string=$values[0];
        } else {
            $new_first_string="FB.".$number;
        }
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }
    return $request_number;
}
function MealPerDay($conn,$ItemId){
    $query = "SELECT * FROM item_food_configuration ifdc  INNER JOIN item_food ifd ON ifd.item_food_id=ifdc.item_food AND ifd.inv_item_id='".$ItemId."' WHERE ifdc.configuration_type=3 ";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}
function MealPerWeek($conn,$ItemId){
    $query = "SELECT * FROM item_food_configuration ifdc  INNER JOIN item_food ifd ON ifd.item_food_id=ifdc.item_food AND ifd.inv_item_id='".$ItemId."' WHERE ifdc.configuration_type=4";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}
function AffectedByNumberOfPatient($conn,$ItemId){
    $query = "SELECT * FROM item_food_configuration ifdc  INNER JOIN item_food ifd ON ifd.item_food_id=ifdc.item_food AND ifd.inv_item_id='".$ItemId."' WHERE ifdc.configuration_type=1";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}
function RatioScale($conn,$ItemId){
    $query = "SELECT * FROM item_food_configuration ifdc  INNER JOIN item_food ifd ON ifd.item_food_id=ifdc.item_food AND ifd.inv_item_id='".$ItemId."' WHERE ifdc.configuration_type=2";
    $result = mysqli_query($conn, $query);
    if (mysqli_num_rows($result) >= 1) {
        $row=mysqli_fetch_assoc($result);
        return array(true,$row['value']);
    }else {
        return array(false,null);
    } 
}

$today=date('Y-m-d');

$daysInNextMonth=cal_days_in_month(CAL_GREGORIAN,date('m', strtotime('+1 month', strtotime($today))),date('Y', strtotime('+1 month', strtotime($today))));


$DailConsumption=0;
$DaysForStockToLast=0;
$NoOfdaysRemainToFinishMonth=0;
$inNextMonthSavingDayWithTheCurrentStock=0;
$NumberOfDaysForStockToBeOrderForNextMonth=0;
$OnNextMonthStockOrder=0;
$food_budget_number=food_budget_number($conn);
$saved='';
$creator=1;
// $data = "source_store = '2'";
$data = " number_of_patient = '$NoOfPatiet' ";
$data .= ", creator = '$creator' ";
$data .=", uuid = '$uuid' ";
$save_to_inv_food_budjet=$conn->query("INSERT INTO inv_food_budjet set ".$data);
$food_budjet =$conn->insert_id;
$uuid_source=guidv4();
    $data = "source = '1'";
    $data .= ", food_budget_id = '$food_budjet' ";
    $data .= ", value = '$food_budget_number' ";
    $data .= ", creator = '$creator' ";
    $data .= ", uuid = '$uuid_source' ";
    $save_inv_food_budjet_number=$conn->query("INSERT INTO inv_food_budjet_number set ".$data);
foreach($ItemName as $k =>$v):
    $HasMealPerDay=MealPerDay($conn,$ItemName[$k])[1];
    $HasMealPerWeek=MealPerWeek($conn,$ItemName[$k])[1];
    $IsAffectedByNumberOfPatient=AffectedByNumberOfPatient($conn,$ItemName[$k])[1];
    $ItsRatioScale=RatioScale($conn,$ItemName[$k])[1];
    if (AffectedByNumberOfPatient($conn,$ItemName[$k])[0]) { 
       if (MealPerDay($conn,$ItemName[$k])[0]) {
        $DailConsumption=number_format((($ItsRatioScale*$NoOfPatiet*$HasMealPerDay)+$ConstantUji),2);
        $DaysForStockToLast=($ItemStockStatus[$k])/($DailConsumption);
        $DaysInMonth=cal_days_in_month(CAL_GREGORIAN,date("m"),date("Y"));
        $TodayCount=date("d");
        $NoOfdaysRemainToFinishMonth=$DaysInMonth-$TodayCount;
        $inNextMonthSavingDayWithTheCurrentStock=($DaysForStockToLast-$NoOfdaysRemainToFinishMonth);
        $NumberOfDaysForStockToBeOrderForNextMonth=($daysInNextMonth)-($inNextMonthSavingDayWithTheCurrentStock);
        $OnNextMonthStockOrder=($DailConsumption*($NumberOfDaysForStockToBeOrderForNextMonth+$BufferDays));
       }
       if (MealPerWeek($conn,$ItemName[$k])[0]) {
        $DailConsumption=number_format((($ItsRatioScale*$NoOfPatiet*$HasMealPerWeek)),2);
        $DaysForStockToLast=($ItemStockStatus[$k])/($DailConsumption);
        $DaysInMonth=cal_days_in_month(CAL_GREGORIAN,date("m"),date("Y"));
        $TodayCount=date("d");
        $NoOfdaysRemainToFinishMonth=($DaysInMonth-$TodayCount)/7;
        $inNextMonthSavingDayWithTheCurrentStock=($DaysForStockToLast-$NoOfdaysRemainToFinishMonth);
        $NumberOfDaysForStockToBeOrderForNextMonth=(($daysInNextMonth)/7)-($inNextMonthSavingDayWithTheCurrentStock);
        $OnNextMonthStockOrder=($DailConsumption*($NumberOfDaysForStockToBeOrderForNextMonth+1));
    }
    }if (AffectedByNumberOfPatient($conn,$ItemName[$k])[0] == false) {
        $DailConsumption=number_format((($ItsRatioScale*$HasMealPerDay)),2);
        $DaysForStockToLast=($ItemStockStatus[$k])/($DailConsumption);
        $DaysInMonth=cal_days_in_month(CAL_GREGORIAN,date("m"),date("Y"));
        $TodayCount=date("d");
        $NoOfdaysRemainToFinishMonth=$DaysInMonth-$TodayCount;
        $inNextMonthSavingDayWithTheCurrentStock=($DaysForStockToLast-$NoOfdaysRemainToFinishMonth);
        $NumberOfDaysForStockToBeOrderForNextMonth=($daysInNextMonth)-($inNextMonthSavingDayWithTheCurrentStock);
        $OnNextMonthStockOrder=($DailConsumption*($NumberOfDaysForStockToBeOrderForNextMonth+$BufferDays));
    }
    $uuid_item=guidv4();
    $data = " food_budjet = '$food_budjet' ";
    $data .= ", inv_item = '$ItemName[$k]' ";
    $data .= ", current_stock = '$ItemStockStatus[$k]' ";

    $data .= ", daily_consumption = '$DailConsumption' ";
    $data .= ", stock_over_consumption = '$DaysForStockToLast' ";
    $data .= ", saving_next_month = '$inNextMonthSavingDayWithTheCurrentStock' ";
    $data .= ", stock_to_order = '$OnNextMonthStockOrder' ";
    $data .= ", creator = '$creator' ";
    $data .= ", uuid = '$uuid_item' ";
    $save_inv_food_budjet_item=$conn->query("INSERT INTO inv_food_budjet_item  set ".$data);
    // if (MealPerDay($conn,$ItemName[$k])[0]) {
    //     $DailConsumption[$k]=number_format((($ItsRatioScale*$NoOfPatiet*$HasMealPerDay)+$ConstantUji),2);
    //     $DaysForStockToLast[$k]=($ItemStockStatus[$k])/($DailConsumption[$k]);
    //     $DaysInMonth=cal_days_in_month(CAL_GREGORIAN,date("m"),date("Y"));
    //     $TodayCount=date("d");
    //     $NoOfdaysRemainToFinishMonth=$DaysInMonth-$TodayCount;
    //     $inNextMonthSavingDayWithTheCurrentStock[$k]=($DaysForStockToLast[$k]-$NoOfdaysRemainToFinishMonth);
    //     $NumberOfDaysForStockToBeOrderForNextMonth[$k]=($daysInNextMonth)-($inNextMonthSavingDayWithTheCurrentStock[$k]);
    //     $OnNextMonthStockOrder[$k]=($DailConsumption*($NumberOfDaysForStockToBeOrderForNextMonth[$k]+$BufferDays));
    //    }
endforeach;
if ($save_inv_food_budjet_item) {
    $saved="saved with food_budget_id=".$food_budjet;
    $SavedSuccessfully=1;
        $user_id=$food_budget_number;
        // $myUsername=$ItemName;
        $message="Order Processed Successfully";
        $icon="success";
        $title="Welcome! to Inventory";
    $response=array(
        "NumberOfDaysForStockToBeOrderForNextMonth"=>$NumberOfDaysForStockToBeOrderForNextMonth,
        "inNextMonthSavingDayWithTheCurrentStock"=>$inNextMonthSavingDayWithTheCurrentStock,
        "NoOfdaysRemainToFinishMonth"=>$NoOfdaysRemainToFinishMonth,
        "AffectedByNumberOfPatient"=>$IsAffectedByNumberOfPatient,
        "OnNextMonthStockOrder"=>$OnNextMonthStockOrder,
        "DaysForStockToLast"=>$DaysForStockToLast,
        "food_budget_number"=>$food_budget_number,
        "DailConsumption"=>$DailConsumption,
        "daysInNextMonth"=>$daysInNextMonth,
        "MealPerWeek"=>$HasMealPerWeek,
        "RatioScale"=>$ItsRatioScale,
        "MealPerDay"=>$HasMealPerDay,
        "ConstantUji"=>$ConstantUji,
        "NoOfPatiet"=>$NoOfPatiet,
        "BufferDays"=>$BufferDays,
        "saved"=>$saved,
        "IsSaved"=>1,
        "SavedSuccessfully"=>$SavedSuccessfully,
        "message"=>$message,
        "user_id"=>$user_id,
        "icon"=>$icon,
        "uuid"=>$uuid,
        "title"=>$title,
        "uuid_budget"=>$uuid,
        "uuid_source"=>$uuid_source,
        "data"=>$data_body 
    );
}else {
    $saved=mysqli_errno($conn);
    $SavedSuccessfully=0;
    // $user_id=[];
    // $myUsername=$ItemName;
    $message=mysqli_error($conn);
    $icon="error";
    $title="Incorect ";
    $response = array(
    "error"=> $saved,
    "SavedSuccessfully"=>$SavedSuccessfully,
    "message"=>$message,
    "user_id"=>$user_id,
    "icon"=>$icon,
    "uuid"=>$uuid,
    "title"=>$title,
    "data"=>$data_body);
}

echo json_encode($response);

?>