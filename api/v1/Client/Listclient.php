<?php
include_once("../../../includes/config.php");
$qry=$conn->query("SELECT * FROM users u INNER join user_profiles  up ON up.id=u.profiles_id LEFT JOIN gender g on g.gender_id=up.gender");
while ($row=$qry->fetch_assoc()) {
    $client[]=$row;
}
echo json_encode(array("client"=>$client));
?>