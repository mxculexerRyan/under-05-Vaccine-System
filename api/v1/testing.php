<?php
function guidv4($data = null) {
    // Generate 16 bytes (128 bits) of random data or use the data passed into the function.
    $data = $data ?? random_bytes(16);
    assert(strlen($data) == 16);

    // Set version to 0100
    $data[6] = chr(ord($data[6]) & 0x0f | 0x40);
    // Set bits 6-7 to 10
    $data[8] = chr(ord($data[8]) & 0x3f | 0x80);

    // Output the 36 character UUID.
    return vsprintf('%s%s-%s-%s-%s-%s%s%s', str_split(bin2hex($data), 4));
}
echo guidv4();
// echo "</br>";
// echo date("Y")." &" .date("m"). "/".date("d");
// $days=cal_days_in_month(CAL_GREGORIAN,date("m"),date("Y"));
// $d=date("d");
// $today=date('Y-m-d');
// $different=$days-$d;
// $date = date('Y-m-d', strtotime('+1 month', strtotime($today)));
// $daysInNextMonth=cal_days_in_month(CAL_GREGORIAN,date('m', strtotime('+1 month', strtotime($today))),date('Y', strtotime('+1 month', strtotime($today))));
// echo "There was $d days in ".date("m")."  ".date("Y")." and different is ".$different."\n".$date."\n".$daysInNextMonth;
// function sale_invoice_number(){
//     include 'db_connect.php';
//     $_query=mysqli_query($conn,'SELECT sl.sales_invoice_number from sales_list sl  order by sl.id desc limit 1')->fetch_array()['sales_invoice_number'];
//     $values = explode("-",$_query);
//     date_default_timezone_set("Africa/Nairobi");
//     $date=date("Y-m-d H:i:sa");
//     $number=date('Ymd',strtotime(date("y-m-d h:i:sa")));
//     if ( $values[0] == $number) {
//         $new_first_string=$values[0];
//         $new_last_number=sprintf("%'04d", ($values[1]+1));
//         $sale_invoice_number=$new_first_string.'-'.$new_last_number;
//     }else {
//         $new_first_string=$number;
//         $new_last_number=substr(sprintf("%'04d",(9999 +2)),-4);
//         $sale_invoice_number=$new_first_string.'-'.$new_last_number;
//     }
//     return $sale_invoice_number;
// }
function food_budget_number(){
    include("../../includes/config.php");
    date_default_timezone_set("Africa/Nairobi");
    $date=date("Y-m-d H:i:sa");
    $number=date('ym',strtotime(date("y-m-d h:i:sa")));
    $_query=mysqli_query($conn,'SELECT ifbn.value as value from inv_food_budjet_number ifbn where source=1 order by ifbn.budjet_number_id desc limit 1')->fetch_array()['value'];
    $values = explode("/",$_query);
    $OnfirstValue=explode(".", $values[0]);
    if ($values[2] >= 999) {
        $new_middle_number=sprintf("%'03d", ($values[1]+1));
        $new_last_number=substr(sprintf("%'03d", ($values[2]+2)),-3);
        // $new_first_string=$values[0];
        if ($OnfirstValue[1] == $number) {
            $new_first_string=$values[0];
        } else {
            $new_first_string="FB.".$number;
        }
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }else{
        $new_middle_number=sprintf("%'03d", ($values[1]));
        $new_last_number=sprintf("%'03d", ($values[2]+1));
        // $new_first_string=$values[0];
        if ($OnfirstValue[1] == $number) {
            $new_first_string=$values[0];
        } else {
            $new_first_string="FB.".$number;
        }
        $request_number=$new_first_string.'/'.$new_middle_number.'/'.$new_last_number;
    }
    return $request_number;
}
$mydate=date('Y-m-d');
echo "\n";
echo "\n";
echo "\n"."budget number \t".food_budget_number();
echo "\n".date('l',strtotime($mydate));

?>