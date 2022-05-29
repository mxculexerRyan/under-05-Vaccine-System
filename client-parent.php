<?php
include "db_connect.php";

//client Detailes
$client_sql = "SELECT  c.*,g.name as gender_name,cl.kijiji,cl.kitongoji,cl.mtaa,bf.name as birth_facilitator_name,bp.name as birth_place_name FROM client c inner join client_location cl on cl.client=c.client_id
INNER JOIN birth_facilitator bf on c.birth_facilitator=bf.facilitator_id
INNER JOIN birth_place bp on bp.place_id=c.birth_place
INNER JOIN gender g on c.gender=g.gender_id";
$client_name = $conn->query($client_sql);
while ($row=$client_name->fetch_assoc()):
    $client_data[$row['client_id']]=$row;
endwhile;

// unset($row);
//parent details
$parent = $conn->query("SELECT * from   parent p inner join client_parent cp on cp.parent=p.parent_id inner join relationship r on cp.relation=r.relationship_id");
while ($row = $parent->fetch_assoc()) :
  $parent_arr[$row['client']] = $row;
endwhile;
?>