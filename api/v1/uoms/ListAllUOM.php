<?php
include_once("../../../includes/config.php");
$qry=$conn->query("SELECT * FROM units_of_measure uom INNER JOIN users u on uom.creator=u.user_id INNER JOIN user_profiles up on up.id=u.profiles_id");
while ($row=$qry->fetch_assoc()) {
    $uom[]=$row;
}
echo json_encode(array("uom"=>$uom));
?>