<?php
// include_once("../uuid/UuidGenerator.php");
include("../../../includes/config.php");
$query = $conn->query("SELECT ii.*,uom.unit_id,uom.unit_name,concat(ifnull(up.first_name,''), ' ',ifnull(up.middle_name,''),' ',ifnull(up.last_name,'')) as creator FROM inv_item ii INNER JOIN units_of_measure uom ON uom.unit_id=ii.unit_id
INNER JOIN users u ON u.user_id=ii.creator 
INNER JOIN user_profiles up ON up.id=u.profiles_id");
while ($row =$query->fetch_assoc()) {
    $items[]=$row;
}
echo json_encode(array("items"=>$items));
?>