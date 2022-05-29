<?php
include_once("../../../includes/config.php");
$qry=$conn->query("SELECT * FROM  relationship");
while ($row=$qry->fetch_assoc()) {
    $relationship[]=$row;
}
echo json_encode(array("relationship"=>$relationship));
?>