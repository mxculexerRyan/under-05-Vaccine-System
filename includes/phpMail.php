<?php
use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\SMTP;
use PHPMailer\PHPMailer\Exception;


require_once "PHPMailer/PHPMailer.php";
require_once "PHPMailer/Exception.php";
require_once "PHPMailer/SMTP.php";
require_once "PHPMailer/SMTP.php";

$mail= new PHPMailer();

// $mail->SMTPDebug=3;
$mail->isSMTP();
$mail->Host="smtp.gmail.com";
$mail->SMTPAuth=true;
$mail->Username="patrickwillson22@gmail.com";
$mail->Password="mwayingana";
$mail->SMTPSecure="ssl";
$mail->Port=465;
$mail->SMTPSecure="tls";
$mail->Port=587;


$mail->isHTML(true);
$nameq="UNDER FIVE VACCINE (UVMIS)";
$from="patrickwillson22@gmail.com";


?>