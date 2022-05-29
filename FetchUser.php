<?php
include_once("../../../includes/config.php");
$data = json_decode(file_get_contents("php://input"));
// echo json_encode($data); 
$username=$data->username;
$password=$data->password;
$lo = "u.username = '$username'";
$lo .= " AND u.password = '$password'";
$login=$conn->prepare("SELECT * FROM users u INNER join user_profiles  up ON up.id=u.profiles_id WHERE u.username = ? AND u.password = ?");
$login->bind_param("ss", $username, $password);
$login->execute();
$row = $login->get_result()->fetch_all(MYSQLI_ASSOC);
if (!$row) {
    $logedIn=0;
    $users[]="";
    $message="UnSuccessfully";
    $icon="error";
    $title="Incorect Username or Password";
    
}else {
    $_SESSION['user']=$row;
    $UserSession=$_SESSION['user'];
    $logedIn=1;
    $users[]=$row;
    $message="Loged in Successfully";
    $icon="success";
    $title="Welcome! to uvmis";
}
$response = array(
    "logedIn"=>$logedIn,
    "users"=>$users,
    "myUsername"=>$username,
    "message"=>$message,
    "icon"=>$icon,
    "title"=>$title
);

echo json_encode($response);

?>