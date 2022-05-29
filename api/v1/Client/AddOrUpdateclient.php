<?php
include_once("../uuid/UuidGenerator.php");
include_once("../../../includes/config.php");
$data = json_decode(file_get_contents("php://input"));
// echo json_encode($data); 
$birth_facilitator=$data->BirthFacilitator;
$birth_place=$data->BirthPlace;
$$birth_no=$data->$BithCertificateNo;
$firstname=$data->FirstName;
$middleName=$data->MiddleName;
$lastname=$data->LastName;
$dob=date('Y-m-d H:i:s',strtotime($data->dob));
$Gender=$data->Gender;
$Mtaa=$data->Mtaa;
$Kijiji=$data->Kijiji;
$Kitongoji=$data->Kitongoji;

$FullName=$data->FullName;
$Email=$data->Email;
$Phoneno=$data->Phoneno;
$relationship=$data->relationship;

$uuid=guidv4();
$client =" client_id =''";
$client .= ", first_name = '$firstname' ";
$client .= ", middle_name = '$middleName' ";
$client .= ", last_name = '$lastname' ";
$client .= ", dob = '$dob' ";
$client .= ", gender = '$Gender' ";
$client .= ", birth_no = '$birth_no' ";
$client .= ", birth_place = '$birth_place' ";
$client .= ", birth_facilitator = '$birth_facilitator' ";
$client .= ", creator = '1' ";
$client .= ", uuid = '$uuid' ";


$save_client = $conn->query("INSERT INTO client set ".$client);
$saved_client_id=$conn->insert_id;

if ($save_client) {
    $location = " location_id = '' ";
$location .= ", client = '$saved_client_id' ";
$location .= ", mtaa = '$Mtaa' ";
$location .= ", kijiji = '$Kijiji' ";
$location .= ", kitongoji = '$Kitongoji' ";
$location .= ", creator = '1' ";
$location .= ", uuid = '$uuid' ";

$save_client_location = $conn->query("INSERT INTO client_location set ".$location);
}

if ($save_client_location) {
    foreach($FullName as $k => $v):
        $uuid=guidv4();
        $parent = " parent_id = '' ";
        $parent .= ", full_name = '$FullName[$k]' ";
        $parent .= ", phone_no = '$Phoneno[$k]' ";
        $parent .= ", email = '$Email[$k]' ";
        $parent .= ", creator = '1' ";
        $parent .= ", uuid = '$uuid' ";
        $save_parent = $conn->query("INSERT INTO parent set ".$parent);
        $parent_id=$conn->insert_id;
        if ($save_parent) {
            $client_parent = " client_parent_id = '' ";
            $client_parent .= ", client = '$saved_client_id' " ;
            $client_parent .= ", parent = '$parent_id' " ;
            $client_parent .= ", relation  = '$relationship[$k]' " ;
            $client_parent .= ",  uuid = '$uuid' " ;
            $save_client_parent=$conn->query("INSERT INTO client_parent set ".$client_parent);
        }
endforeach;
}
if ($save_user) {
    $logedIn=$saved_client_id;
    $user_id=$parent_id;
    $myUsername=$FullName;
    $message="Added Successfully";
    $icon="success";
    $title="Welcome! to Inventory";
}else {
    $logedIn=$save_profile_id;
    $myUsername=$username;
    $message=mysqli_error($conn);
    $icon="error";
    // $uuid=guidv4();
    $title="Incorect Username or Password";
}
$response = array(
    "logedIn"=>$logedIn,
    "myUsername"=>$myUsername,
    "message"=>$message,
    "icon"=>$icon,
    "uuid"=>$uuid,
    "title"=>$title,
    "user_id"=>$user_id,
    "data"=>$data
);

echo json_encode($response);
?>
