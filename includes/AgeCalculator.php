<?php
function ageCalclator($date){
    date_default_timezone_set("Africa/Nairobi");
    $now= new DateTime();
    $dob=new DateTime($date);
    $age=$now->diff($dob);
    return $age;
}
?>