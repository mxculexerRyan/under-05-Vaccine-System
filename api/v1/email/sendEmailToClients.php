<?php
include_once('../../../includes/phpMail.php');
include_once("../uuid/UuidGenerator.php");
include("../../../includes/config.php");
include_once("../msg/VaccineMsg.php");

$vaccineMsg=vaccineMsg('juma kaparatu','kiteto','mwanamalundi','2021-01-01','Surua');
// echo $query;
$subjectloan='CHANJO KWA WENYE UMRI WA CHINI YA MIAKA MITANO';
$mail->setFrom($from,$nameq);
$query=$conn->query('SELECT * FROM parent');
while ($mm=$query->fetch_assoc()) {
    $mail->addAddress($mm["email"]);
}
$mail->Subject=$subjectloan;
$mail->Body=$vaccineMsg;
$sendloan=$mail->send();
if ($mail->send()) {
    echo 'kk';
}else {
    echo $mail->send();
    echo $mail->isError();
    echo $mail->ErrorInfo;
}

?>