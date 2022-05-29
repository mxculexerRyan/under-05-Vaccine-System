
<?php
// function upload_receiving(){
//     // Load the database configuration file
//     include 'db_connect.php';
//     // print_r($_POST);
//     $qstring=0;
//     if(isset($_POST['import'])){
//         $qstring=0;
//         // Allowed mime types
//         $csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
    
//         // Validate whether selected file is a CSV file
//         if(!empty($_FILES['csv_file_to_Upload']['name']) && in_array($_FILES['csv_file_to_Upload']['type'], $csvMimes)){
    
//             // If the file is uploaded
//             if(is_uploaded_file($_FILES['csv_file_to_Upload']['tmp_name'])){
    
//                 // Open uploaded CSV file with read-only mode
//                 $csvFile = fopen($_FILES['csv_file_to_Upload']['tmp_name'], 'r');
    
//                 // Skip the first line
//                 fgetcsv($csvFile);
    
//                 // Parse data from CSV file line by line
//                 while(($line = fgetcsv($csvFile)) !== FALSE){
//                     // Get row data
//                     $name = $line[0];
//                     $email = $line[1];
//                     $phone = $line[2];
//                     $status = $line[3];

//                     // Check whether member already exists in the database with the same email
//                     $prevQuery = "SELECT id FROM members WHERE email = '".$line[1]."'";
//                     $prevResult = mysqli_query($conn,$prevQuery);

//                     if(mysqli_num_rows($prevResult) > 0){
                        
//                         // Update member data in the database
//                         mysqli_query($conn,"UPDATE members SET name = '".$name."', phone = '".$phone."', status = '".$status."', modified = NOW() WHERE email = '".$email."'");
//                     }else{

//                         // Insert member data in the database
//                         $myy=mysqli_query($conn,"INSERT INTO members (name, email, phone, created, modified, status) VALUES ('".$name."', '".$email."', '".$phone."', NOW(), NOW(), '".$status."')");
//                     }
//                 }
    
//                 // Close opened CSV file
//                 fclose($csvFile);
                
//                 if($myy){

//                     $qstring = 1;
//                 }
//             }else{

//                 $qstring = 2;
//             }
//         }else{

//             $qstring = 3;
//         }
//     }
// return $qstring;
// }
// // echo mysqli_error($conn);
// upload_receiving();
// // Redirect to the listing page
//     include_once("db_connect.php");
//     if(isset($_POST['import_data'])){    
//         // validate to check uploaded file is a valid csv file
//         $file_mimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');
//         if(!empty($_FILES['file']['name']) && in_array($_FILES['file']['type'],$file_mimes)){
//             if(is_uploaded_file($_FILES['file']['tmp_name'])){   
//                 $csv_file = fopen($_FILES['file']['tmp_name'], 'r');           
//                 //fgetcsv($csv_file);            
//                 // get data records from csv file
//                 while(($emp_record = fgetcsv($csv_file)) !== FALSE){
//                     // Check if employee already exists with same email
//                     $sql_query = "SELECT emp_id, emp_name, emp_salary, emp_age FROM emp WHERE emp_email = '".$emp_record[2]."'";
//                     $resultset = mysqli_query($conn, $sql_query) or die("database error:". mysqli_error($conn));
//                     // if employee already exist then update details otherwise insert new record
//                     if(mysqli_num_rows($resultset)) {                     
//                         $sql_update = "UPDATE emp set emp_name='".$emp_record[1]."', emp_salary='".$emp_record[3]."', emp_age='".$emp_record[4]."' WHERE emp_email = '".$emp_record[2]."'";
//                         mysqli_query($conn, $sql_update) or die("database error:". mysqli_error($conn));
//                     } else{
//                         $mysql_insert = "INSERT INTO emp (emp_name, emp_email, emp_salary, emp_age )VALUES('".$emp_record[1]."', '".$emp_record[2]."', '".$emp_record[3]."', '".$emp_record[4]."')";
//                         mysqli_query($conn, $mysql_insert) or die("database error:". mysqli_error($conn));
//                     }
//                 }            
//                 fclose($csv_file);
//                 $import_status = '?import_status=success';
//             } else {
//                 $import_status = '?import_status=error';
//             }
//         } else {
//             $import_status = '?import_status=invalid_file';
//         }
//     }
//     echo $import_status;



// // include 'db_connect.php';
$ref_no = sprintf("%'08d\n", $ref_no);
$i = 1;

while($i == 1){
    $chk = $this->db->query("SELECT * FROM receiving_list where ref_no ='$ref_no'")->num_rows;
    if($chk > 0){
        $ref_no = mt_rand(1,99999999);
        $ref_no = sprintf("%'.08d\n", $ref_no);
    }else{
        $i=0;
    }
}
$data .= ", ref_no = '$ref_no' ";
$save = $this->db->query("INSERT INTO receiving_list set ".$data);
$id =$this->db->insert_id;
$creator=$_SESSION['login_id'];
function check_item_available_quantity_by_batch($product_id,$batch_no){
    include 'db_connect.php';
    $inn = mysqli_query($conn,"SELECT sum(qty) as inn FROM inventory where type = 1 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
    $inn = $inn && $inn->num_rows > 0 ? $inn->fetch_array()['inn'] : 0;
    $out = mysqli_query($conn,"SELECT sum(qty) as `out` FROM inventory where type = 2 and product_id = '".$product_id."' and batch_no = '".$batch_no."'");
    $out = $out && $out->num_rows > 0 ? $out->fetch_array()['out'] : 0;
    $ex = mysqli_query($conn,"SELECT sum(qty) as ex FROM expired_product where product_id = '".$product_id."' and batch_no = '".$batch_no."'");
    $ex = $ex && $ex->num_rows > 0 ? $ex->fetch_array()['ex'] : 0;
    $available_by_batch = $inn - $out - $ex;
    
    return $available_by_batch;
}
foreach($product_id as $k => $v){
    $kk=$product_id[$k];
    $data = " form_id = '$id' ";
    $data .= ", product_id = '$product_id[$k]' ";
    $data .= ", item_units_id = '$units[$k]' ";
    $data .=", batch_no = '$batch_no[$k]' ";
    $data .= ", qty = '$qty[$k]' ";
    $data .= ", price = '$bprice[$k]' ";
    $data .= ", expiry_date = '$expiry_date[$k]' ";
    $data .= ", type = '1' ";
    $data .= ", stock_from = 'receiving' ";
    $details = json_encode(array('price'=>$bprice[$k],'qty'=>$qty[$k]));
    // $data .= ", other_details = '$details' ";
    $data .= ", remarks = 'Stock from Receiving-".$ref_no."' ";
    
    $prod =" price = '$sprice[$k]' ";
    $prod .=" ,wholesale_price = '$wprice[$k]' ";

    date_default_timezone_set("Africa/Nairobi");
    $date=date("y-m-d h:i:sa");

    $update =" voided= '1' ";
    $update .=", voided_by = '$creator' ";
    $update .=", voided_date = '$date' ";

    $price =" product_id = '$product_id[$k]' ";
    $price .=", price_list_selling_price = '$sprice[$k]' ";
    $price .=", price_list_buying_pice = '$bprice[$k]' ";
    $price .=", price_list_wholesale_price = '$wprice[$k]' ";
    $price .=", creator = '$creator' ";

    $saveUpdate=$this->db->query("UPDATE price_list set ".$update." where product_id =".$kk);
    $save=$this->db->query("UPDATE product_list set ".$prod." where id =".$kk);

    $save1=$this->db->query("INSERT INTO price_list set".$price);
    $on_batch_available=check_item_available_quantity_by_batch($product_id[$k],$batch_no[$k]);
    $save2[]= $this->db->query("INSERT INTO inventory set ".$data);
    $inventory_id=$this->db->insert_id;
    $batch =" product_by_batch_id = '' ";
    $batch .=", product_id = '$product_id[$k]' ";
    $batch .=", batch_no = '$batch_no[$k]' ";
    $batch .=", qty = '$qty[$k]' ";
    $batch .=", inventory_id = '$inventory_id' ";
    $batch .=", expiredate = '$expiry_date[$k]' ";
    $batch .=", batch_preference = '0'";
    $batch .=", creator = '$creator' ";
    // $batch .=" date_created = '' ";
    $save4[]=$this->db->query("INSERT INTO product_by_batch set".$batch);
    $triggerphph1="UPDATE `product_by_batch` SET batch_preference=0 WHERE product_id='".$product_id[$k]."'AND transaction_type_id=1 AND expired_confirmed=0";
    $save5=$this->db->query($triggerphph1);
    $triggerphph="UPDATE `product_by_batch` SET batch_preference=1 WHERE product_id='".$product_id[$k]."' AND expired_confirmed=0 AND transaction_type_id=1 AND expiredate=(SELECT MIN(date(expiredate)) FROM product_by_batch)";
    $save7=$this->db->query($triggerphph);
    $on_hand_by_batch =" product_on_hand_by_batch_id = '' ";
    $on_hand_by_batch .=", product_id = '$product_id[$k]' ";
    $on_hand_by_batch .=", batch_no = '$batch_no[$k]' ";
    $on_hand_by_batch .=", qty_before = '$on_batch_available' ";
    $on_hand_by_batch .=", qty_consumed = '$qty[$k]' ";
    $after_batch=$on_batch_available+$qty[$k];
    $on_hand_by_batch .=", qty_after = '$after_batch' ";
    // $on_hand_by_batch .=", inventory_id = '' ";
    $on_hand_by_batch .=", transaction_type = '1' "; 
    $on_hand_by_batch .=", creator = '$creator' ";
    $save6=$this->db->query("INSERT INTO product_on_hand_by_batch SET".$on_hand_by_batch);
}
if($save2){
    if ($save4) {
        return 1;
    }
}

