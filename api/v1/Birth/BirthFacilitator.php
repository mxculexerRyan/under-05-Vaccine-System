<?php
include_once("../../../includes/config.php");
$qry=$conn->query("SELECT * FROM  birth_facilitator");
while ($row=$qry->fetch_assoc()) {
    $BirthFacilitator[]=$row;
}
echo json_encode(array("BirthFacilitator"=>$BirthFacilitator));
?>