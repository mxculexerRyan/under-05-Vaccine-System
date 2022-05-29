<?php
include_once("../../../includes/config.php");
$qry=$conn->query("SELECT * FROM inv_store i INNER JOIN users u on i.creator=u.user_id INNER JOIN user_profiles up on up.id=u.profiles_id");
while ($row=$qry->fetch_assoc()) {
    $stores[]=$row;
}
echo json_encode(array("stores"=>$stores));
?>