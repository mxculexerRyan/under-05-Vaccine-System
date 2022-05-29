<?php
include_once("../../../includes/config.php");
$qry=$conn->query("SELECT * FROM  birth_place");
while ($row=$qry->fetch_assoc()) {
    $BirthPlace[]=$row;
}
echo json_encode(array("BirthPlace"=>$BirthPlace));
?>