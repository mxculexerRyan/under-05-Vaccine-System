<?php
include_once("../uuid/UuidGenerator.php");
include_once("../../../includes/config.php");
$data = json_decode(file_get_contents("php://input"));
// echo json_encode($data); 
$username=$data->UserName;
$password=$data->password;
$firstname=$data->FirstName;
$middleName=$data->MiddleName;
$lastname=$data->LastName;
$dob=date('Y-m-d H:i:s',strtotime($data->dob));
$Gender=$data->Gender;
$email=$data->EmailId;
$mobile=$data->MobileNo;
$uuid=guidv4();
$profile =" id =''";
$profile .= ", first_name = '$firstname' ";
$profile .= ", middle_name = '$middleName' ";
$profile .= ", last_name = '$lastname' ";
$profile .= ", dob = '$dob' ";
$profile .= ", gender = '$Gender' ";
$profile .= ", user_emails = '$email' ";
$profile .= ", phone_no = '$mobile' ";
$profile .= ", creator = '1' ";
$profile .= ", uuid = '$uuid' ";

$save_profile = $conn->query("INSERT INTO user_profiles set ".$profile);
$save_profile_id=$conn->insert_id;
if ($save_profile) {
    $user = " profiles_id = '$save_profile_id' ";
    $user .= ", username = '$username' ";
    $user .= ", password = '$password' ";
    $user .= ", creator = '1' ";
    $user .= ", uuid = '$uuid' ";
    $save_user = $conn->query("INSERT INTO users set ".$user);
    $user_id=$conn->insert_id;
}
if ($save_user) {
    $logedIn=$save_profile_id;
    $user_id=$user_id;
    $myUsername=$username;
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