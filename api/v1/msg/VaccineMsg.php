<?php
    function vaccineMsg($parentFullName,$facilityName,$childName,$vaccineDate,$vaccineName){
        $titile="Ndugu,";
        $day=date('l', strtotime($vaccineDate));;
        $msg = "Habaru yako ".$titile."  ".$parentFullName;
        $msg .= "\n";
        $msg .= "Unakumbushwa kutembelea kituo cha Chanjo ".$facilityName;
        $msg .= "\n";
        $msg .= "Siku ya ".$day." tarehe ".$vaccineDate;
        $msg .= "\n";
        $msg .= "ukiwa pamoja na mwanao ".$childName;
        $msg .= "\n";
        $msg .= "Kwa ajili ya kupata Chanjo aina ya ".$vaccineName;
        $msg .= "\n";
        return $msg;
    }
?>