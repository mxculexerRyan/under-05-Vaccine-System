<?php 
// DB credentials.
define('DB_HOST','localhost');
define('DB_USER','root');
define('DB_PASS','');
define('DB_NAME','uvmis');

// Establish database connection.
// try
// {
$conn = mysqli_connect(DB_HOST,DB_USER,DB_PASS,DB_NAME) or die(mysqli_error($conn));

// $dbh = new PDO("mysql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS,array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));
// }
// catch (mysqli_error($e) )
// {
// exit("Error: " . $e->getMessage());
// }
// ?>