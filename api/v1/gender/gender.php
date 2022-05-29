<?php
include_once("../../../includes/config.php");
$qry=$conn->query("SELECT * FROM  gender");
while ($row=$qry->fetch_assoc()) {
    $Gender[]=$row;
}
echo json_encode(array("Gender"=>$Gender));
?>